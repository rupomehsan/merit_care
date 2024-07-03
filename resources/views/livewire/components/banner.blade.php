<div>
    {{-- Because she competes with no one, no one can compete with her. --}}
    
    <div id="home" class="hero-slider owl-carousel owl-theme">
        @foreach ($banners as $banner)    
            <div class="single-hs-item item-bg{{ $banner->id }}" style="background-image: url({{ $banner->image }})">
                <div class="d-table">
                    <div class="d-tablecell">
                        <div class="hero-text">
                            <h1>{{ $banner->title }}</h1>
                            <p>{{ $banner->paragraph }}</p>
                            <div class="slider-btn">
                                <a href="{{ $banner->link }}" class="custom-btn1">{{ $banner->button_text }}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
