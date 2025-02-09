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
        Schema::create('profiles_finder', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('user_id')->index('fk_profile_user_idx');
            $table->string('full_name', 45);
            $table->string('profile_picture', 45)->nullable();
            $table->string('linkedin_url', 45)->nullable();
            $table->string('instagram_url', 45)->nullable();
            $table->text('overview')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
            $table->boolean('profile_completed')->nullable();
            $table->boolean('is_active')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('profiles_finder');
    }
};
