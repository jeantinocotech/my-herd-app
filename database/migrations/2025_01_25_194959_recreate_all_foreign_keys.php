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
            $table->foreign('id_profile_advisor')->references('id')->on('profiles_advisor')->onDelete('cascade');
            $table->foreign('Id_education')->references('id')->on('education')->onDelete('cascade');
        });

        Schema::table('education', function (Blueprint $table) {
            $table->foreign('Id_courses')->references('id')->on('courses')->onDelete('cascade');
        });

        // Add more tables and foreign keys as needed
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('profile_education', function (Blueprint $table) {
            $table->dropForeign(['id_profile_advisor']);
            $table->dropForeign(['Id_education']);
        });

        Schema::table('education', function (Blueprint $table) {
            $table->dropForeign(['Id_courses']);
        });
    }
};
