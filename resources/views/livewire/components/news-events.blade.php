<div>
    {{-- Be like water. --}}
    <section class="news_events_and_notice_area">
        <div class="container">
            <div class="news_events_and_notice_area_content">
                <div class="row">
                    <!-- news_events_area start -->
                    <div class="col-md-12">
                        <div class="news_events_area">
                            <!-- news_events_area_title start -->
                            <div class="news_events_area_title">
                                <h2 class="heading_border_btm">news & events</h2>
                            </div>
                            <!-- news_events_area_title end -->
                            <div id="news-slider" class="owl-carousel">
                                @foreach ($news as $item)
                                <div class="post-slide">
                                    <div class="post-img">
                                        <img src="/{{ $item->image }}"
                                            alt="">
                                        <a href="{{ route('news_event_details_page', $item->id) }}" class="over-layer"><i class="fa fa-link"></i></a>
                                    </div>
                                    <div class="post-content">
                                        <h3 class="post-title">
                                            <a href="#">{{ \Illuminate\Support\Str::limit($item->title, 30) }}</a>
                                        </h3>
                                        <p class="post-description">
                                            {{ \Illuminate\Support\Str::limit($item->description, 100) }}
                                        </p>
                                        
                                        @php
                                            $day = $item->created_at->format('d');
                                            $month = $item->created_at->format('F');
                                            $year = $item->created_at->format('Y');
                                        @endphp
                                        <span class="post-date"><i class="fa fa-clock-o"></i>{{ $month }} {{ $day }}, {{ $year }}</span>
                                        <a href="{{ route('news_event_details_page', $item->id) }}" class="read-more">read more</a>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <!-- news_events_area end -->
                    <!-- notice_area start -->
                    <div class="col-md-12">
                        <div class="notice_area">
                            <div class="notice_area_title">
                                <h2 class="heading_border_btm">notice</h2>
                            </div>
                            <!-- notice_area_all_content start -->
                            <div id="notice-slider" class="owl-carousel">
                                @foreach ($notices as $item)
                                <div class="post-slide">
                                    <div class="post-img">
                                        <img src="/{{ $item->image }}"
                                            alt="">
                                        <a href="{{ route('news_event_details_page', $item->id) }}" class="over-layer"><i class="fa fa-link"></i></a>
                                    </div>
                                    <div class="post-content">
                                        <h3 class="post-title">
                                            <a href="#">{{ \Illuminate\Support\Str::limit($item->title, 30) }}</a>
                                        </h3>
                                        <p class="post-description">
                                            {{ \Illuminate\Support\Str::limit($item->description, 100) }}
                                        </p>
                                        
                                        @php
                                            $day = $item->created_at->format('d');
                                            $month = $item->created_at->format('F');
                                            $year = $item->created_at->format('Y');
                                        @endphp
                                        <span class="post-date"><i class="fa fa-clock-o"></i>{{ $month }} {{ $day }}, {{ $year }}</span>
                                        <a href="{{ route('news_event_details_page', $item->id) }}" class="read-more">read more</a>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                            <!-- notice_area_all_content end -->

                        </div>
                    </div>
                    <!-- notice_area end-->
                </div>
            </div>

        </div>
    </section>

    

    <script>
        $(document).ready(function() {
            $("#news-slider").owlCarousel({
                items: 3,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [980, 2],
                itemsMobile: [600, 1],
                navigation: true,
                navigationText: ["", ""],
                pagination: true,
                autoPlay: true  
            });
            $("#notice-slider").owlCarousel({
                items: 3,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [980, 2],
                itemsMobile: [600, 1],
                navigation: true,
                navigationText: ["", ""],
                pagination: true,
                autoPlay: true  
            });
        });
    </script>
</div>
