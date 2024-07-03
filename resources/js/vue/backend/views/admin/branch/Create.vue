<template>
    <div class="container">
        <div class="card list_card">
            <div class="card-header">
                <h4>Create Branch coaching</h4>
                <div class="btns">
                    <router-link :to="{ name: `All${route_prefix}` }" class="btn rounded-pill btn-outline-warning">
                        <i class="fa fa-arrow-left me-5px"></i>
                        Back
                    </router-link>
                </div>
            </div>
            <form @submit.prevent="call_store(`store_${store_prefix}`, $event.target)" class="branch_create_form"
                autocomplete="false">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="admin_form form_1">
                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <div class="field_wrapper">
                                        <label for="name" class="text-capitalize d-block">
                                            <span class="mb-2 d-block">
                                                Branch Name
                                            </span>
                                            <input type="text" id="name" @focusin="show_branch_list = true" v-model="branch_name" name="name" class="form-control">
                                        </label>
                                    </div>

                                    <div class="branch-list-group" v-if="show_branch_list">
                                        <ul class="branch-list">
                                            <li class="text-end position-absolute end-0 me-1">
                                                <i class="fa fa-close" @click="show_branch_list = false"></i>
                                            </li>
                                            <li v-for="branch in all_branches" :key="branch.id">
                                                <label :for="`${branch.id}_hjhj`">
                                                    <input v-model="branch_name" type="radio" name="branch_name"
                                                        :id="`${branch.id}_hjhj`" :value="branch.name" />
                                                    <span>{{ branch.name }}</span>
                                                </label>
                                            </li>

                                        </ul>
                                    </div>
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`Coaching Name`" :name="`coaching_name`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                    <input-field :label="`Logo`" :name="`image`" :type="`file`" :accept="`image/*`"
                                        :multiple="false" :preview="true" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                    <label for="division_id">Select Division</label>
                                    <select name="division_id" id="division_id"
                                        @change.prevent="getDistrictDivision($event)" class="form-select mb-3">
                                        <option value="">Select division</option>
                                        <option v-for="(division, index) in get_all_divisions" :key="index"
                                            :value="division.id">{{ division.name }}</option>
                                    </select>
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                    <label for="district_id">Select District</label>
                                    <select name="district_id" id="district_id"
                                        @change.prevent="getUpozilaDistrict($event)" class="form-select mb-3">
                                        <option value="">Select district</option>
                                        <option v-for="(dist, index) in get_all_districts" :key="index"
                                            :value="dist.id">{{ dist.name }}</option>
                                    </select>
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2">
                                    <label for="upozila_id">Select Upozila</label>
                                    <select name="upozila_id" id="upozila_id" class="form-select mb-3">
                                        <option value="">Select upozila</option>
                                        <option v-for="(upozila, index) in get_all_upozilas" :key="index"
                                            :value="upozila.id">{{ upozila.name }}</option>
                                    </select>
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`Coaching Code`" :name="`branch_code`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`Street`" :name="`street`" />
                                </div>
                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`City`" :name="`city`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`State`" :name="`state`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`Zip code`" :name="`zip_code`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`Country`" :name="`country`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`Name in Invoice`" :name="`invoice_name`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`Address in Invoice`" :name="`invoice_address`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`Email in Invoice`" :name="`invoice_email`" :type="`email`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <input-field :label="`Mobile number in Invoice`" :name="`invoice_mobile_number`"
                                        :type="`number`" />
                                </div>

                                <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <label for="map_linnk">Map link</label>
                                    <textarea class="form-control" id="map_linnk" name="map_linnk"></textarea>
                                </div>

                                <!-- <div class=" form-group d-grid align-content-start gap-1 mb-2 " >
                                    <label for="details">Details</label>
                                    <textarea class="form-control" id="details" name="details"></textarea>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-center">
                    <button type="submit" class="btn btn-outline-info">
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
import axios from 'axios';
const { route_prefix, store_prefix } = PageSetup;

export default {
    components: { InputField },
    data: function () {
        return {
            /** store prefix for JSX */
            store_prefix,
            route_prefix,

            all_branches: [],
            branch_name: '',
            show_branch_list: false
        }
    },
    created: async function () {

        await this.fetch_all_branches();
        await this.fetch_all_divisions();
        await this.fetch_all_districts();
        await this.fetch_all_upozilas();

    },

    methods: {
        ...mapActions([
            `store_${store_prefix}`,
            `fetch_all_districts`,
            `fetch_districts_by_division`,
            `fetch_upozila_by_district`,
            `fetch_all_divisions`,
            `fetch_all_upozilas`,
            `fetch_all_branches`,
        ]),
        call_store: function (name, params = null) {
            this[name](params)
        },

        getDistrictDivision: async function (event) {
            await this.fetch_districts_by_division(event.target.value);
        },
        getUpozilaDistrict: async function (event) {
            await this.fetch_upozila_by_district(event.target.value);
        },
        fetch_all_branches: async function () {
            let response = await axios.get(`/branch/get-all-institute-branches`);
            this.all_branches = response.data;
        }
    },

    computed: {
        ...mapGetters([
            `get_${store_prefix}`,
            `get_all_districts`,
            `get_all_divisions`,
            `get_all_upozilas`,
        ])
    }

};
</script>

<style>
.branch-list-group {
    position: relative;
}

.branch-list {
    position: absolute;
    background-color: #161D31;
    max-height: 200px;
    width: 200px;
    padding: 20px;
    overflow-y: auto;
    top: 100%;
    left: 0;
    list-style-type: none;
    display: grid;
    row-gap: 10px;
}
</style>
