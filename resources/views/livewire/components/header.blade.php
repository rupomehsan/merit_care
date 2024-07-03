
<div>
    
    @php
        if($settings->where('title', 'facebook_link')->first()) {
            $facebook_link = $settings->where('title', 'facebook_link')->first()->value;
        }else {
            $facebook_link = '#';
        }

        if($settings->where('title', 'twitter_link')->first()) {
            $twitter_link = $settings->where('title', 'twitter_link')->first()->value;
        }else {
            $twitter_link = '#';
        }

        if($settings->where('title', 'mail_link')->first()) {
            $mail_link = $settings->where('title', 'mail_link')->first()->value;
        }else {
            $mail_link = '#';
        }

        if($settings->where('title', 'linkedin_link')->first()) {
            $linkedin_link = $settings->where('title', 'linkedin_link')->first()->value;
        }else {
            $linkedin_link = '#';
        }

        if($settings->where('title', 'youtube_link')->first()) {
            $youtube_link = $settings->where('title', 'youtube_link')->first()->value;
        }else {
            $youtube_link = '#';
        }
    @endphp

    <div class="icon-bar">
        <a href="{{ $facebook_link }}" target="_blank" class="facebook"><i class="fa-brands fa-facebook"></i></a> 
        <a href="{{ $twitter_link }}" target="_blank" class="twitter"><i class="fa-brands fa-twitter"></i></a> 
        <a href="{{ $mail_link }}" target="_blank" class="google"><i class="fa-brands fa-google"></i></a> 
        <a href="{{ $linkedin_link }}" target="_blank" class="linkedin"><i class="fa-brands fa-linkedin"></i></a>
        <a href="{{ $youtube_link }}" target="_blank" class="youtube"><i class="fa-brands fa-youtube"></i></a> 
    </div>
    <section class="header_top">
        <div class="container">
            <div class="header_top_content">
                <div class="row">
                    <!-- contact_and_email area start -->
                    <div class=" col-sm-8 col-md-9">
                        <div class="contact_and_email">
                            <!-- contact_area start -->
                            <a href="#" class="contact_area">
                                <span class="logo">
                                    <i class="fa-solid fa-phone"></i>
                                </span>
                                <span class="title contact_title">
                                    call us
                                </span>
                                <span class="colon_area">
                                    :
                                </span>
                                <span class="value contact_number">
                                    {{ $mobile_number->value }}
                                </span>
                            </a>
                            <!-- contact_area end -->
    
                            <!-- email_area start -->
                            <a href="#" class="email_area">
                                <span class="logo">
                                    <i class="fa-solid fa-envelope"></i>
                                </span>
                                <span class="title contact_title">
                                    email
                                </span>
                                <span class="colon_area">
                                    :
                                </span>
                                <span class="value email_address">
                                    {{ $site_email->value }}
                                </span>
                            </a>
                            <!-- email_area end -->
                        </div>
                    </div>
                    <!-- contact_and_email area end -->
                    <!-- login_and_apply_area start -->
                    <div class=" col-sm-4 col-md-3">
                        <div class="login_and_apply_area">
                            <!-- login_area start -->
                            {{-- <a href="/login" class="login_area">
                                <span class="logo">
                                    <i class="fas fa-unlock-alt"></i>
                                </span>
                                <span class="title login_title">
                                    login
                                </span>
                            </a> --}}
                            <!-- login_area end -->
                            <!-- apply_area start -->
                            {{-- <a href="#" class="apply_area">
                                <span class="title apply_title">
                                    apply now
                                </span>
                            </a> --}}
                            <!-- apply_area end -->
                        </div>
                    </div>
                    <!-- login_and_apply_area end -->
                </div>
    
    
            </div>
        </div>
    </section>
    <section id="nav_section">
        <section class="header_area_buttom">
            <div class="container">
                <div class="header_area_buttom_content">
                    <div class="row">
                        <!-- logo area start -->
                        <div class="col-xs-6 col-md-3">
                            <div class="logo_area">
                                <a href="/"><img src="/{{ $logo->value }}" alt="logo"></a>
                            </div>
                        </div>
                        <!-- logo area end -->
                        <!-- search_area start -->
                        <div class="col-xs-6 col-md-9">
                            <div class="search_area_content">
                                <form method="#" action="#" class="search_area">
                                    <input type="text" placeholder="Search...">
                                    <button class="button_area">
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </button>
    
                                </form>
                            </div>
                        </div>
                        <!-- search_area end -->
                    </div>
    
                    <!-- humberger_menu start -->
                    <section onclick="document.getElementById('active_nav_area').classList.toggle('active_class') "
                        class="humberger_menu">
                        <i class="fa-solid fa-bars"></i>
                    </section>
                    <!-- humberger_menu end -->
                </div>
            </div>
        </section>

        @livewire('components.navbar')
    </section>
    <script>
        window.onscroll = function() {myFunction()};
        
        var navbar = document.getElementById("active_nav_area");
        var sticky = navbar.offsetTop+50;
        
        function myFunction() {
          if (window.pageYOffset >= sticky) {
            navbar.classList.add("sticky")
            navbar.classList.add("box_shadow_menu");
          } else {
            navbar.classList.remove("sticky");
            navbar.classList.remove("box_shadow_menu");

          }
        }
    </script>
</div>

