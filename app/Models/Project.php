<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Project extends Model
{
    use HasFactory;

    protected $fillable = [
        'kode_proyek',
        'manager_id',
        'nama_proyek',
        'master_pekerjaan_id', // kept nullable for backward compat
        'lokasi',
        'tanggal_mulai',
        'tanggal_selesai',
        'durasi_hari',
        'status_proyek',
        'progres',
    ];

    // ---- Relations ----

    public function masterPekerjaan()
    {
        return $this->belongsTo(MasterPekerjaan::class);
    }

    /** Multiple master pekerjaan via pivot */
    public function projectMasterPekerjaans()
    {
        return $this->hasMany(ProjectMasterPekerjaan::class)->orderBy('urutan');
    }

    public function masterPekerjaans()
    {
        return $this->belongsToMany(
            MasterPekerjaan::class,
            'project_master_pekerjaans',
            'project_id',
            'master_pekerjaan_id'
        )->withPivot(['urutan', 'tanggal_mulai_rencana', 'tanggal_selesai_rencana'])->orderByPivot('urutan');
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

    public function dailyLogs()
    {
        return $this->hasMany(ProjectDailyLog::class)->orderBy('tanggal', 'desc');
    }

    // ---- Helpers ----

    /** All detail materials from all selected master pekerjaan */
    public function getAllDetailMaterials()
    {
        $masterIds = $this->projectMasterPekerjaans()->pluck('master_pekerjaan_id');
        return DetailMaterial::whereHas('detailPekerjaan', function ($q) use ($masterIds) {
            $q->whereIn('master_pekerjaan_id', $masterIds);
        })->with('detailPekerjaan.masterPekerjaan')->get();
    }

    /** Progres calculated from working days vs total planned days */
    public function hitungProgres()
    {
        $totalHari = $this->durasi_hari;
        if (!$totalHari || $totalHari <= 0) return 0;

        $hariKerja = $this->dailyLogs()->where('status', 'berjalan')->count();
        return min(100, round(($hariKerja / $totalHari) * 100));
    }
}
