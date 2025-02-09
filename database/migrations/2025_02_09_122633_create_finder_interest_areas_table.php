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
        Schema::create('finder_interest_areas', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('id_courses')->nullable()->index('fk_courses_idx');
            $table->integer('id_profiles_finder')->nullable()->index('fk_finder_idx');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finder_interest_areas');
    }
};
