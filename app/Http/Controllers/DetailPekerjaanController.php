<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\DetailPekerjaan;
use App\Models\MasterPekerjaan;
use Illuminate\Http\Request;

class DetailPekerjaanController extends Controller
{
    public function store(Request $request, MasterPekerjaan $masterPekerjaan)
    {
        $request->validate([
            'nama_detail_pekerjaan' => 'required|string|max:255',
            'durasi_hari'           => 'required|integer|min:0',
            'satuan'                => 'nullable|string|max:255',
            'keterangan'            => 'nullable|string',
        ]);

        $masterPekerjaan->detailPekerjaans()->create($request->all());

        return redirect()->route('master-pekerjaans.show', $masterPekerjaan)
            ->with('success', 'Detail Pekerjaan berhasil ditambahkan.');
    }

    public function update(Request $request, MasterPekerjaan $masterPekerjaan, DetailPekerjaan $detail)
    {
        $request->validate([
            'nama_detail_pekerjaan' => 'required|string|max:255',
            'durasi_hari'           => 'required|integer|min:0',
            'satuan'                => 'nullable|string|max:255',
            'keterangan'            => 'nullable|string',
        ]);

        $detail->update($request->all());

        return redirect()->route('master-pekerjaans.show', $masterPekerjaan)
            ->with('success', 'Detail Pekerjaan berhasil diperbarui.');
    }

    public function destroy(MasterPekerjaan $masterPekerjaan, DetailPekerjaan $detail)
    {
        $detail->delete();
        return redirect()->route('master-pekerjaans.show', $masterPekerjaan)
            ->with('success', 'Detail Pekerjaan berhasil dihapus.');
    }
}
