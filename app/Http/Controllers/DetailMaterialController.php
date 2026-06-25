<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\DetailMaterial;
use App\Models\DetailPekerjaan;
use Illuminate\Http\Request;

class DetailMaterialController extends Controller
{
    public function store(Request $request, DetailPekerjaan $detailPekerjaan)
    {
        $request->validate([
            'nama_material' => 'required|string|max:255',
            'spesifikasi'   => 'nullable|string|max:255',
            'qty'           => 'required|numeric|min:0',
            'satuan'        => 'nullable|string|max:50',
            'keterangan'    => 'nullable|string',
        ]);

        $detailPekerjaan->detailMaterials()->create($request->all());

        $masterPekerjaanId = $detailPekerjaan->master_pekerjaan_id;
        return redirect()->route('master-pekerjaans.show', $masterPekerjaanId)
            ->with('success', 'Detail Material berhasil ditambahkan.');
    }

    public function update(Request $request, DetailPekerjaan $detailPekerjaan, DetailMaterial $material)
    {
        $request->validate([
            'nama_material' => 'required|string|max:255',
            'spesifikasi'   => 'nullable|string|max:255',
            'qty'           => 'required|numeric|min:0',
            'satuan'        => 'nullable|string|max:50',
            'keterangan'    => 'nullable|string',
        ]);

        $material->update($request->all());

        $masterPekerjaanId = $detailPekerjaan->master_pekerjaan_id;
        return redirect()->route('master-pekerjaans.show', $masterPekerjaanId)
            ->with('success', 'Detail Material berhasil diperbarui.');
    }

    public function destroy(DetailPekerjaan $detailPekerjaan, DetailMaterial $material)
    {
        $masterPekerjaanId = $detailPekerjaan->master_pekerjaan_id;
        $material->delete();
        return redirect()->route('master-pekerjaans.show', $masterPekerjaanId)
            ->with('success', 'Detail Material berhasil dihapus.');
    }
}
