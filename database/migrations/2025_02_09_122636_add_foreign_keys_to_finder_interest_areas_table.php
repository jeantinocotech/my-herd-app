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
        Schema::table('finder_interest_areas', function (Blueprint $table) {
            $table->foreign(['id_courses'], 'FK_courses_finder_areas')->references(['id'])->on('courses')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['id_profiles_finder'], 'FK_finder_areas')->references(['id'])->on('profiles_finder')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finder_interest_areas', function (Blueprint $table) {
            $table->dropForeign('FK_courses_finder_areas');
            $table->dropForeign('FK_finder_areas');
        });
    }
};
