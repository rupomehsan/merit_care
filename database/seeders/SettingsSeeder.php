<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;

class SettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Setting::truncate();

        $settings = new Setting();
        $settings->title = 'invoice_name';
        $settings->value = 'Central';
        $settings->save();

        $settings = new Setting();
        $settings->title = 'invoice_address';
        $settings->value = 'Bangla motor, Dhaka';
        $settings->save();

        $settings = new Setting();
        $settings->title = 'invoice_email';
        $settings->value = 'central@gmail.com';
        $settings->save();

        $settings = new Setting();
        $settings->title = 'invoice_mobile_number';
        $settings->value = '01234567890';
        $settings->save();

        $settings = new Setting();
        $settings->title = 'site_mobile_number';
        $settings->value = '01234567890';
        $settings->save();

        $settings = new Setting();
        $settings->title = 'site_email';
        $settings->value = 'abc@gmail.com';
        $settings->save();

        $settings = new Setting();
        $settings->title = 'site_logo';
        $settings->value = 'test/Logo_coaching.png'; 
        $settings->save();

        $settings = new Setting();
        $settings->title = 'site_primary_color';
        $settings->value = '#431c46'; 
        $settings->status = 0;
        $settings->save();

        $settings = new Setting();
        $settings->title = 'site_secondary_color';
        $settings->value = '#8cc63f'; 
        $settings->status = 0;
        $settings->save();

        $settings = new Setting();
        $settings->title = 'facebook_link';
        $settings->value = 'https://www.facebook.com'; 
        $settings->save();

        $settings = new Setting();
        $settings->title = 'twitter_link';
        $settings->value = 'https://twitter.com';
        $settings->save();

        $settings = new Setting();
        $settings->title = 'mail_link';
        $settings->value = 'https://mail.google.com/'; 
        $settings->save();


        $settings = new Setting();
        $settings->title = 'linkedin_link';
        $settings->value = 'https://www.linkedin.com';
        $settings->save();

        $settings = new Setting();
        $settings->title = 'youtube_link';
        $settings->value = 'https://www.youtube.com';
        $settings->save();

        $settings = new Setting();
        $settings->title = 'about_us_footer';
        $settings->value = "Welcome to MeritCare Academy – your all-in-one solution for streamlined coaching management. Elevate your institute's efficiency with our user-friendly platform, covering student, teacher, schedule, branch, exam, and employee management. Your journey to academic excellence starts here!";
        $settings->save();

        $settings = new Setting();
        $settings->title = 'main_address';
        $settings->value = "Road # 10, House # 2, Blog # A Mirpur-1, Dhaka-1212, Bangladesh";
        $settings->save();

        $settings = new Setting();
        $settings->title = 'about_us';
        $settings->value = "Welcome to MeritCare Academy, where excellence meets education!

        At MeritCare Academy, we take pride in providing a comprehensive coaching management system that seamlessly integrates student, teacher, class schedule, branch, exam, and employee management. Our user-friendly web application is designed to streamline administrative tasks, allowing you to focus on what truly matters – nurturing the educational journey of your students.
        
        With a commitment to excellence, MeritCare Academy empowers educational institutions to efficiently organize and manage their operations. Our robust features ensure smooth student enrollment, effective teacher administration, accurate class scheduling, seamless branch coordination, precise exam management, and efficient employee handling.
        
        Join us on the path to educational success, where MeritCare Academy becomes your trusted partner in achieving academic excellence. Elevate your coaching institute's management experience with our powerful and intuitive platform.
        
        Thank you for choosing MeritCare Academy – where every keystroke counts towards a brighter educational future.";
        $settings->save();
    }
}
