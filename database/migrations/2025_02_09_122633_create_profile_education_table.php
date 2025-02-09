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
        Schema::create('profile_education', function (Blueprint $table) {
            $table->integer('id_profiles_education', true);
            $table->integer('id_profiles_advisor')->nullable()->index('fk_profile_advisor_idx');
            $table->integer('id_profiles_finder')->nullable()->index('fk_profiles_finder_idx');
            $table->integer('id_courses')->nullable()->index('fk_courses');
            $table->string('institution_name', 45)->nullable();
            $table->string('certification', 45)->nullable();
            $table->date('dt_start')->nullable();
            $table->date('dt_end')->nullable();
            $table->text('comments')->nullable();
            $table->dateTime('created_at')->nullable()->comment('		');
            $table->dateTime('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('profile_education');
    }
};
