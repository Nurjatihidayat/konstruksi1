<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('kategori_pekerjaans')) {
            Schema::create('kategori_pekerjaans', function (Blueprint $table) {
                $table->id();
                $table->foreignId('master_pekerjaan_id')->constrained('master_pekerjaans')->onDelete('cascade');
                $table->string('nama_kategori');
                $table->unsignedInteger('durasi')->nullable()->comment('Estimasi hari');
                $table->text('keterangan')->nullable();
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('kategori_pekerjaans');
    }
};
