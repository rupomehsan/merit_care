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
            <form @submit.prevent="call_store(`store_${store_prefix}`,$event.target)" class="admin_student_create_form" autocomplete="false" enctype="multipart/form-data">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="admin_form form_1">
                                

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <label for="batch">Select branch</label>
                                    <!-- <select class="form-select" name="batch_id" id="batch">
                                        <option v-for="(item, index) in get_batchs.data" :key="index" :value="item.id">{{ item.name }} - {{ item.class.title }}</option>
                                    </select> -->
                                    <branch-management-modal :select_qty="1"></branch-management-modal> 
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <label for="batch">Select batch</label>
                                    <select class="form-select" name="batch_id" id="batch">
                                        <option>select batch</option>
                                        <option v-for="(batch, index) in get_branch_batchs" :key="index" :value="batch.id">{{ batch.class.title }} - {{ batch.name }}</option>
                                    </select>
                                    <!-- <branch-management-modal :select_qty="1"></branch-management-modal>  -->
                                </div>


                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`First Name`"
                                        :name="`user_first_name`"
                                    />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Last Name`"
                                        :name="`user_last_name`"
                                    />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                    <label for="gender">Gender</label>
                                    <select name="gender" id="gender" class="form-select mb-3">
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Mobile Number`"
                                        :name="`mobile_number`"
                                    />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Email`"
                                        :name="`user_email`"
                                    />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Address`"
                                        :name="`user_address`"
                                    />
                                </div>

                                <div class="form-group d-grid align-content-start gap-1 mb-2 ">
                                    <label for="user_admission_date" class="text-capitalize d-block">
                                        <span class="mb-2 d-block">
                                            Admission Date
                                        </span> 
                                        <input type="date" id="admission_date" name="admission_date" class=" form-control"> 
                                    </label>
                                </div>

                                <div class="form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field
                                        :label="`Total monthly attendence`"
                                        :name="`total_monthly_attendance`"
                                    />
                                </div>

                                <div class="form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field
                                        :label="`Monthly fee`"
                                        :name="`total_monthly_fee`"
                                    />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Password`"
                                        :name="`user_password`"
                                    />
                                </div>

                                

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Confirm Password`"
                                        :name="`user_password_confirmation`"
                                    />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`photo`"
                                        :name="`photo`"
                                        :type="`file`"
                                        :accept="`image/*`"
                                        :multiple="false"
                                        :preview="true"
                                    />
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
import InputField from '../../components/InputField.vue'
import BranchManagementModal from "../branch/components/ManagementModal.vue";
/** store and route prefix for export object use */
import PageSetup from './PageSetup';
const {route_prefix, store_prefix} = PageSetup;

export default {
    components: { InputField, BranchManagementModal },
    data: function(){
        return {
            /** store prefix for JSX */
            store_prefix,
            route_prefix
        }
    },
    created: function () {
        // this.fetch_batchs();
    },
    methods: {
        ...mapActions([
            `store_${store_prefix}`,
            'fetch_batchs'
        ]),
        call_store: function(name, params=null){
            this[name](params)
        },
    },
    computed: {
        ...mapGetters([
            `get_batchs`,
            'get_branch_batchs'
        ])
    }
};
</script>

<style>
</style>
