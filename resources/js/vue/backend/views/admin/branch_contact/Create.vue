<template>
    <div class="container">
        <div class="card list_card">
            <div class="card-header">
                <h4>Create Branch</h4>
                <div class="btns">
                    <router-link :to="{ name: `All${route_prefix}` }" class="btn rounded-pill btn-outline-warning" >
                        <i class="fa fa-arrow-left me-5px"></i>
                        Back
                    </router-link>
                </div>
            </div>
            <form @submit.prevent="call_store(`store_${store_prefix}`,$event.target)" class="branch_create_form" autocomplete="false">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="admin_form form_1">
                                <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                    <label for="branch_id">Select branch</label>
                                    <select name="branch_id" id="branch_id" class="form-select mb-3">
                                        <option value="">Select Branch</option>
                                        <option v-for="(branch, index) in get_all_branches" :key="index" :value="branch.id">{{ branch.name }}</option>
                                    </select>
                                </div>
                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`First name`"
                                        :name="`first_name`"
                                    />
                                </div>
                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Last name`"
                                        :name="`last_name`"
                                    />
                                </div>
                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Email`"
                                        :name="`email`"
                                        :type="`email`"
                                    />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Phone number`"
                                        :name="`phone_number`"
                                        :type="`number`"
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
    created: function () {
        this[`fetch_all_branches`]();
    },
    methods: {
        ...mapActions([
            `fetch_all_branches`,
        ]),
        ...mapActions([`store_${store_prefix}`]),
        call_store: function(name, params=null){
            this[name](params)
        },
    },
    computed: {
        ...mapGetters([
            `get_all_branches`,
        ]),
    }
};
</script>

<style>
</style>
