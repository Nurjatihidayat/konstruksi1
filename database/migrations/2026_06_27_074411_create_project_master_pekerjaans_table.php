<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('project_master_pekerjaans', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_id')->constrained('projects')->cascadeOnDelete();
            $table->foreignId('master_pekerjaan_id')->constrained('master_pekerjaans')->cascadeOnDelete();
            $table->integer('urutan')->default(1); // urutan pelaksanaan
            $table->date('tanggal_mulai_rencana')->nullable();
            $table->date('tanggal_selesai_rencana')->nullable();
            $table->timestamps();
        });

        // Migrate existing data from projects.master_pekerjaan_id
        $projects = \DB::table('projects')->whereNotNull('master_pekerjaan_id')->get();
        foreach ($projects as $project) {
            \DB::table('project_master_pekerjaans')->insert([
                'project_id'           => $project->id,
                'master_pekerjaan_id'  => $project->master_pekerjaan_id,
                'urutan'               => 1,
                'tanggal_mulai_rencana'  => $project->tanggal_mulai,
                'tanggal_selesai_rencana'=> $project->tanggal_selesai,
                'created_at'           => now(),
                'updated_at'           => now(),
            ]);
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('project_master_pekerjaans');
    }
};
