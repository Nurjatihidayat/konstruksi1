<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('master_pekerjaans')) {
            Schema::create('master_pekerjaans', function (Blueprint $table) {
                $table->id();
                $table->string('nama_pekerjaan');
                $table->unsignedInteger('durasi_pekerjaan')->default(0)->comment('Estimasi hari');
                $table->text('keterangan')->nullable();
                $table->enum('status', ['aktif', 'nonaktif'])->default('aktif');
                $table->timestamps();
            });
        }

    }

    public function down(): void
    {
        Schema::dropIfExists('master_pekerjaans');
    }
};
