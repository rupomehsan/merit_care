<?php

namespace App\Http\Livewire\Components;

use App\Models\Setting;
use Livewire\Component;

class Footer extends Component
{
    public $mobile_number;
    public $site_email;
    public $logo;
    public $about_us;
    public $address;
    public function render()
    {
        $this->mobile_number = Setting::where('title', 'site_mobile_number')->first();
        $this->site_email = Setting::where('title', 'site_email')->first();
        $this->logo = Setting::where('title', 'site_logo')->first();
        $this->about_us = Setting::where('title', 'about_us_footer')->first();
        $this->address = Setting::where('title', 'main_address')->first();
        
        return view('livewire.components.footer');
    }
}
