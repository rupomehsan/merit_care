<template>
    <div class="multiple_select_body" :id="`${store_prefix}_id`">
        <div class="multiple_select_data"
            @click="call_store(`set_${store_prefix}_show_management_modal`,true)">
            <div v-for="item in this[`get_${store_prefix}_selected`]" :key="item.id" class="item">
                {{ item.user.first_name }} {{ item.user.last_name }}
            </div>
            <div class="btn btn-sm btn-outline-danger" v-if="!this[`get_${store_prefix}_selected`].length">
                no data selected
            </div>
        </div>

        <div class="multiple_select_modal" v-if="this[`get_${store_prefix}_show_management_modal`]">
            <div class="multiple_select_modal_backdrop" @click="call_store(`set_${store_prefix}_show_management_modal`,false)"></div>
            <div class="multiple_select_modal_body custom_scroll">
                <div class="header">
                    <div class="search">
                        <input @keyup="call_store(`set_${store_prefix}_search_key`,($event.target.value))" type="text" class="rounded-pill form-control">
                    </div>
                    <div class="action_btns">
                        <a @click.prevent="call_store(`set_clear_selected_${store_prefix}s`)" v-if="this[`get_${store_prefix}_selected`].length" href="#" class="btn rounded-pill btn-outline-danger me-2"><i class="fa fa-trash"></i> remove selected</a>
                        <!-- <a @click.prevent="call_store(`set_${store_prefix}_show_create_canvas`,true)" href="#" class="btn rounded-pill btn-outline-primary"><i class="fa fa-pencil"></i> create</a> -->
                    </div>
                </div>
                <div class="selected">
                    <div class="item" v-for="user in this[`get_${store_prefix}_selected`]" :key="user.id">
                        <button @click.prevent="call_store(`set_selected_${store_prefix}s`,user)" class="btn rounded-pill btn-outline-secondary" type="button">
                            <span>
                                {{ user.user.first_name }} {{ user.user.last_name }}
                            </span>
                            <span>|</span>
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                </div>
                <div class="data_list custom_scroll table-responsive text-nowrap">
                    <table class="table table-hover table-striped table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th aria-label="id">
                                    <input v-if="this[`get_${store_prefix}_show_management_modal_qty`] != 1" @click="call_store(`set_select_all_${store_prefix}s`)" type="checkbox" class="form-check-input">
                                    <input v-else type="checkbox" disabled class="form-check-input" >
                                </th>
                                <!-- <th><input @click="call_store(`set_select_all_${store_prefix}s`)" type="checkbox" class="form-check-input"></th> -->
                                <table-th :sort="true" :ariaLable="'id'" :tkey="'id'" :title="'ID'" />
                                <table-th :sort="false" :tkey="''" :title="'Photo'" />
                                <table-th :sort="false" :tkey="'title'" :title="'Name'" />
                                <table-th :sort="true" :tkey="'monthly_fee'" :title="'Monthly Fee'" />
                                <table-th :sort="true" :tkey="'admission_date'" :title="'Admission'" />
                                <table-th :sort="true" :tkey="'fee_start_from'" :title="'Start From'" />
                                <table-th :sort="false" :tkey="'paid'" :title="'Paid'" />
                                <table-th :sort="false" :tkey="''" :title="'Code'" />
                                <table-th :sort="false" :tkey="''" :title="'Contact Number'" />
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
                                    <img :src="`/${item.user.photo}`" style="height: 40px;" v-if="item.user" alt="">
                                </td>
                                <td>
                                    <span class="text-warning cursor_pointer" @click.prevent="call_store(`set_${store_prefix}`,item)">
                                        {{ item.user.first_name }} {{ item.user.last_name }}
                                    </span>
                                </td>
                                <td>
                                    {{ item.monthly_fee }}
                                </td>
                                <td>
                                    <span v-if="item.admission_date">
                                        {{ moment(item.admission_date).format('DD MMM, YYYY') }}
                                    </span>
                                </td>
                                <td>
                                    <span v-if="item.fee_start_from">
                                        {{ moment(item.fee_start_from).format('DD MMM, YYYY') }}
                                    </span>
                                </td>
                                <td>
                                    {{ item.payments_sum_amount }}
                                </td>
                                <td>
                                    <span v-if="item.user">
                                        {{ item.user.branch_code }}
                                    </span>
                                </td>
                                <td>
                                    <span v-if="item.user">
                                        {{ item.user.mobile_number }}
                                    </span>
                                </td>
                                <td>
                                    <div class="table_actions">
                                        <a href="#" @click.prevent="()=>''" class="btn btn-sm btn-outline-secondary">
                                            <i class="fa fa-gears"></i>
                                        </a>
                                        <ul>
                                            <li>
                                                <permission-button
                                                    :permission="'can_create'"
                                                    :to="{name:`Details${route_prefix}`,params:{id:item.id}}"
                                                    :classList="''">
                                                    <i class="fa text-secondary fa-eye"></i>
                                                    Details
                                                </permission-button>
                                            </li>
                                            <li>
                                                <permission-button
                                                    :permission="'can_create'"
                                                    :to="{name:`Edit${route_prefix}`,params:{id: item.id}}"
                                                    :classList="''">
                                                    <i class="fa text-warning fa-pencil"></i>
                                                    Edit
                                                </permission-button>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="footer_modal d-flex justify-content-between align-items-start">
                    <pagination :data="this[`get_${store_prefix}s`]" :limit="5" :size="'small'" :show-disabled="true" :align="'left'"
                        @pagination-change-page="handle_pagination">
                        <span slot="prev-nav"><i class="fa fa-angle-left"></i> Previous</span>
                        <span slot="next-nav">Next <i class="fa fa-angle-right"></i></span>
                    </pagination>
                    <button type="button" @click.prevent="call_store(`set_${store_prefix}_show_management_modal`,(false))" href="#" class="btn rounded-pill btn-outline-secondary">
                        <i class="fa fa-floppy-disk"></i>
                        Save & Close
                    </button>
                </div>
            </div>
        </div>

        <!-- <create-canvas></create-canvas>
        <edit-canvas></edit-canvas> -->
    </div>
