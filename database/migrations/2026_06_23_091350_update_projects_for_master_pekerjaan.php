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
        Schema::table('projects', function (Blueprint $table) {
            // Drop old columns if they exist
            if (Schema::hasColumn('projects', 'rencana_pekerjaan')) {
                $table->dropColumn('rencana_pekerjaan');
            }
            if (Schema::hasColumn('projects', 'rencana_durasi')) {
                $table->dropColumn('rencana_durasi');
            }
            
            // Add new columns
            if (!Schema::hasColumn('projects', 'kode_proyek')) {
                $table->string('kode_proyek')->nullable()->after('id');
            }
            if (!Schema::hasColumn('projects', 'master_pekerjaan_id')) {
                $table->foreignId('master_pekerjaan_id')->nullable()->after('nama_proyek')->constrained('master_pekerjaans')->nullOnDelete();
            }
            if (!Schema::hasColumn('projects', 'durasi_hari')) {
                $table->integer('durasi_hari')->default(0)->after('tanggal_selesai');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->dropForeign(['master_pekerjaan_id']);
            $table->dropColumn(['kode_proyek', 'master_pekerjaan_id', 'durasi_hari']);
            $table->string('rencana_pekerjaan')->nullable();
            $table->integer('rencana_durasi')->nullable();
        });
    }
};
