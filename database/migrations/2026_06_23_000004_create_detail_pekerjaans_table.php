<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('detail_pekerjaans')) {
            Schema::create('detail_pekerjaans', function (Blueprint $table) {
                $table->id();
                $table->foreignId('kategori_pekerjaan_id')->constrained('kategori_pekerjaans')->onDelete('cascade');
                $table->string('nama_detail_pekerjaan');
                $table->unsignedInteger('durasi')->nullable()->comment('Estimasi hari');
                $table->text('keterangan')->nullable();
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('detail_pekerjaans');
    }
};
