<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailMaterial extends Model
{
    use HasFactory;

    protected $fillable = [
        'detail_pekerjaan_id',
        'nama_material',
        'spesifikasi',
        'qty',
        'satuan',
        'keterangan',
    ];

    public function detailPekerjaan()
    {
        return $this->belongsTo(DetailPekerjaan::class);
    }
}
