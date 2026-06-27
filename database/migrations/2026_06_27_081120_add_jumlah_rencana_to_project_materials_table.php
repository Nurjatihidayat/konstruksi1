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
        Schema::table('project_materials', function (Blueprint $table) {
            if (!Schema::hasColumn('project_materials', 'jumlah_rencana')) {
                $table->decimal('jumlah_rencana', 10, 2)->default(0)->after('material_id');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('project_materials', function (Blueprint $table) {
            $table->dropColumn('jumlah_rencana');
        });
    }
};
