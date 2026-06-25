<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('detail_materials')) {
            Schema::create('detail_materials', function (Blueprint $table) {
                $table->id();
                $table->foreignId('detail_pekerjaan_id')->constrained('detail_pekerjaans')->onDelete('cascade');
                $table->string('nama_material');
                $table->string('satuan');
                $table->decimal('qty_standar', 10, 2)->default(0);
                $table->text('keterangan')->nullable();
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('detail_materials');
    }
};
