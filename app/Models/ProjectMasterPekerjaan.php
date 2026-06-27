<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProjectMasterPekerjaan extends Model
{
    use HasFactory;

    protected $table = 'project_master_pekerjaans';

    protected $fillable = [
        'project_id',
        'master_pekerjaan_id',
        'urutan',
        'tanggal_mulai_rencana',
        'tanggal_selesai_rencana',
    ];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    public function masterPekerjaan()
    {
        return $this->belongsTo(MasterPekerjaan::class);
    }
}
