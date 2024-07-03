<html>

<head>
    <title>{{ $title ?? 'Coaching Management' }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:title" content="{{ $title ?? '' }}" />
    <meta property="og:site_name" content="{{ $title ?? '' }}" />
    <meta property="og:description" content="{{ $title ?? '' }}" />
    <meta property="og:image" content="{{ $meta_image ?? '' }}" />
    <meta property="og:image:width" content="600" />
    <meta property="og:image:height" content="315" />
    @csrf
    <meta name="twitter:title" content="{{ $title ?? '' }}">
    <meta name="twitter:description" content="{{ $title ?? '' }}">
    <meta name="twitter:image" content="{{ $meta_image ?? '' }}">
    <meta name="twitter:card" content="summary_large_image">
    {{-- <link rel="shortcut icon" type="image/x-icon" href="https://techparkit.org/fabicon.png"> --}}
    <link rel="icon" type="image/x-icon" type="image/png" sizes="16x16" href="{{ asset('test/favicon-16x16.png') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    {{-- <link rel="stylesheet" href="{{ asset('frontend/assets/css/fontawesome.css') }}"> --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/ticker.min.css') }}">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.css">

    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="{{ asset('frontend/assets/js/') }}/ticker.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/custom.css') }}">
    <style>
        /* width */
        html::-webkit-scrollbar {
            width: 8px;
        }

        /* Track */
        html::-webkit-scrollbar-track {
            box-shadow: inset 0 0 2px #7c7c7c;
            border-radius: 10px;
        }

        /* Handle */
        html::-webkit-scrollbar-thumb {
            background: #431c46;
            border-radius: 10px;
        }
    </style>
    @livewireStyles
    {{-- <script src="/js/app.js" defer></script> --}}
    @livewireScripts
    {{-- <script src="/js/turbolinks.min.js"></script> --}}
    @stack('custom-scripts')
</head>

<body>
    
    @yield('content')
    <a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i class="text-white fas fa-chevron-up"></i></a>
    <script>
        // Hero slider JS
        $('.hero-slider').owlCarousel({
        animateOut: 'slideOutLeft',
        // animateIn: 'slideInRight',
        items:1,
        loop:false,
        nav:true,
        dots: true,
        })
    </script>
    <script>
        let table = new DataTable('#branch_table');
        $(document).ready(function(){
            $(window).scroll(function () {
                    if ($(this).scrollTop() > 50) {
                        $('#back-to-top').fadeIn();
                    } else {
                        $('#back-to-top').fadeOut();
                    }
                });
                // scroll body to 0px on click
                $('#back-to-top').click(function () {
                    $('body,html').animate({
                        scrollTop: 0
                    }, 400);
                    return false;
                });
        });
    </script>
    
    <script defer>
        document.addEventListener("DOMContentLoaded", () => {
            Livewire.hook('component.initialized', (component) => {
                //
                // console.log('34',component.data);
            })
            Livewire.hook('element.initialized', (el, component) => {
                // console.log('37',component.data);
                // component.data.auth_check?window.location.href='/admin':'';
            })
            // Livewire.hook('element.updating', (fromEl, toEl, component) => {})
            // Livewire.hook('element.updated', (el, component) => {})
            // Livewire.hook('element.removed', (el, component) => {})
            // Livewire.hook('message.sent', (message, component) => {})
            // Livewire.hook('message.failed', (message, component) => {})
            Livewire.hook('message.received', (message, component) => {
                let access_token = message.response.serverMemo.data?.access_token;
                if (access_token) {
                    window.localStorage.setItem('token', access_token);
                    window.location.href = "/admin";
                }
            })
            Livewire.hook('message.processed', (message, component) => {
                // console.log('48');
            })
        });
        document.addEventListener("turbolinks:load", function(event) {
            console.log('load');
            window.livewire.start();
        });
        document.addEventListener("turbolinks:before-render", function (event) {
            window.livewire.stop();
        });
        document.addEventListener("turbolinks:render", function (event) {});
        function closeAlert() {
            var closeButton = document.querySelector('.btn-close');
            var alertDiv = closeButton.parentElement;
            alertDiv.remove();
        }
        
    </script>
</body>

</html>
