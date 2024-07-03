<div>
    {{-- Because she competes with no one, no one can compete with her. --}}
    <main class="main_section">
        <div class="container">
            <div class="d-flex breaking_wrapper">
                <div class="breaking_news_label" style="width: 150px; line-height: 33px;">
                    <span class="breaking_news_heading">
                        Breaking News: 
                    </span>
                </div>
                <div class="breaking_scroll">
                    <div class="js-conveyor-example flex-grow-1">
                        <ul>
                          <li>
                            <span class="mt-2">{{ $breaking_news->description }}</span>
                          </li>
                        </ul>
                    </div>
                </div>
                <script defer>
                    $('.js-conveyor-example').jConveyorTicker({
                        anim_duration: 200,
                        reverse_elm: true,
                        force_loop: true,
                    });
                </script>
            </div>
        </div>
        @livewire('components.banner')
        @include('livewire.components.branch', [
            'branches' => $branches,
        ])
        @livewire('components.news-events')
        @livewire('components.course')
        @livewire('components.stats')
        @livewire('components.lecturer')
        <section class="class_schedule_area">
            <div class="container">
                <div class="class_schedule_title">
                    <h2 class="heading_border_btm">class schedule</h2>
                </div>
                <div class="filterNav mb-3">
                    @foreach ($branches as $key => $item)
                        <a @if($key == 0) class="active" @endif id="filter_nav{{$item->id}}" onclick="get_class_schedules({{ $item->id }})" href="javascript:void(0)">{{ $item->name }}</a>
                    @endforeach
                </div>
                <div class="class_schedule_content" id="total_routine">

                </div>
                
            </div>
        </section>
    </main>
    @push('custom-scripts')
        <script type="text/javascript" src="/js/custom.js"></script>
    @endpush
</div>
