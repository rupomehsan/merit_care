<?php

namespace Database\Seeders;

use Database\Seeders\Accounts\AccountSeeder;
use Illuminate\Database\Seeder;

class AccountManagementSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            AccountSeeder::class,
        ]);
    }
}
