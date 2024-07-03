<template>
    <div class="conatiner">
        <div class="card list_card">
            <div class="card-header">
                <h3>
                    Employee salary list
                </h3>
                
                <div class="btns d-flex gap-2 align-items-center">
                    <!-- <permission-button
                        :permission="'can_create'"
                        :to="{name: `Create${route_prefix}`}"
                        :classList="'btn rounded-pill btn-outline-info'">
                        <i class="fa fa-pencil me-5px"></i>
                        Create
                    </permission-button> -->
                    <div class=" form-group d-grid align-content-start gap-1 mb-2" style="padding-right: 50px;">
                        <label for="month">Select month</label>
                        <select v-model="month"  @change="fetch_active_employees_by_month($event)" class="form-select" name="month" id="month">
                            <option value="">Select month</option>
                            <option v-for="(item, index) in months" :key="index" :value="item">{{ item }}</option>
                        </select>
                    </div>
                    <div class="table_actions">
                        <a href="#" @click.prevent="()=>''" class="btn px-1 btn-outline-secondary">
                            <i class="fa fa-list"></i>
                        </a>
                        <ul>
                            <li>
                                <a href="" @click.prevent="export_exam_student_all()">
                                    <i class="fa-regular fa-hand-point-right"></i>
                                    Export All
                                </a>
                            </li>
                            <!-- <li v-if="this[`get_${store_prefix}_selected`].length">
                                <a href="" @click.prevent="call_store(`export_selected_${store_prefix}_csv`)">
                                    <i class="fa-regular fa-hand-point-right"></i>
                                    Export Selected
                                </a>
                            </li> -->
                            <li>
                                <router-link :to="{name:`Import${route_prefix}`}">
                                    <i class="fa-regular fa-hand-point-right"></i>
                                    Import
                                </router-link>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row justify-content-center">
                    <div class="table-responsive card-body text-nowrap pb-5">
                        <table class="table table-hover table-bordered" v-if="employees.length > 0">
                            <thead class="table-light">
                                <tr>
                                    <!-- <th><input @click="call_store(`set_select_all_${store_prefix}s`)" type="checkbox" class="form-check-input check_all"></th> -->
                                    <table-th :sort="false" :tkey="'employee'" :title="'Employee'" />
                                    <table-th :sort="false" :tkey="'fixed_salary'" :title="'Fixed Salary'" />
                                    <table-th :sort="false" :tkey="'fixed_hourly_salary'" :title="'hourly Salary'" />
                                    <table-th :sort="false" :tkey="'total_monthly_attendance'" :title="'Fixed attendence'" />
                                    <table-th :sort="false" :tkey="'attend_monthly_attendance'" :title="'Monthly attendence'" />
                                    <table-th :sort="false" :tkey="'calculated_monthly_salary'" :title="'Calculated salary'" />
                                    <table-th :sort="false" :tkey="'daily_salary'" :title="'Daily Salary'" />
                                    <table-th :sort="false" :tkey="'given'" :title="'Given Salary'" />
                                    <table-th :sort="false" :tkey="'due'" :title="'Due Salary'" />
                                    <th style="width: 250px;">Salary</th>
                                </tr>
                            </thead>
                            <!-- {{ get_exam_students.data }} -->
                            <tbody class="table-border-bottom-0">
                                <tr v-for="(item, index) in employees" :key="index">
                                    <td>
                                        <span class="text-warning cursor_pointer">
                                            {{ item.first_name }} {{ item.last_name }}
                                        </span>
                                    </td>

                                    <td>
                                        <span class="text-info" v-if="item.user_salary">
                                            {{ item.user_salary.salary }}
                                        </span>
                                    </td>

                                    <td>
                                        <span v-if="item.user_salary">
                                            {{ item.user_salary.hourly_salary }}
                                        </span>
                                    </td>
                                    
                                    <td>
                                        {{ item.total_monthly_attendance }}
                                    </td>
                                    <td>
                                        {{ item.total_monthly_present_day }}
                                    </td>
                                    <td>
                                        <span v-if="item.monthly_calculated_salary > 0">
                                            {{ item.daily_fixed_salary.toFixed(2) }}
                                        </span>
                                        <span v-if="item.monthly_hourly_calculated_salary > 0">
                                            {{ item.monthly_hourly_calculated_salary.toFixed(2) }}
                                        </span>
                                        
                                    </td>
                                    <td>
                                        {{ item.monthly_calculated_salary.toFixed(2) }}
                                    </td>
                                    <td>
                                        <span class="text-success">
                                            {{ item.salary_statements_sum_salary_amount }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="text-danger"  v-if="item.user_salary && item.user_salary.salary != null && item.user_salary.salary > 0">
                                            {{ item.user_salary.salary - item.salary_statements_sum_salary_amount }}
                                        </span>
                                        <span class="text-danger"  v-if="item.user_salary && item.user_salary.hourly_salary != null">
                                            {{ item.monthly_hourly_calculated_salary - item.salary_statements_sum_salary_amount }}
                                        </span>
                                    </td>
                                    <td style="width: 250px;">
                                        <!-- {{ item.salary_amount }} -->
                                        <input type="number" id="mark" v-model="item.salary_amount" class="form-control">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="card-footer text-center" v-if="get_active_employees.length > 0">
                <button type="submit" @click="submit_salary()" class="btn btn-outline-success me-5px">
                    <i class="fa fa-upload"></i>
                    Submit
                </button>
                <button type="submit" class="btn btn-outline-warning">
                    <i class="fa fa-times"></i>
                    Reset
                </button>
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

function debounce(fn, wait){
    let timer;
    return function(...args){
        if(timer) {
            clearTimeout(timer); // clear any pre-existing timer
        }
        const context = this; // get the current context
        timer = setTimeout(()=>{
            fn.apply(context, args); // call the function if time expires
        }, wait);
    }
}
export default {
    components: { PermissionButton, TableTh, DetailsCanvas, SelectedCanvas },
    data: function(){
        return {
            store_prefix,
            route_prefix,
            mark: '',
            months: [
                "January", "February", "March", "April", "May", "June", 
                "July", "August", "September", "October", "November", "December"
            ],
            month: '',
            employees: [
                
            ]
        }
    },
    created: function(){
        // this.fetch_active_employees();
    },
    watch : {
        get_active_employees: function(val) {
            if(val.length>0) {
                this.employees = val
                let that = this;
                val.forEach(element => {
                    if(element.salary_amount > 0 && element.salary_amount != null) {
                        element.salary_amount = element.user_salary.salary - element.salary_statements_sum_salary_amount;
                        element.month = that.month;
                    }else {
                        element.salary_amount = element.monthly_hourly_calculated_salary - element.salary_statements_sum_salary_amount;
                        element.month = that.month;
                    }


                });
            }
        },
    },
    methods: {
        ...mapActions([
            `fetch_active_employees_by_month`,
            `export_${store_prefix}_all`,
            `export_selected_${store_prefix}_csv`,
            `submit_employee_salary`,
            `export_exam_student_all`
        ]),
        ...mapMutations([
            // `set_${store_prefix}_paginate`,
            // `set_${store_prefix}_page`,
            // `set_${store_prefix}_search_key`,
            // `set_${store_prefix}_orderByCol`,
            // `set_${store_prefix}_show_active_data`,
            // `set_${store_prefix}`,
            // `set_selected_${store_prefix}s`,
            // `set_select_all_${store_prefix}s`,
            // `set_clear_selected_${store_prefix}s`,
        ]),

        submit_salary: async function($event, employee) {
            
            let event = $event;

            let params = this.employees

            // console.log(params);
            let salary_month = this.month;
            await this.submit_employee_salary(params);
            // console.log(salary_month);
            await this.fetch_active_employees_by_month(salary_month)

        },
        
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
            `get_active_employees`
        ]),
    }
}
</script>

<style>

</style>

