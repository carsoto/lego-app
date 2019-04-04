<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRoleUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('role_user', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('role_id')->unsigned();
            $table->integer('user_id')->unique()->unsigned();

            $table->index('role_id','fk_role_user_roles_idx');
            $table->index('user_id','fk_role_user_users1_idx');
        
            $table->foreign('role_id')
                ->references('id')->on('roles');
        
            $table->foreign('user_id')
                ->references('id')->on('users');

            $table->timestamps();  
        
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('role_user');
    }
}