</template>

<script>
import { mapActions, mapGetters, mapMutations } from 'vuex'
import TableTh from './TableTh.vue';
import PermissionButton from '../../../../components/PermissionButton.vue';
/** store and route prefix for export object use */
import PageSetup from '../PageSetup';
import moment from 'moment';
const {route_prefix, store_prefix} = PageSetup;

export default {
    components: { TableTh, PermissionButton },
    props: {
        'select_qty': Number,
    },
    data: function(){
        return {
            /** store prefix for JSX */
            store_prefix,
            route_prefix,
        }
    },
    created: function(){
        this[`set_${this.store_prefix}_paginate`](9);
        // this[`fetch_${this.store_prefix}s`]();
        if(this.select_qty){
            this[`set_${store_prefix}_show_management_modal_qty`](this.select_qty)
        }
    },
    methods: {
        ...mapActions([`fetch_${store_prefix}s`]),
        ...mapMutations([
            `set_${store_prefix}_paginate`,
            `set_${store_prefix}_page`,
            `set_${store_prefix}_search_key`,
            `set_${store_prefix}_orderByCol`,
            `set_${store_prefix}`,
            `set_selected_${store_prefix}s`,
            `set_select_all_${store_prefix}s`,
            `set_clear_selected_${store_prefix}s`,
            `set_${store_prefix}_show_selected`,

            `set_${store_prefix}_show_selected`,
            `set_${store_prefix}_show_create_canvas`,
            `set_${store_prefix}_show_edit_canvas`,
            `set_${store_prefix}_show_management_modal`,
            `set_${store_prefix}_show_management_modal_qty`,
        ]),
        moment,
        call_store: function(name, params=null){
            console.log(name);
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
            `get_${store_prefix}_show_management_modal`,
            `get_${store_prefix}_show_management_modal_qty`,
        ]),
    }
};
</script>

<style>
</style>
