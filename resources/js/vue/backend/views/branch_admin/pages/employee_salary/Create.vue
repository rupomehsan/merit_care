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
            <form @submit.prevent="call_store(`store_${store_prefix}`,$event.target)" class="salary_form" autocomplete="false" enctype="multipart/form-data">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="admin_form form_1">
                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    
                                    <div>
                                        <label class="mb-2 text-capitalize">
                                            Select Employee
                                        </label>
                                        <employee-management-modal :select_qty="1"></employee-management-modal>
                                    </div>
                                    
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <input-field
                                        :label="`Salary amount`"
                                        :name="`salary_amount`"
                                    />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <label for="date">Date</label>
                                    <input type="date" name="date" class="form-control">    
                                </div>
                            </div>
                            <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                <label for="date">Salary types</label>
                                <div v-for="salary_cat in this[`get_salary_categories`]" :key="salary_cat.id" class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" v-model="salary_category" name="salary_categories" :id="`category${salary_cat.id}`" v-bind:value="salary_cat.id">
                                    <label class="form-check-label" :for="`category${salary_cat.id}`" >{{ salary_cat.title }}</label>
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
import { mapActions, mapGetters, mapMutations } from 'vuex'
import InputField from '../../../components/InputField.vue'
/** store and route prefix for export object use */
import PageSetup from './PageSetup';
import EmployeeManagementModal from "../employee/components/ManagementModal.vue"
const {route_prefix, store_prefix} = PageSetup;

export default {
    components: { InputField, EmployeeManagementModal },
    data: function(){
        return {
            /** store prefix for JSX */
            store_prefix,
            route_prefix,
            salary_category: ''
        }
    },
    created: function () {
        this[`set_clear_selected_employees`](false);
        this.fetch_salary_categories();
    },
    methods: {
        ...mapActions([
            `store_${store_prefix}`,
            `fetch_active_employees`,
            `fetch_salary_categories`
        ]),
        ...mapMutations([
            `set_clear_selected_employees`,
        ]),
        call_store: function(name, params=null){
            params = {
                salary_category_id: this.salary_category
            };
            this[name](params)
        },
    },
    computed: {
        ...mapGetters([
            // `get_active_employees`,
            `get_salary_categories`
        ]),
    }
};
</script>

<style>
</style>
