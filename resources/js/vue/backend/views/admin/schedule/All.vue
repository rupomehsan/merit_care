<template>
    <div class="conatiner">
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
                    <form action="#">
                        <input @keyup="call_store(`set_${store_prefix}_search_key`,$event.target.value)" class="form-control border border-info" placeholder="search..." type="search">
                    </form>
                </div>
                <div class="btns d-flex gap-2 align-items-center">
                    <!-- <permission-button
                        :permission="'can_create'"
                        :to="{name: `Create${route_prefix}`}"
                        :classList="'btn rounded-pill btn-outline-info'">
                        <i class="fa fa-pencil me-5px"></i>
                        Create
                    </permission-button> -->
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
                <div class="row">
                    <div class="col-6">
                        <h5>Filter by branch</h5>
                        <select name="branch_id" class="form-select mb-3" v-model="branch_id" @change="call_schedule_by_branch($event)" id="branch_id">
                            <option value="">Select Branch</option>
                            <option v-for="(branch, index) in get_all_branches" :key="index" :value="branch.id">{{ branch.name }}</option>
                        </select>
                    </div>
                    <div class="col-6">
                        <h5>Filter by teacher</h5>
                        <select name="teacher_id" class="form-select mb-3" v-model="teacher_id" @change="call_schedule_by_teacher($event)" id="teacher_id">
                            <option value="">Select teacher</option>
                            <option v-for="(teacher, index) in get_all_teachers" :key="index" :value="teacher.id">{{ teacher.user.first_name }} {{ teacher.user.last_name }}</option>
                        </select>
                    </div>
                </div>
                <table class="table table-hover table-striped table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th><input @click="call_store(`set_select_all_${store_prefix}s`)" type="checkbox" class="form-check-input check_all"></th>
                            <table-th :sort="true" :tkey="'id'" :title="'ID'" :ariaLable="'id'"/>
                            <table-th :sort="true" :tkey="'day'" :title="'Day'" />
                            <table-th :sort="false" :tkey="'branch_id'" :title="'Branch'" />
                            <table-th :sort="true" :tkey="'institute_class_teacher_id'" :title="'Teacher'" />
                            <table-th :sort="true" :tkey="'institute_class_batch_id'" :title="'Batch'" />
                            <table-th :sort="false" :tkey="'class'" :title="'Class'" />
                            <table-th :sort="true" :tkey="'institute_class_subject_id'" :title="'Subject'" />
                            <table-th :sort="true" :tkey="'start_time'" :title="'Start Time'" />
                            <table-th :sort="true" :tkey="'end_time'" :title="'End Time'" />
                            <table-th :sort="true" :tkey="'room'" :title="'Room no'" />
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
                                <span class="text-warning cursor_pointer" @click.prevent="call_store(`set_${store_prefix}`,item)">
                                    {{ item.day }}
                                </span>
                            </td>
                            <td>
                                <span class="text-primary cursor_pointer" v-if="item.branch">
                                    {{ item.branch.name }}
                                </span>
                            </td>
                            <td v-if="item.teacher">{{ item.teacher.user.first_name }} {{ item.teacher.user.last_name }}</td>
                            <td v-else><span class="text-danger">Teacher not added</span></td>
                            <td v-if="item.batch">{{ item.batch.name }}</td>
                            <td v-if="item.class">{{ item.class.title }}</td>
                            <td v-if="item.subject">{{ item.subject.title }}</td>
                            <td>{{ item.start_time }}</td>
                            <td>{{ item.end_time }}</td>
                            <td>{{ item.room }}</td>
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
import PermissionButton from '../../components/PermissionButton.vue';
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
            branch_id: '',
            teacher_id: ''
        }
    },
    created: async function(){
        await this[`fetch_${store_prefix}s`]();
        await this[`fetch_all_branches`]();
        await this[`fetch_all_teachers`]();
    },
    methods: {
        ...mapActions([
            `fetch_${store_prefix}s`,
            `soft_delete_${store_prefix}`,
            `restore_${store_prefix}`,
            `export_${store_prefix}_all`,
            `export_selected_${store_prefix}_csv`,
            `delete_${store_prefix}`,
            `fetch_all_branches`,
            `fetch_all_teachers`
        ]),
        ...mapMutations([
            `set_${store_prefix}_paginate`,
            `set_${store_prefix}_page`,
            `set_${store_prefix}_search_key`,
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

        call_schedule_by_branch: function(event) {
            
            // console.log(event.target.value)
            this.branch_id = event.target.value;
            let data = {
                branch_id: this.branch_id,
            }
            if(this.teacher_id && this.teacher_id != '') {
                data = {
                    branch_id: this.branch_id,
                    teacher_id: this.teacher_id,
                }
            }
            
            this[`fetch_${store_prefix}s`](data);
        },
        call_schedule_by_teacher: function(event) {
            // console.log(event.target.value);
            this.teacher_id = event.target.value;
            
            let data = {
                teacher_id: this.teacher_id,
            }
            if(this.branch_id && this.branch_id != '') {
                data = {
                    branch_id: this.branch_id,
                    teacher_id: this.teacher_id,
                }
            }
            this[`fetch_${store_prefix}s`](data);
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
            `get_all_branches`,
            `get_all_teachers`
        ]),
    }
}
</script>

<style>

</style>

