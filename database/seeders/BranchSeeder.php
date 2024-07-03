<?php

namespace Database\Seeders;

use App\Models\Institute\InstituteBranch;
use App\Models\Institute\InstituteBranchContacts;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BranchSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        InstituteBranch::truncate();
        InstituteBranchContacts::truncate();
        

        $instituteBranch = new InstituteBranch();
        $instituteBranch->coaching_name = "Index";
        $instituteBranch->name = "Farmgate branch";
        $instituteBranch->branch_code = "index-fm";
        $instituteBranch->street = "Green road, road no-2";
        $instituteBranch->city = "Dhaka";
        $instituteBranch->state = "Dhaka, Bangladesh";
        $instituteBranch->zip_code = "1216";
        $instituteBranch->country = "Bangladesh";
        $instituteBranch->map_link = `<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14600.989796477903!2d90.3615175!3d23.8097983!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c1deef2f9c79%3A0x37cffe05af2e2701!2sTech%20Park%20English!5e0!3m2!1sen!2sbd!4v1703934721058!5m2!1sen!2sbd" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>`;
        $instituteBranch->invoice_name = "Index";
        $instituteBranch->invoice_address = "Farmgate, Dhaka";
        $instituteBranch->invoice_mobile_number = "0175484154";
        $instituteBranch->invoice_email = "farmgate_branch@gmail.com";
        $instituteBranch->image = "test/index.jpg";
        $instituteBranch->save();

        for ($i=0; $i <2 ; $i++) { 
            $branchContact = new InstituteBranchContacts();
            $branchContact->intstitue_branch_id = $i+1;
            $branchContact->first_name = "Mr";
            $branchContact->last_name = "Admin " . $i;
            $branchContact->phone_number = "0175484154" . $i;
            $branchContact->email = "branch_admin". $i . "@gmail.com";
            $branchContact->creator = 2;
            $branchContact->status = 1;
            $branchContact->save();
        }
        // $instituteBranch->branch_admin()->attach([3]);

        $instituteBranch = new InstituteBranch();
        $instituteBranch->coaching_name = "Focus";
        $instituteBranch->name = "Mirpur branch";
        $instituteBranch->branch_code = "focus-mp";
        $instituteBranch->street = "Proshika, road no-6";
        $instituteBranch->city = "Dhaka";
        $instituteBranch->state = "Dhaka, Bangladesh";
        $instituteBranch->zip_code = "1216";
        $instituteBranch->country = "Bangladesh";
        $instituteBranch->map_link = `<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14601.411377150216!2d90.3691531!3d23.8060489!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c1962e0627cd%3A0xe554f8cd7a7afaa9!2sFocus%20Mirpur%20Branch!5e0!3m2!1sen!2sbd!4v1703935086716!5m2!1sen!2sbd" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>`;
        $instituteBranch->invoice_name = "Focus, Mirpur";
        $instituteBranch->invoice_address = "Mirpur, Dhaka";
        $instituteBranch->invoice_mobile_number = "0175484154";
        $instituteBranch->invoice_email = "focus_mimrpur@gmail.com";
        $instituteBranch->image = "test/focus.jpg";
        $instituteBranch->save();

        $instituteBranch = new InstituteBranch();
        $instituteBranch->coaching_name = "Retina";
        $instituteBranch->name = "Central";
        $instituteBranch->street = "mirpur 1";
        $instituteBranch->branch_code = "retina-cp";
        $instituteBranch->city = "Dhaka";
        $instituteBranch->state = "Dhaka, Bangladesh";
        $instituteBranch->zip_code = "1216";
        $instituteBranch->country = "Bangladesh";
        $instituteBranch->map_link = `<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14601.308838078332!2d90.3693583!3d23.8069609!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c17974aecf0f%3A0x7707fcae6a83fc1f!2zUkVUSU5BIE1pcnB1ciAtIOCmsOCnh-Cmn-Cmv-CmqOCmviDgpq7gpr_gprDgpqrgp4HgprAgfCBCZXN0IE1lZGljYWwgJiBEZW50YWwgQWRtaXNzaW9uIENvYWNoaW5nIGluIERoYWth!5e0!3m2!1sen!2sbd!4v1703935142322!5m2!1sen!2sbd" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>`;
        $instituteBranch->invoice_name = "Retina, Mirpur";
        $instituteBranch->invoice_address = "Mirpur, Dhaka";
        $instituteBranch->invoice_mobile_number = "0175484154";
        $instituteBranch->invoice_email = "retina_mimrpur@gmail.com";
        $instituteBranch->image = "test/retina.jpg";
        $instituteBranch->save();
        // $instituteBranch->branch_admin()->attach([2]);
    }
}
