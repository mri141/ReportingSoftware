<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->id();
            $table->tinyInteger('user_id'); // assigned to
            $table->tinyInteger('raised_by')->nullable(); //raised by
            $table->tinyInteger('product_id');
            $table->tinyInteger('organization_id')->nullable();
            $table->tinyInteger('approved')->nullable(); // from user table
            $table->string('title');
            $table->text('details');
            $table->string('ticket_code');
            $table->char('type')->default(0); // 0 = problem , 1 = change request , 2 = new request , 3 = support;
            $table->char('priority'); // L = low , U = urgent , N = normal;
            $table->tinyInteger('status_id');
            $table->string('url')->nullable();
            $table->date('raising_date')->nullable();
            $table->string('ticket_number')->nullable();
            $table->string('related_ticket_id')->nullable();
            $table->string('comment')->nullable();
            $table->text('root_cause')->nullable();
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
        Schema::dropIfExists('tickets');
    }
}
