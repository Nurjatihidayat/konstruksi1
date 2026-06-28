<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('project_detail_pekerjaans', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_id')->constrained('projects')->cascadeOnDelete();
            $table->foreignId('detail_pekerjaan_id')->constrained('detail_pekerjaans')->cascadeOnDelete();
            $table->timestamps();
        });

        // Seed existing projects: bind all detail_pekerjaans of selected master_pekerjaans
        $pmpList = \DB::table('project_master_pekerjaans')->get();
        foreach ($pmpList as $pmp) {
            $details = \DB::table('detail_pekerjaans')
                ->where('master_pekerjaan_id', $pmp->master_pekerjaan_id)
                ->pluck('id');
            
            foreach ($details as $did) {
                \DB::table('project_detail_pekerjaans')->insert([
                    'project_id'          => $pmp->project_id,
                    'detail_pekerjaan_id' => $did,
                    'created_at'          => now(),
                    'updated_at'          => now(),
                ]);
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_detail_pekerjaans');
    }
};
