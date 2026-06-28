<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProjectDailyLog extends Model
{
    use HasFactory;

    protected $fillable = [
        'project_id',
        'detail_pekerjaan_id',
        'manager_id',
        'tanggal',
        'status',
        'keterangan',
        'description',
        'photo_path',
    ];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    public function detailPekerjaan()
    {
        return $this->belongsTo(DetailPekerjaan::class);
    }

    public function manager()
    {
        return $this->belongsTo(User::class, 'manager_id');
    }

    public function materialUsages()
    {
        return $this->hasMany(DailyLogMaterial::class, 'project_daily_log_id');
    }

    public function detailPekerjaans()
    {
        return $this->belongsToMany(DetailPekerjaan::class, 'daily_log_detail_pekerjaans');
    }
}
