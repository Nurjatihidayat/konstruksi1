<?php
namespace App\Http\Controllers;
use App\Models\Pekerjaan;
use App\Models\MasterPekerjaan;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PekerjaanController extends Controller
{
    public function index()
    {
        // Manajer hanya lihat pekerjaan mereka
        $user = Auth::user();
        
        if ($user->role === 'admin') {
            $pekerjaans = Pekerjaan::with(['project', 'masterPekerjaan', 'manager'])->orderBy('created_at', 'desc')->get();
        } else {
            $pekerjaans = Pekerjaan::with(['project', 'masterPekerjaan', 'manager'])
                ->where('manager_id', $user->id)
                ->orderBy('created_at', 'desc')
                ->get();
        }
        
        return view('pekerjaans.index', compact('pekerjaans'));
    }

    public function create()
    {
        $projects = Project::orderBy('nama_proyek')->get();
        $masterPekerjaans = MasterPekerjaan::with('detailPekerjaans.detailMaterials')
            ->orderBy('nama_pekerjaan')
            ->get();
        
        return view('pekerjaans.create', compact('projects', 'masterPekerjaans'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'project_id' => 'required|exists:projects,id',
            'master_pekerjaan_id' => 'required|exists:master_pekerjaans,id',
            'tanggal_mulai' => 'required|date',
            'tanggal_selesai' => 'required|date|after:tanggal_mulai',
            'catatan' => 'nullable|string',
        ]);

        // Hitung durasi
        $tanggalMulai = \Carbon\Carbon::parse($request->tanggal_mulai);
        $tanggalSelesai = \Carbon\Carbon::parse($request->tanggal_selesai);
        $durasi = $tanggalMulai->diffInDays($tanggalSelesai) + 1;

        Pekerjaan::create([
            'project_id' => $request->project_id,
            'master_pekerjaan_id' => $request->master_pekerjaan_id,
            'manager_id' => Auth::id(),
            'tanggal_mulai' => $request->tanggal_mulai,
            'tanggal_selesai' => $request->tanggal_selesai,
            'durasi_rencana' => $durasi,
            'status' => 'belum_mulai',
            'progres' => 0,
            'catatan' => $request->catatan,
        ]);

        return redirect()->route('pekerjaans.index')
            ->with('success', 'Pekerjaan berhasil ditambahkan.');
    }

    public function show(Pekerjaan $pekerjaan)
    {
        $pekerjaan->load(['project', 'masterPekerjaan.detailPekerjaans.detailMaterials', 'manager']);
        return view('pekerjaans.show', compact('pekerjaan'));
    }

    public function edit(Pekerjaan $pekerjaan)
    {
        // Cek authorization
        if (Auth::user()->role !== 'admin' && $pekerjaan->manager_id !== Auth::id()) {
            abort(403);
        }

        $projects = Project::orderBy('nama_proyek')->get();
        $masterPekerjaans = MasterPekerjaan::with('detailPekerjaans.detailMaterials')
            ->orderBy('nama_pekerjaan')
            ->get();
        
        return view('pekerjaans.edit', compact('pekerjaan', 'projects', 'masterPekerjaans'));
    }

    public function update(Request $request, Pekerjaan $pekerjaan)
    {
        // Cek authorization
        if (Auth::user()->role !== 'admin' && $pekerjaan->manager_id !== Auth::id()) {
            abort(403);
        }

        $request->validate([
            'project_id' => 'required|exists:projects,id',
            'master_pekerjaan_id' => 'required|exists:master_pekerjaans,id',
            'tanggal_mulai' => 'required|date',
            'tanggal_selesai' => 'required|date|after:tanggal_mulai',
            'status' => 'required|in:belum_mulai,berjalan,selesai,tertunda',
            'progres' => 'required|integer|min:0|max:100',
            'catatan' => 'nullable|string',
        ]);

        // Hitung durasi
        $tanggalMulai = \Carbon\Carbon::parse($request->tanggal_mulai);
        $tanggalSelesai = \Carbon\Carbon::parse($request->tanggal_selesai);
        $durasi = $tanggalMulai->diffInDays($tanggalSelesai) + 1;

        $pekerjaan->update([
            'project_id' => $request->project_id,
            'master_pekerjaan_id' => $request->master_pekerjaan_id,
            'tanggal_mulai' => $request->tanggal_mulai,
            'tanggal_selesai' => $request->tanggal_selesai,
            'durasi_rencana' => $durasi,
            'status' => $request->status,
            'progres' => $request->progres,
            'catatan' => $request->catatan,
        ]);

        return redirect()->route('pekerjaans.show', $pekerjaan)
            ->with('success', 'Pekerjaan berhasil diperbarui.');
    }

    public function destroy(Pekerjaan $pekerjaan)
    {
        // Cek authorization
        if (Auth::user()->role !== 'admin' && $pekerjaan->manager_id !== Auth::id()) {
            abort(403);
        }

        $pekerjaan->delete();
        return redirect()->route('pekerjaans.index')
            ->with('success', 'Pekerjaan berhasil dihapus.');
    }
}