<template>
    <div class="container">
        <div class="card list_card">
            <div class="card-header">
                <h4>Create</h4>
                <div class="btns">
                    <router-link :to="{ name: `All${route_prefix}` }" class="btn rounded-pill btn-outline-warning" >
                        <i class="fa fa-arrow-left me-5px"></i>
                        Back
                    </router-link>
                </div>
            </div>
            <form @submit.prevent="call_store(`store_${store_prefix}`,$event.target)" class="monthly_fee_form" autocomplete="false" enctype="multipart/form-data">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="admin_form form_1">

                                <!-- <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <label for="institute_student_id">Select Student</label>
                                    <select class="form-select" @change="get_student_ids($event)" name="institute_student_id" id="institute_student_id">
                                        <option value="">Select a user</option>
                                        <option v-for="item in get_all_students" :data-selected_id="item.user.id" :key="item.id" :value="item.id">{{ item.user.first_name }} {{ item.user.last_name }}</option>
                                    </select>
                                </div> -->

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <div>
                                        <label class="mb-2 text-capitalize">
                                            Select Student
                                        </label>
                                        <student-management-modal :select_qty="1"></student-management-modal>
                                    </div>
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                    <input-field
                                        :label="`Amount`"
                                        :name="`amount`"
                                    />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                    <label for="date">Date</label>
                                    <input class="form-control" type="date" name="date" id="date">
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                    <label for="for_month">For Month</label>
                                    <input class="form-control" type="month" name="for_month" id="for_month">
                                </div>

                            </div>

                            <div class="row mt-4 pt-4 border-top" v-if="Object.keys(history).length">
                                <div class="col-12 pb-3">
                                    <button type="button" class="btn btn-sm btn-outline-warning" @click="get_histories">
                                        <i class="fa fa-rotate"></i>
                                    </button>
                                </div>
                                <div class="col-xl-4 col-lg-4 pb-3">
                                    <div>
                                        <h4>At a glance</h4>
                                        <table class="text-start text-nowrap table">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 100px;">Monthly Fee :</th>
                                                    <td style="width: 100px;" class="text-end">{{history.monthly_fee}} ৳</td>
                                                </tr>
                                                <tr>
                                                    <th>Total bill :</th>
                                                    <td class="text-end">{{history.total_bill}} ৳</td>
                                                </tr>
                                                <tr>
                                                    <th>Paid :</th>
                                                    <td class="text-end">{{history.paid}} ৳</td>
                                                </tr>
                                                <tr>
                                                    <th>Due :</th>
                                                    <td class="text-end">{{history.due}} ৳</td>
                                                </tr>
                                                <tr>
                                                    <th>Advanced :</th>
                                                    <td class="text-end">{{history.advanced}} ৳</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-8 pb-3">
                                    <div>
                                        <h4>Payments</h4>
                                        <table class="text-start text-nowrap table">
                                            <tbody>
                                                <tr v-for="(item, index) in history.payment_history" :key="index">
                                                    <th style="width: 100px;"> {{ item.month }} :</th>
                                                    <td style="width: 100px;" class="text-end">{{ item.paid }} ৳</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-6 pb-3">
                                    <div>
                                        <h4>Due months</h4>
                                        <table class="text-start text-nowrap table">
                                            <tbody>
                                                <tr v-for="(item, index) in history.due_months" :key="index">
                                                    <th style="width: 100px;"> {{ item.month }} :</th>
                                                    <td style="width: 100px;" class="text-end">{{ item.paid }} ৳</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-6 pb-3">
                                    <div>
                                        <h4>Paid months</h4>
                                        <table class="text-start text-nowrap table">
                                            <tbody>
                                                <tr v-for="(item, index) in history.paid_months" :key="index">
                                                    <th style="width: 100px;"> {{ item.month }} :</th>
                                                    <td style="width: 100px;" class="text-end">{{ item.paid }} ৳</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="card-footer text-center">
                    <button type="submit" class="btn btn-outline-info" >
                        <i class="fa fa-upload"></i>
                        Submit
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import InputField from '../../../components/InputField.vue'
import StudentManagementModal from "../student/components/ManagementModal.vue"

/** store and route prefix for export object use */
import PageSetup from './PageSetup';
const {route_prefix, store_prefix} = PageSetup;

export default {
    components: { InputField, StudentManagementModal },
    data: function(){
        return {
            /** store prefix for JSX */
            store_prefix,
            route_prefix,
            student_id: '',
            user_id: '',
            history: {},
        }
    },
    created: function () {
        // this.fetch_all_students();
    },
    watch: {
        'get_student_selected': {
            handler: function(){
                this.get_histories();
            },
            deep: true,
        }
    },
    methods: {
        get_student_ids: function(event) {
            this.student_id = event.target.value;
            this.user_id = event.target.selectedOptions[0].dataset.selected_id;
        },
        ...mapActions([
            `store_${store_prefix}`,
            'fetch_all_students'
        ]),
        call_store: function(name, params=null){
            // let student_ids = {
            //     student_id: this.student_id,
            //     user_id: this.user_id
            // }
            // console.log(student_ids);
            // params = student_ids
            this[name](params)
        },
        get_histories: function(){
            axios.post('/student/payments/dues',{user_id: this.get_student_selected[0].user_id})
                    .then(res=>{
                        this.history = res.data;
                    });
        }
    },
    computed: {
        ...mapGetters([
            `get_all_students`,
            `get_students`,
            `get_student_selected`,
        ]),
    }
};
</script>

<style>
</style>
