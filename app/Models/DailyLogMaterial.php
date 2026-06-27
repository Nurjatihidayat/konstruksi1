<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DailyLogMaterial extends Model
{
    use HasFactory;

    protected $table = 'daily_log_materials';

    protected $fillable = [
        'project_daily_log_id',
        'material_id',
        'quantity_used',
    ];

    public function dailyLog()
    {
        return $this->belongsTo(ProjectDailyLog::class, 'project_daily_log_id');
    }

    public function material()
    {
        return $this->belongsTo(Material::class);
    }
}
