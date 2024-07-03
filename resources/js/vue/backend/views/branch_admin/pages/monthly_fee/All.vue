<template>
    <div class="conatiner">

        <div class="analytics d-flex gap-2 flex-wrap d-none">
            <div class="card" style="max-width: 278px">
                <div class="business-top-widget card-body">
                    <div class="media d-inline-flex">
                        <div class="media-body">
                            <span class="mb-2">Total collect</span>
                            <h2 class="total-value m-0 counter">8900 ৳</h2>
                        </div>
                        <i class="icofont fa-4x ms-2 icofont-growth text-info align-self-center"></i>
                    </div>
                </div>
            </div>
            <div class="card" style="max-width: 278px">
                <div class="business-top-widget card-body">
                    <div class="media d-inline-flex">
                        <div class="media-body">
                            <span class="mb-2">This month collect</span>
                            <h2 class="total-value m-0 counter">88900 ৳</h2>
                        </div>
                        <i class="icofont icofont-chart-arrows-axis ms-2 text-warning fa-4x"></i>
                    </div>
                </div>
            </div>
            <div class="card" style="max-width: 278px">
                <div class="business-top-widget card-body">
                    <div class="media d-inline-flex">
                        <div class="media-body">
                            <span class="mb-2">Total due</span>
                            <h2 class="total-value m-0 counter">7900 ৳</h2>
                        </div>
                        <i class="icofont icofont-chart-pie ms-2 text-secondary fa-4x"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="card list_card">
            <div class="card-header">
                <h4>
                    All
                    <small v-if="this[`get_${store_prefix}_selected`].length">
                        &nbsp; selected:
                        <b class="text-warning">
                            {{ this[`get_${store_prefix}_selected`].length }}
                        </b>
                        &nbsp;
                        <b @click="call_store(`set_clear_selected_${store_prefix}s`, true)" class="text-danger cursor-pointer">clear</b>
                        &nbsp;
                        <b @click="call_store(`set_${store_prefix}_show_selected`,true)" class="text-success cursor-pointer">show</b>
                    </small>
                </h4>
                <div class="search">
                    <form action="#" class="d-flex align-items-center gap-1" @submit.prevent="call_store(`fetch_${store_prefix}s`)">
                        <input
                            @keyup="call_store(`set_${store_prefix}_search_key`,$event.target.value)"
                            class="form-control border border-info" placeholder="search..." type="search">

                        <span>from</span>
                        <input
                            @change="call_store(`set_${store_prefix}_from_date`,$event.target.value)"
                            class="form-control border border-info" type="date">

                        <span>to</span>
                        <input
                            @change="call_store(`set_${store_prefix}_to_date`,$event.target.value)"
                            class="form-control border border-info" type="date">

                        <button class="btn btn-sm btn-outline-info" >
                            <i class="fa fa-search"></i>
                        </button>
                        <button class="btn btn-sm btn-outline-danger" type="reset">
                            <i class="fa fa-close"></i>
                        </button>
                    </form>
                </div>
                <div class="btns d-flex gap-2 align-items-center">
                    <permission-button
                        :permission="'can_create'"
                        :to="{name: `Create${route_prefix}`}"
                        :classList="'btn rounded-pill btn-outline-info'">
                        <i class="fa fa-pencil me-5px"></i>
                        Create
                    </permission-button>
                    <div class="table_actions">
                        <a href="#" @click.prevent="()=>''" class="btn px-1 btn-outline-secondary">
                            <i class="fa fa-list"></i>
                        </a>
                        <ul>
                            <li>
                                <a href="" @click.prevent="call_store(`export_${store_prefix}_all`)">
                                    <i class="fa-regular fa-hand-point-right"></i>
                                    Export All
                                </a>
                            </li>
                            <li v-if="this[`get_${store_prefix}_selected`].length">
                                <a href="" @click.prevent="call_store(`export_selected_${store_prefix}_csv`)">
                                    <i class="fa-regular fa-hand-point-right"></i>
                                    Export Selected
                                </a>
                            </li>
                            <li>
                                <router-link :to="{name:`Import${route_prefix}`}">
                                    <i class="fa-regular fa-hand-point-right"></i>
                                    Import
                                </router-link>
                            </li>
                            <li>
                                <a href="#" v-if="this[`get_${store_prefix}_show_active_data`]" title="display data that has been deactivated" @click.prevent="call_store(`set_${store_prefix}_show_active_data`,0)" class="d-flex">
                                    <i class="fa-regular fa-hand-point-right"></i>
                                    Deactivated data
                                </a>
                                <a href="#" v-else title="display data that are active" @click.prevent="call_store(`set_${store_prefix}_show_active_data`,1)" class="d-flex">
                                    <i class="fa-regular fa-hand-point-right"></i>
                                    Active data
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="table-responsive card-body text-nowrap">
                <table class="table table-hover table-striped table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th><input @click="call_store(`set_select_all_${store_prefix}s`)" type="checkbox" class="form-check-input check_all"></th>
                            <table-th :sort="true" :tkey="'id'" :title="'ID'" :ariaLable="'id'"/>
                            <table-th :sort="false" :tkey="'photo'" :title="'Photo'" />
                            <table-th :sort="false" :tkey="'user_id'" :title="'Student'" />
                            <table-th :sort="false" :tkey="'mobile_number'" :title="'Contact'" />
                            <table-th :sort="false" :tkey="'branch_code'" :title="'Branch Code'" />
                            <table-th :sort="false" :tkey="'amount'" :title="'Total Amount'" />
                            <table-th :sort="false" :tkey="'account'" :title="'Account'" />
                            <table-th :sort="true" :tkey="'date'" :title="'Date'" />
                            <th aria-label="actions">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                        <tr v-for="item in this[`get_${store_prefix}s`].data" :key="item.id">
                            <td>
                                <input v-if="check_if_data_is_selected(item)" :data-id="item.id" checked @change="call_store(`set_selected_${store_prefix}s`,item)" type="checkbox" class="form-check-input">
                                <input v-else @change="call_store(`set_selected_${store_prefix}s`,item)" type="checkbox" class="form-check-input">
                            </td>
                            <td>{{ item.id }}</td>
                            <td>
                                <img :src="`/${item.student.user.photo}`" style="height: 40px;" v-if="item.student && item.student.user" alt="">
                            </td>
                            <td>
                                <span v-if="item.student" class="text-warning cursor_pointer" @click.prevent="call_store(`set_${store_prefix}`,item)">
                                    {{ item.student.user.first_name }} {{ item.student.user.last_name }}
                                </span>
                                <span v-else>
                                    Student not found
                                </span>
                            </td>
                            <td>
                                <span v-if="item.student && item.student.user">
                                    {{ item.student.user.mobile_number }}
                                </span>
                            </td>
                            <td>
                                <span v-if="item.student && item.student.user">
                                    {{ item.student.user.branch_code }}
                                </span>
                            </td>
                            <td>{{ item.amount }}</td>
                            <td>
                                <span v-if="item.account_log && item.account_log.account">
                                    {{ item.account_log.account.title }}
                                </span>
                            </td>
                            <td>{{ item.date }}</td>
                            <td>
                                <div class="table_actions">
                                    <a href="#" @click.prevent="()=>''" class="btn btn-sm btn-outline-secondary">
                                        <i class="fa fa-gears"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="" @click.prevent="call_store(`set_${store_prefix}`,item)">
                                                <i class="fa text-info fa-eye"></i>
                                                Quick View
                                            </a>
                                        </li>
                                        <!-- <li>
                                            <a href="" @click.prevent="call_store(`set_${store_prefix}`,item)">
                                                <i class="fa-solid text-info fa-cart-shopping"></i>
                                                Order Product
                                            </a>
                                        </li> -->
                                        <li>
                                            <permission-button
                                                :permission="'can_create'"
                                                :to="{name:`Details${route_prefix}`,params:{id:item.id}}"
                                                :classList="''">
                                                <i class="fa text-secondary fa-eye"></i>
                                                Details
                                            </permission-button>
                                        </li>

                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="card-footer py-1 border-top-0">
                <div class="d-inline-block">
                    <pagination :data="this[`get_${store_prefix}s`]" :limit="5" :size="'small'" :show-disabled="true" :align="'left'"
                        @pagination-change-page="handle_pagination">
                        <span slot="prev-nav"><i class="fa fa-angle-left"></i> Previous</span>
                        <span slot="next-nav">Next <i class="fa fa-angle-right"></i></span>
                    </pagination>
                </div>
                <div class="show-limit d-inline-block">
                    <span>Limit:</span>
                    <select @change.prevent="call_store(`set_${store_prefix}_paginate`,$event.target.value)">
                        <option v-for="i in [10,5,25,50,100]" :key="i" :value="i">
                            {{ i }}
                        </option>
                    </select>
                </div>
                <div class="show-limit d-inline-block">
                    <span>Total:</span>
                    <span>{{ this[`get_${store_prefix}s`].total }}</span>
                </div>
            </div>
        </div>

        <details-canvas/>
        <selected-canvas/>
    </div>
