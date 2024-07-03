<div>
    {{-- The whole world belongs to you. --}}
    <footer class="footer_area" style="background-color: #161616;">
        <div class="container">
            <div class="footer_area_content">
                <div class="row">
                    <!-- footer_area_left start -->
                    <div class="col-lg-4 col-md-12">
                        <div class="footer_area_left">
                            <!-- logo area start -->

                            <a href="#" class="footer_logo">
                                <img src="/{{ $logo->value }}" alt="img">
                            </a>
                            <!-- logo area end -->
                            <!-- footer_discription_area start -->
                            <div class="footer_discription_area">
                                <p style="text-align: justify">
                                    {{ $about_us->value }}
                                </p>
                            </div>
                            <!-- footer_discription_area end -->
                            <!-- footer_social_link start -->
                            {{-- <div class="footer_social_link">
                                <ul>
                                    <li>
                                        <a href="#"><i class="fa-regular fa-envelope"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa-brands fa-pinterest-p"></i></a>
                                    </li>

                                </ul>
                            </div> --}}
                            <!-- footer_social_link end -->
                        </div>

                    </div>
                    <!-- footer_area_left end -->
                    <!-- featured_links_area start -->
                    <div class="col-lg-4 col-md-12">
                        <div class="featured_links_area">
                            <div class="featured_links_title">
                                <h2>featured links</h2>
                            </div>
                            <div class="featured_links">
                                <div class="featured_links_content">
                                    <ul>
                                        <li>
                                            <span><i class="fa-solid fa-angle-right"></i></span>
                                            <a href="/">home</a>
                                        </li>
                                        <li>
                                            <span><i class="fa-solid fa-angle-right"></i></span>
                                            <a href="{{ route('about_us') }}">about</a>
                                        </li>
                                        <li>
                                            <span><i class="fa-solid fa-angle-right"></i></span>
                                            <a href="{{ route('teacher_page') }}">teacher</a>
                                        </li>
                                        <li>
                                            <span><i class="fa-solid fa-angle-right"></i></span>
                                            <a href="#total_routine">class sedule</a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <div class="col-lg-4 col-md-12">
                        <div class="contact_area">
                            <div class="contact_area_title">
                                <h2>contact</h2>
                            </div>
                            <div class="contact_content">
                                <ul>
                                    {{-- @dd($address->value) --}}
                                    <li class="address text-white">
                                        {{ $address->value }}
                                    </li>
                                    <li class="phone_number_and_icon">
                                        <div class="icon">
                                            <i class="fa-solid fa-phone"></i>
                                        </div>
                                        <div class="phone_number">
                                            <a href="tel:{{ $mobile_number->value }}">{{ $mobile_number->value }}</a>
                                        </div>
                                    </li>
                                    <li class="email_and_icon">
                                        <div class="icon">
                                            <i class="fa-solid fa-paper-plane"></i>
                                        </div>
                                        <div class="email">
                                            <a href="#">{{ $site_email->value }}</a>
                                        </div>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </div>
                    <!-- contact_area end -->
                </div>
            </div>
        </div>
    </footer>
    <!-- footer_area end -->
    <!-- copyright_area start -->
    <footer class="copyright_area">
        <div class="copyright_content">
            <p>Copyright &copy; By <span> <a href="#">{{ env('APP_NAME', 'TechPark It') }}</a> </span> 2023</p>
        </div>
    </footer>
</div>
