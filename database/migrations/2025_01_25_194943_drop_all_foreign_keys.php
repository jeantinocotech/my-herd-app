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
        Schema::table('profile_education', function (Blueprint $table) {
            $table->dropForeign(['id_profile_advisor']);
            $table->dropForeign(['Id_education']);
        });

        Schema::table('education', function (Blueprint $table) {
            $table->dropForeign(['Id_courses']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
