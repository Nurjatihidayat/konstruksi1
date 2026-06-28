<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\ProjectDailyLog;
use App\Models\DailyLogMaterial;
use App\Models\ProjectMaterial;
use App\Models\ActivityLog;

class ProjectDailyLogController extends Controller
{
    public function store(Request $request, Project $project)
    {
        $user = auth()->user();

        // Authorization
        if (!in_array($user->role, ['manajer', 'admin'])) abort(403);
        if ($user->role == 'manajer' && $project->manager_id != $user->id) abort(403);

        $request->validate([
            'detail_pekerjaan_ids'   => 'required|array|min:1',
            'detail_pekerjaan_ids.*' => 'exists:detail_pekerjaans,id',
            'tanggal'     => 'required|date',
            'status'      => 'required|in:berjalan,libur',
            'keterangan'  => 'nullable|string|max:500',
            'description' => 'nullable|string',
            'photo'       => 'nullable|image|max:3072',
        ]);

        $photoPath = null;
        if ($request->hasFile('photo')) {
            $photoPath = $request->file('photo')->store('daily_logs', 'public');
        }

        // Create or update log for that date
        $log = ProjectDailyLog::updateOrCreate(
            ['project_id' => $project->id, 'tanggal' => $request->tanggal],
            [
                'manager_id'  => $user->id,
                'status'      => $request->status,
                'keterangan'  => $request->keterangan,
                'description' => $request->description,
                'photo_path'  => $photoPath ?? null,
            ]
        );

        // Sync selected sub-pekerjaan
        $log->detailPekerjaans()->sync($request->detail_pekerjaan_ids);

        // Process material usage (only if status is 'berjalan')
        if ($request->status === 'berjalan' && $request->has('materials')) {
            // Delete old usages for this log
            $log->materialUsages()->delete();

            foreach ($request->materials as $matData) {
                if (!empty($matData['material_id']) && !empty($matData['quantity']) && $matData['quantity'] > 0) {
                    DailyLogMaterial::create([
                        'project_daily_log_id' => $log->id,
                        'material_id'          => $matData['material_id'],
                        'quantity_used'        => $matData['quantity'],
                    ]);

                    // Deduct from project material stock
                    $pm = ProjectMaterial::where('project_id', $project->id)
                        ->where('material_id', $matData['material_id'])
                        ->first();
                    if ($pm) {
                        $pm->jumlah_tersedia = max(0, $pm->jumlah_tersedia - $matData['quantity']);
                        $pm->save();
                    }
                }
            }
        }

        // Recalculate project progress
        $totalHari = $project->durasi_hari ?: 1;
        $hariKerja = ProjectDailyLog::where('project_id', $project->id)->where('status', 'berjalan')->count();
        $progres   = min(100, round(($hariKerja / $totalHari) * 100));
        $project->update([
            'progres'      => $progres,
            'status_proyek' => $progres >= 100 ? 'selesai' : 'berjalan',
        ]);

        ActivityLog::create([
            'user_id'     => $user->id,
            'description' => 'Update log harian proyek ' . $project->nama_proyek . ' tanggal ' . $request->tanggal . ' - Status: ' . $request->status,
        ]);

        return back()->with('success', 'Log harian berhasil disimpan. Progres: ' . $progres . '%');
    }
}
