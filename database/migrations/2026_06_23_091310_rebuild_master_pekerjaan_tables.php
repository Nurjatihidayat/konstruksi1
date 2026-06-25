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
        Schema::disableForeignKeyConstraints();

        // Drop existing tables if they exist
        Schema::dropIfExists('detail_materials');
        Schema::dropIfExists('detail_pekerjaans');
        Schema::dropIfExists('kategori_pekerjaans');
        Schema::dropIfExists('master_pekerjaans');

        Schema::enableForeignKeyConstraints();

        // Create new master_pekerjaans table
        Schema::create('master_pekerjaans', function (Blueprint $table) {
            $table->id();
            $table->string('kode_pekerjaan')->unique();
            $table->string('nama_pekerjaan');
            $table->string('kategori');
            $table->integer('total_durasi_hari')->default(0);
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });

        // Create new detail_pekerjaans table
        Schema::create('detail_pekerjaans', function (Blueprint $table) {
            $table->id();
            $table->foreignId('master_pekerjaan_id')->constrained('master_pekerjaans')->cascadeOnDelete();
            $table->string('nama_detail_pekerjaan');
            $table->integer('durasi_hari')->default(0);
            $table->string('satuan')->nullable();
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });

        // Create new detail_materials table
        Schema::create('detail_materials', function (Blueprint $table) {
            $table->id();
            $table->foreignId('detail_pekerjaan_id')->constrained('detail_pekerjaans')->cascadeOnDelete();
            $table->string('nama_material');
            $table->string('spesifikasi')->nullable();
            $table->decimal('qty', 10, 2)->default(0);
            $table->string('satuan')->nullable();
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('detail_materials');
        Schema::dropIfExists('detail_pekerjaans');
        Schema::dropIfExists('master_pekerjaans');
        Schema::enableForeignKeyConstraints();
    }
};
