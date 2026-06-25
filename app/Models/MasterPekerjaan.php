<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterPekerjaan extends Model
{
    use HasFactory;

    protected $fillable = [
        'kode_pekerjaan',
        'nama_pekerjaan',
        'total_durasi_hari',
        'keterangan',
    ];

    public function detailPekerjaans()
    {
        return $this->hasMany(DetailPekerjaan::class);
    }
}
