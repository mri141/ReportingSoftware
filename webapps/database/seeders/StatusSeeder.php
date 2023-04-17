<?php

namespace Database\Seeders;

use App\Models\Status;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class StatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // 0 = closed , 1 = created , 2 = resolved , 3 = inprogress, 4 = postponed , 5 = rejected , 6 = feedback;
       $statuses = [
           "Closed",
           "Created",
           "Resolved",
           "Inprogress",
           "Postponed",
           "Rejected",
           "Feedback"
        ];

       foreach($statuses as  $status){
           $st = new Status();
           $st->name = $status;
           $st->save();
       }
    }
}
