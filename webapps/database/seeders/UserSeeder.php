<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::where('email','searchhannan@hotmail.com')->first();
        if (is_null($user)) {
           $user = User::create([
                'name' => 'Super Admin',
                'email' => 'searchhannan@hotmail.com',
                'password'=> Hash::make('12345678'),
                'username' => 'IT Admin',
                'is_superadmin' => 1,

             ]);
            $user->assignRole('super-admin');
        }



    }
}
