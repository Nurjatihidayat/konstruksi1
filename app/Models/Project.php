<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    protected $fillable = [
        'kode_proyek',
        'manager_id',
        'nama_proyek',
        'master_pekerjaan_id',
        'lokasi',
        'tanggal_mulai',
        'tanggal_selesai',
        'durasi_hari',
        'status_proyek',
        'progres',
    ];

    public function masterPekerjaan()
    {
        return $this->belongsTo(MasterPekerjaan::class);
    }

    public function projectMaterials()
    {
        return $this->hasMany(ProjectMaterial::class);
    }

    public function manager()
    {
        return $this->belongsTo(User::class, 'manager_id');
    }

    public function progressUpdates()
    {
        return $this->hasMany(ProjectProgressUpdate::class)->latest();
    }
}