</template>

<script>
import { mapActions, mapGetters, mapMutations } from 'vuex';
import PermissionButton from '../../../components/PermissionButton.vue';
import TableTh from './components/TableTh.vue';
import DetailsCanvas from './DetailsCanvas.vue';
import SelectedCanvas from './SelectedCanvas.vue';

/** store and route prefix for export object use */
import PageSetup from './PageSetup';
const {route_prefix, store_prefix} = PageSetup;

export default {
    components: { PermissionButton, TableTh, DetailsCanvas, SelectedCanvas },
    data: function(){
        return {
            store_prefix,
            route_prefix,
        }
    },
    created: function(){
        this[`fetch_${store_prefix}s`]();
    },
    methods: {
        ...mapActions([
            `fetch_${store_prefix}s`,
            `soft_delete_${store_prefix}`,
            `restore_${store_prefix}`,
            `export_${store_prefix}_all`,
            `export_selected_${store_prefix}_csv`,
            `delete_${store_prefix}`
        ]),
        ...mapMutations([
            `set_${store_prefix}_paginate`,
            `set_${store_prefix}_page`,
            `set_${store_prefix}_search_key`,
            `set_${store_prefix}_from_date`,
            `set_${store_prefix}_to_date`,
            `set_${store_prefix}_orderByCol`,
            `set_${store_prefix}_show_active_data`,
            `set_${store_prefix}`,
            `set_selected_${store_prefix}s`,
            `set_select_all_${store_prefix}s`,
            `set_clear_selected_${store_prefix}s`,
            `set_${store_prefix}_show_selected`,
        ]),

        call_store: function(name, params=null){
            this[name](params)
        },
        handle_pagination: function(page=1){
            return this[`set_${store_prefix}_page`](page);
        },

        check_if_data_is_selected: function(user){
            let check_index = this[`get_${store_prefix}_selected`].findIndex((i) => i.id == user.id);
            if(check_index >= 0){
                return true;
            }else{
                return false;
            }
        },
    },
    computed: {
        ...mapGetters([
            `get_${store_prefix}s`,
            `get_${store_prefix}_selected`,
            `get_${store_prefix}_show_active_data`,
        ]),
    }
}
</script>

<style>

</style>

