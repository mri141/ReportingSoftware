<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class TicketFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => 1,
            'raised_by' => Auth::id(),
            'product_id' => 2,
             'organization_id' => 1,
             'approved' => 1,
             'title' => $this->faker->unique()->sentence(),
             'details' =>$this->faker->sentence(),
             'ticket_code' => 'PR-RMIS-1',
             'type' => 'P',
             'priority' => 'U',
             'status_id' => 1,
             'url' => 'null',
             'raising_date' => '2022-01-07',
             'image' => '1641515210.png',

        ];
    }

}
