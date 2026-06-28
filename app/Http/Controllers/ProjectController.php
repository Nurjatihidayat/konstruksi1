<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Project;
use App\Models\User;
use App\Models\ActivityLog;
use App\Models\MasterPekerjaan;
use App\Models\ProjectMasterPekerjaan;
use App\Models\Material;
use Carbon\Carbon;

class ProjectController extends Controller
{
    public function index()
    {
        $user = auth()->user();
        if ($user->role == 'admin') {
            $projects = Project::with('manager')->get();
        } elseif ($user->role == 'gudang') {
            $projects = Project::with('manager')->where('id', $user->assigned_project_id)->get();
        } else { // manajer
            $projects = Project::with('manager')->where('manager_id', $user->id)->get();
        }
        return view('projects.index', compact('projects'));
    }

    public function create()
    {
        $managers = User::where('role', 'manajer')->get();
        $masterPekerjaans = MasterPekerjaan::with('detailPekerjaans.detailMaterials')
            ->orderBy('nama_pekerjaan')->get();
        return view('projects.create', compact('managers', 'masterPekerjaans'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode_proyek'              => 'nullable|string|max:255',
            'nama_proyek'              => 'required',
            'lokasi'                   => 'required',
            'tanggal_mulai'            => 'required|date',
            'manager_id'               => 'required|exists:users,id',
            'master_pekerjaan_ids'     => 'required|array|min:1',
            'master_pekerjaan_ids.*'   => 'exists:master_pekerjaans,id',
            'detail_pekerjaan_ids'     => 'required|array|min:1',
            'detail_pekerjaan_ids.*'   => 'exists:detail_pekerjaans,id',
        ]);

        $kodeProyek = $request->input('kode_proyek');
        if (empty($kodeProyek)) {
            $kodeProyek = 'PRJ-' . strtoupper(Str::random(5));
        }

        // Ambil semua detail pekerjaan terpilih beserta durasinya
        $detailIds = $request->detail_pekerjaan_ids;
        $details   = \App\Models\DetailPekerjaan::whereIn('id', $detailIds)->get()->keyBy('id');
        
        // Hitung total durasi berdasarkan durasi detail pekerjaan terpilih
        $totalDurasi = 0;
        foreach ($detailIds as $did) {
            $totalDurasi += $details[$did]->durasi_hari ?? 0;
        }

        $tanggalMulai   = Carbon::parse($request->tanggal_mulai);
        $tanggalSelesai = $tanggalMulai->copy()->addDays($totalDurasi);

        $project = Project::create([
            'kode_proyek'     => $kodeProyek,
            'nama_proyek'     => $request->nama_proyek,
            'lokasi'          => $request->lokasi,
            'tanggal_mulai'   => $request->tanggal_mulai,
            'tanggal_selesai' => $tanggalSelesai->toDateString(),
            'manager_id'      => $request->manager_id,
            'durasi_hari'     => $totalDurasi,
            'progres'         => 0,
            'status_proyek'   => 'berjalan',
        ]);

        // Simpan pivot project_master_pekerjaans
        $masterIds = $request->master_pekerjaan_ids;
        $masters   = MasterPekerjaan::whereIn('id', $masterIds)->get()->keyBy('id');
        $cursor    = Carbon::parse($request->tanggal_mulai);

        foreach ($masterIds as $urutan => $mid) {
            // Durasi master pekerjaan di proyek ini dihitung hanya dari detail pekerjaan terpilih di dalam master ini
            $masterDetails = \App\Models\DetailPekerjaan::where('master_pekerjaan_id', $mid)
                ->whereIn('id', $detailIds)
                ->get();
            
            $masterDurasi = $masterDetails->sum('durasi_hari');
            $tglMulai     = $cursor->copy();
            $tglSelesai   = $cursor->copy()->addDays($masterDurasi);

            ProjectMasterPekerjaan::create([
                'project_id'              => $project->id,
                'master_pekerjaan_id'     => $mid,
                'urutan'                  => $urutan + 1,
                'tanggal_mulai_rencana'   => $tglMulai->toDateString(),
                'tanggal_selesai_rencana' => $tglSelesai->toDateString(),
            ]);

            $cursor->addDays($masterDurasi);
        }

        // Simpan detail pekerjaan yang terpilih
        foreach ($detailIds as $did) {
            \App\Models\ProjectDetailPekerjaan::create([
                'project_id'          => $project->id,
                'detail_pekerjaan_id' => $did,
            ]);
        }

        // Auto-populate project materials only from selected detail_pekerjaans
        $this->populateProjectMaterials($project, $detailIds);

        ActivityLog::create([
            'user_id'     => auth()->id(),
            'description' => 'Membuat proyek baru dengan detail pekerjaan terpilih: ' . $project->nama_proyek,
        ]);

        return redirect()->route('projects.index')->with('success', 'Proyek berhasil dibuat.');
    }

