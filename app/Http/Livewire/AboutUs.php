<?php

namespace App\Http\Livewire;

use App\Models\Setting;
use Livewire\Component;

class AboutUs extends Component
{
    public $about_us;
    public function render()
    {
        $this->about_us = Setting::where('title', 'about_us')->first();
        return view('livewire.about-us')->extends('layouts.app');
    }
}
