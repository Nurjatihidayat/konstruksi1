<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('project_daily_logs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_id')->constrained('projects')->cascadeOnDelete();
            $table->foreignId('manager_id')->constrained('users')->cascadeOnDelete();
            $table->date('tanggal');
            $table->enum('status', ['berjalan', 'libur'])->default('berjalan');
            $table->text('keterangan')->nullable(); // e.g. "Hujan deras", "Libur nasional"
            // material usage
            $table->text('description')->nullable();
            $table->string('photo_path')->nullable();
            $table->timestamps();

            $table->unique(['project_id', 'tanggal']); // 1 log per hari per proyek
        });

        // Material usages per daily log
        Schema::create('daily_log_materials', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_daily_log_id')->constrained('project_daily_logs')->cascadeOnDelete();
            $table->foreignId('material_id')->constrained('materials')->cascadeOnDelete();
            $table->decimal('quantity_used', 10, 2)->default(0);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('daily_log_materials');
        Schema::dropIfExists('project_daily_logs');
    }
};
