
<section class="login_page h-100">
    <div class="container">
        <div class="login_page_content">

            <!-- form area start -->
            <form wire:submit.prevent="login_submit" action="#">
                <div class="input_area user_name_area">
                    <i class="fa-solid fa-user"></i>
                    <input wire:model="email" type="email" name="email" placeholder="Email">
                </div>
                <div class="input_area password_area">
                    <i class="fa-solid fa-unlock-keyhole"></i>
                    <input wire:model="password" type="password" placeholder=".........................">
                </div>
                <div class="text-danger text-center mt-1">
                    {{ $alert_message }}
                </div>
                <button type="submit" class="button_area login_button">LOGIN</button>
            </form>
            <div class="camera_icon">
                <i class="fa-solid fa-camera"></i>
            </div>
        </div>
    </div>
</section>
