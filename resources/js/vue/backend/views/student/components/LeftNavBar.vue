<template>
    <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

        <li class="nav-item">
            <router-link class="d-flex align-items-center" :to="{ name: 'student_dashboard' }" href="javascript:void(0)">
                <!-- <i class="fa-solid fa-box"></i> -->
                <span class="icon"><i class="fa-sharp fa-solid fa-house"></i></span>
                <span class="menu-title text-truncate">Dashboard</span>
            </router-link>
        </li>
        <li class="nav-item">
            <router-link class="d-flex align-items-center" :to="{ name: 'class_routine' }" href="javascript:void(0)">
                <!-- <i class="fa-solid fa-box"></i> -->
                <span class="icon"><i class="fa-sharp fa-solid fa-calendar-days"></i></span>
                <span class="menu-title text-truncate">class routine</span>
            </router-link>
        </li>

        <li class="nav-item">
            <router-link class="d-flex align-items-center" :to="{ name: 'StudentMonthlyFee' }" href="javascript:void(0)">
                <span class="icon"><i class="fa-solid fa-money-bills"></i></span>
                <span class="menu-title text-truncate">Monthly Fee statements</span>
            </router-link>
        </li>

        <li class="nav-item nested_list_sidebar">
            <a class="d-flex align-items-center nested_nav_list_sidebar" href="javascript:void(0)">
                <i class="fa-sharp fa-solid fa-calendar-days"></i>
                <span class="menu-title text-truncate">Attendence</span>
                <i class="ms-1 fa-solid fa-caret-down"></i>
            </a>

            <ul>
                <li class="nav-item">
                    <router-link class="d-flex align-items-center" :to="{ name: 'AttendenceReport' }" href="javascript:void(0)">
                        <i class="fa-regular fa-circle"></i>
                        <span class="menu-title text-truncate">Attendence Report</span>
                    </router-link>
                </li>

                <li class="nav-item">
                    <router-link class="d-flex align-items-center" :to="{ name: 'AttendenceMonthWise' }" href="javascript:void(0)">
                        <i class="fa-regular fa-circle"></i>
                        <span class="menu-title text-truncate">Month wise attendence</span>
                    </router-link>
                </li>
            </ul>
        </li>

        <li class="nav-item">
            <router-link class="d-flex align-items-center" :to="{ name: 'StudentExamResult' }" href="javascript:void(0)">
                <span class="icon"><i class="fas fa-chart-line"></i></span>
                <span class="menu-title text-truncate">Exam reports</span>
            </router-link>
        </li>
        <li class="nav-item">
            <router-link class="d-flex align-items-center" :to="{ name: 'student_notification' }" href="javascript:void(0)">
                <i class="fa-solid fa-bell"></i>
                <span class="menu-title text-truncate">Notifications</span>
            </router-link>
        </li>
        <li class="nav-item">
            <a @click.prevent="fetch_logout()" href="javascript:void(0)">
                <span class="icon"><i class="fa-solid fa-power-off"></i></span>
                <span class="menu-title text-truncate">Logout</span>
            </a>
        </li>
    </ul>
</template>

<script>

import { mapActions, mapGetters } from "vuex";
export default {
    created: function () {
        setTimeout(() => {
            $(".nested_nav_list_sidebar").click(function() {
                // console.log($(this).children('.nested_list_sidebar'));
                $(this).parent().toggleClass("active");
            });
        }, 500);
    },  
    methods: {
        ...mapActions(["fetch_logout"]),
        toggle() {
            window.toggleSidebar()
        }
    },
};
</script>

<style></style>
