<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstituteBranchesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('institute_branches', function (Blueprint $table) {
            $table->id();
            $table->string('name',100);
            $table->string('coaching_name',100)->nullable();
            $table->bigInteger('district_id')->nullable();
            $table->bigInteger('division_id')->nullable();
            $table->bigInteger('upozila_id')->nullable();
            $table->string('branch_code',100)->nullable();
            $table->string('street',50)->nullable();
            $table->string('city',50)->nullable();
            $table->string('state',50)->nullable();
            $table->string('zip_code',50)->nullable();
            $table->string('country',50)->nullable();
            $table->string('district',50)->nullable();
            $table->string('division',50)->nullable();
            $table->string('invoice_name',50)->nullable();
            $table->string('invoice_address',50)->nullable();
            $table->string('invoice_email',50)->nullable();
            $table->string('invoice_mobile_number',50)->nullable();
            $table->text('map_link')->nullable();
            $table->text('image')->nullable();
            $table->bigInteger('creator')->nullable();
            
            $table->string('slug',100)->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });

        Schema::create('institute_branch_admin', function (Blueprint $table) {
			$table->id();
			$table->bigInteger('institue_branch_id')->unsigned();
			$table->bigInteger('user_id')->unsigned();
		});

        Schema::create('institute_branch_user', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('institute_branch_id')->unsigned();
            $table->bigInteger('user_id')->unsigned();
            $table->timestamps();
        });

        Schema::create('institute_branch_institute_student', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('institute_branch_id')->unsigned()->nullable();
            $table->bigInteger('institute_student_id')->unsigned()->nullable();
        });
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('institute_branches');
        Schema::dropIfExists('institute_branch_admin');
        Schema::dropIfExists('institute_branch_user');
        Schema::dropIfExists('institute_branch_institute_student');
    }
}
