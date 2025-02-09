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
            $table->foreign(['id_courses'], 'FK_courses')->references(['id'])->on('courses')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('profile_education', function (Blueprint $table) {
            $table->dropForeign('FK_courses');
        });
    }
};
