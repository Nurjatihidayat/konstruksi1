<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProjectDetailPekerjaan extends Model
{
    use HasFactory;

    protected $table = 'project_detail_pekerjaans';

    protected $fillable = [
        'project_id',
        'detail_pekerjaan_id',
    ];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    public function detailPekerjaan()
    {
        return $this->belongsTo(DetailPekerjaan::class);
    }
}
