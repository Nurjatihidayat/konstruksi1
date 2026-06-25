<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailPekerjaan extends Model
{
    use HasFactory;

    protected $fillable = [
        'master_pekerjaan_id',
        'nama_detail_pekerjaan',
        'durasi_hari',
        'satuan',
        'keterangan',
    ];

    public function masterPekerjaan()
    {
        return $this->belongsTo(MasterPekerjaan::class);
    }

    public function detailMaterials()
    {
        return $this->hasMany(DetailMaterial::class);
    }
}
