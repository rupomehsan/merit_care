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
            <form @submit.prevent="call_store(`store_${store_prefix}`,$event.target)" autocomplete="false" enctype="multipart/form-data">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="admin_form form_1">


                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <label for="batch">Select batch</label>
                                    <select class="form-select" name="batch_id" id="batch">
                                        <option v-for="(item, index) in admin_batch_names" :key="index" :value="item.id">{{ item.name }} - {{ item.class.title }}</option>
                                    </select>
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
                                            Gender
                                        </span>
                                        <div class="d-fex gap-3">
                                            <label for="male">
                                                <input type="radio" checked id="male" value="male" name="gender" >
                                                Male
                                            </label>
                                            <label for="female">
                                                <input type="radio" id="female" value="female" name="gender" >
                                                Female
                                            </label>
                                            <label for="others">
                                                <input type="radio" id="others" value="other" name="gender">
                                                Other
                                            </label>
                                        </div>
                                    </label>
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
                                        :label="`Monthly Fee`"
                                        :name="`monthly_fee`"
                                        :type="`number`"
                                    />
                                </div>

                                <div class="form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field
                                        :label="`Fee start from`"
                                        :name="`fee_start_from`"
                                        :type="`date`"
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
import { mapActions, mapGetters, mapState } from 'vuex'
import InputField from '../../../components/InputField.vue'
/** store and route prefix for export object use */
import PageSetup from './PageSetup';
const {route_prefix, store_prefix} = PageSetup;

export default {
    components: { InputField },
    data: function(){
        return {
            /** store prefix for JSX */
            store_prefix,
            route_prefix
        }
    },
    created: async function () {
        // this.fetch_batchs();
        await this.fetch_all_batch_names();
        console.log(this.admin_batch_names);
    },
    methods: {
        ...mapActions([
            `store_${store_prefix}`,
            'fetch_batchs',
            'fetch_all_batch_names',
        ]),
        call_store: function(name, params=null){
            this[name](params)
        },
    },
    computed: {
        ...mapGetters([
            `get_batchs`
        ]),
        ...mapState({
            admin_batch_names: ({batch_modules}) => batch_modules.admin_batch_names,
        }),
    }
};
</script>

<style>
</style>