    /** Auto-populate project materials from detail_materials of selected detail_pekerjaans */
    private function populateProjectMaterials(Project $project, array $detailPekerjaanIds)
    {
        $detailMaterials = \App\Models\DetailMaterial::whereIn('detail_pekerjaan_id', $detailPekerjaanIds)->get();

        // Group by nama_material to avoid duplicates
        $grouped = [];
        foreach ($detailMaterials as $dm) {
            $key = strtolower(trim($dm->nama_material));
            if (!isset($grouped[$key])) {
                $material = Material::where('nama_material', $dm->nama_material)->first();
                if ($material) {
                    $grouped[$key] = ['material_id' => $material->id, 'qty' => $dm->qty, 'satuan' => $dm->satuan];
                }
            } else {
                $grouped[$key]['qty'] += $dm->qty;
            }
        }

        foreach ($grouped as $item) {
            \App\Models\ProjectMaterial::firstOrCreate(
                ['project_id' => $project->id, 'material_id' => $item['material_id']],
                [
                    'jumlah_rencana'   => $item['qty'],
                    'jumlah_tersedia'  => 0,
                    'jumlah_terkirim'  => 0,
                    'created_at'       => now(),
                    'updated_at'       => now(),
                ]
            );
        }
    }

    public function show(string $id)
    {
        $project = Project::with([
            'projectMasterPekerjaans.masterPekerjaan.detailPekerjaans.detailMaterials',
            'projectMaterials.material',
            'manager',
            'dailyLogs.materialUsages.material',
            'dailyLogs.manager',
            'dailyLogs.detailPekerjaans',
        ])->findOrFail($id);

        if (auth()->user()->role == 'gudang' && $project->id != auth()->user()->assigned_project_id) {
            abort(403, 'Akses ditolak.');
        }

        // Calculate progress from daily logs
        $totalHari  = $project->durasi_hari ?: 1;
        $hariKerja  = $project->dailyLogs()->where('status', 'berjalan')->count();
        $progresOtomatis = min(100, round(($hariKerja / $totalHari) * 100));

        // Materials for usage form (from project materials)
        $projectMaterials = $project->projectMaterials->load('material');

        return view('projects.show', compact('project', 'progresOtomatis', 'projectMaterials'));
    }

    public function edit(string $id)
    {
        $project  = Project::with('projectMasterPekerjaans')->findOrFail($id);
        $managers = User::where('role', 'manajer')->get();
        $masterPekerjaans = MasterPekerjaan::orderBy('nama_pekerjaan')->get();
        $selectedIds = $project->projectMasterPekerjaans->pluck('master_pekerjaan_id')->toArray();
        return view('projects.edit', compact('project', 'managers', 'masterPekerjaans', 'selectedIds'));
    }

    public function update(Request $request, string $id)
    {
        $request->validate([
            'nama_proyek'    => 'required',
            'lokasi'         => 'required',
            'tanggal_mulai'  => 'required|date',
            'manager_id'     => 'required|exists:users,id',
        ]);

        $project = Project::findOrFail($id);

        if (auth()->user()->role == 'manajer' && $project->manager_id != auth()->id()) {
            abort(403);
        }

        $project->update($request->only(['nama_proyek', 'lokasi', 'tanggal_mulai', 'manager_id']));

        ActivityLog::create([
            'user_id'     => auth()->id(),
            'description' => 'Memperbarui proyek: ' . $project->nama_proyek,
        ]);

        return redirect()->route('projects.index')->with('success', 'Proyek berhasil diperbarui.');
    }

    public function destroy(string $id)
    {
        $project = Project::findOrFail($id);

        if (auth()->user()->role == 'gudang' || auth()->user()->role == 'manajer') {
            abort(403, 'Anda tidak memiliki wewenang untuk menghapus proyek.');
        }

        $nama = $project->nama_proyek;
        $project->delete();

        ActivityLog::create([
            'user_id'     => auth()->id(),
            'description' => 'Menghapus proyek: ' . $nama,
        ]);

        return redirect()->route('projects.index')->with('success', 'Proyek berhasil dihapus.');
    }
}
