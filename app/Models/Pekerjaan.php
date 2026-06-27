<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pekerjaan extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'project_id',
        'master_pekerjaan_id',
        'manager_id',
        'tanggal_mulai',
        'tanggal_selesai',
        'durasi_rencana',
        'status',
        'progres',
        'catatan',
    ];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    public function masterPekerjaan()
    {
        return $this->belongsTo(MasterPekerjaan::class);
    }

    public function manager()
    {
        return $this->belongsTo(User::class, 'manager_id');
    }

    public function gudang()
    {
        return $this->belongsTo(User::class, 'gudang_id');
    }

    // Relasi ke detail pekerjaan yang dipilih
    public function detailPekerjaans()
    {
        return $this->hasMany(DetailPekerjaanPilihan::class, 'pekerjaan_id');
    }
}