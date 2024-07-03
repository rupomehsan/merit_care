<?php

namespace App\Http\Livewire;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Livewire\Component;

class Login extends Component
{
    public $email;
    public $password;
    public $auth_check;
    public $access_token;
    public $alert_message;

    public function mount()
    {
        $this->auth_check = auth()->check();

        if(auth()->check()){
            // return header("Location:admin");
        }
    }

    public function render()
    {
        return view('livewire.login')
            ->extends('layouts.blank_app', [
                'title' => 'login',
                'meta_image' => '/uploads/site/logo-78706.png',
            ]);
    }

    public function login_submit()
    {
        $email = $this->email;
        $password = $this->password;
        $user = User::where(function($q) use($email){
            return $q->where('email', $email)
                ->orWhere('user_name', $email)
                ->orWhere('mobile_number', $email);
        })->first();
        if($user){
            if(Hash::check($password, $user->password)){
                auth()->login($user);
                $this->auth_check = auth()->check();
                $this->access_token = $user->createToken('accessToken')->accessToken;
            }else{
                $this->alert_message = "incorrect password";
            }
        }else{
            $this->alert_message = "incorrect email";
        }
    }
}
