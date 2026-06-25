<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->string('rencana_pekerjaan')->nullable()->after('progres');
            $table->unsignedInteger('rencana_durasi')->nullable()->after('rencana_pekerjaan')->comment('Dalam hari');
        });
    }

    public function down(): void
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->dropColumn(['rencana_pekerjaan', 'rencana_durasi']);
        });
    }
};
