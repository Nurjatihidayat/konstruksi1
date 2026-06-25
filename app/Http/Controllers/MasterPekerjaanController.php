<?php
namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\MasterPekerjaan;
use App\Models\Project; // ✅ TAMBAHKAN IMPORT
use Illuminate\Http\Request;

class MasterPekerjaanController extends Controller
{
    public function index()
    {
        $masterPekerjaans = MasterPekerjaan::withCount('detailPekerjaans')->orderBy('nama_pekerjaan')->get();
        return view('master_pekerjaans.index', compact('masterPekerjaans'));
    }

    public function create()
    {
        // ✅ GANTI nama_project → nama_proyek
        $projects = Project::orderBy('nama_proyek')->get();
        return view('master_pekerjaans.create', compact('projects'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode_pekerjaan' => 'required|string|max:255|unique:master_pekerjaans,kode_pekerjaan',
            'nama_pekerjaan' => 'required|string|max:255',
            'project_id'     => 'required|exists:projects,id',
            'keterangan'     => 'nullable|string',
        ]);
        MasterPekerjaan::create($request->all());
        return redirect()->route('master-pekerjaans.index')
            ->with('success', 'Master Pekerjaan berhasil ditambahkan.');
    }

    public function show(MasterPekerjaan $masterPekerjaan)
    {
        $masterPekerjaan->load(['detailPekerjaans.detailMaterials']);
        return view('master_pekerjaans.show', compact('masterPekerjaan'));
    }

    public function edit(MasterPekerjaan $masterPekerjaan)
    {
        // ✅ GANTI nama_project → nama_proyek
        $projects = Project::orderBy('nama_proyek')->get();
        return view('master_pekerjaans.edit', compact('masterPekerjaan', 'projects'));
    }

    public function update(Request $request, MasterPekerjaan $masterPekerjaan)
    {
        $request->validate([
            'kode_pekerjaan' => 'required|string|max:255|unique:master_pekerjaans,kode_pekerjaan,' . $masterPekerjaan->id,
            'nama_pekerjaan' => 'required|string|max:255',
            'project_id'     => 'required|exists:projects,id', // ✅ GANTI kategori → project_id
            'keterangan'     => 'nullable|string',
        ]);
        $masterPekerjaan->update($request->all());
        return redirect()->route('master-pekerjaans.show', $masterPekerjaan)
            ->with('success', 'Master Pekerjaan berhasil diperbarui.');
    }

    public function destroy(MasterPekerjaan $masterPekerjaan)
    {
        $masterPekerjaan->delete();
        return redirect()->route('master-pekerjaans.index')
            ->with('success', 'Master Pekerjaan berhasil dihapus.');
    }
}