<template>
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item me-auto">
                <a class="navbar-brand" href="#">
                    <img style="height:30px; border-radius: 15px;" :src="get_auth_information.photo_url" alt="">
                    <h2 class="brand-text text-capitalize">{{ get_auth_information.first_name }}  {{ get_auth_information.last_name }}</h2>
                </a>
            </li>
            <li class="nav-item nav-toggle">
                <!-- <a class="nav-link modern-nav-toggle pe-0">
                    <i class="font-medium-4 text-primary fa fa-times"></i>
                </a> -->
            </li>
        </ul>
    </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
export default {
    data: function(){
        return {
            notification_status: false,
            notification_count: 0
        }
    },
    created: function () {
        this.fetch_check_auth();
        // this.fetch_site_settings();
    },
    
    methods: {
        ...mapActions([
            "fetch_check_auth"
        ]),
    },
    computed: {
        ...mapGetters([
            "get_check_auth",
            "get_auth_information"
        ]),
    },
};
</script>

<style>

</style>
