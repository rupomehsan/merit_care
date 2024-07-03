import axios from "axios";
import management_router from "../../router/router";
import StoreModule from "./schema/StoreModule";
import { debounce } from "debounce";

let test_module = new StoreModule('monthly_fee','account/monthly_fee','MonthlyFee');
const {store_prefix, api_prefix, route_prefix} = test_module;

// state list
const state = {
    ...test_module.states(),
    all_students:{},
    single_student_monthly_fees: {} ,
    monthly_dues: {}
};

// get state
const getters = {
    ...test_module.getters(),
    get_all_students: (state) => state.all_students,
    get_monthly_dues: (state) => state.monthly_dues,
    get_single_student_monthly_fees: (state) => state.single_student_monthly_fees
};

// actions
const actions = {
    ...test_module.actions(),

    fetch_all_students: async function() {
        let url = `/${api_prefix}/get_all_students`
        await axios.get(url)
        .then((res) => {
            this.commit(`set_all_students`, res.data);

        })
    },

    fetch_dues_by_month: async function({state}, data) {
        let url = `/${api_prefix}/all-dues?page=${data.page||1}&status=${state[`${store_prefix}_show_active_data`]}&paginate=${state[`${store_prefix}_paginate`]}`;
        url += `&orderBy=${state.orderByCol}`;
        if (state.orderByAsc) {
            url += `&orderByType=ASC`;
        } else {
            url += `&orderByType=DESC`;
        }
        if (state[`${store_prefix}_search_key`]) {
            url += `&search_key=${state[`${store_prefix}_search_key`]}`;
        }

        await axios.get(url).then((res) => {
            this.commit('set_monthly_dues', res.data);
        })
        .catch((e) => {
            console.log(e);
        });
    },

    fetch_single_student_monthly_fees: async function() {
        let url = `/${api_prefix}/single_student_monthly_fees`
        await axios.get(url)
        .then((res) => {
            this.commit(`set_single_student_monthly_fees`, res.data);

        })
    },

    [`store_${store_prefix}`]: function ({state, getters, commit}, userData) {
        const {form_values, form_inputs, form_data} = window.get_form_data(`.monthly_fee_form`);
        // console.log(form_values, userData);
        const {
            get_student_selected: student_id,
        } = getters;
        console.log(student_id);
        form_data.append("institute_student_id", student_id[0].id);
        form_data.append("user_id", student_id[0].user_id);


        axios.post(`/${api_prefix}/store`, form_data).then((res) => {
            $(`.monthly_fee_form input`).val('');
            window.s_alert("Monthly fee paid successfully");
        });
    },

    [`delete_${store_prefix}`]: async function (
        { state, getters, dispatch },
        id
    ) {
        let cconfirm = await window.s_confirm("Delete");
        if (cconfirm) {
            axios
                .post(`/${api_prefix}/destroy`, { id })
                .then(({ data }) => {
                    dispatch(`fetch_${store_prefix}s`);
                    window.s_alert(
                        `${store_prefix} has been deleted`
                    );
                })
                .catch((e) => {
                    if(e.response.status == 400) {
                        window.s_alert('error '+e.response.status+': '+e.response.data.error,'error')
                    }
                });
        }
    },
}

// mutators
const mutations = {
    ...test_module.mutations(),
    set_all_students: function(state, data) {
        state.all_students = data;
    },
    set_monthly_dues: function(state, data) {
        state.monthly_dues = data;
    },
    set_single_student_monthly_fees: function(state, data) {
        state.single_student_monthly_fees = data;
    },
    set_monthly_fees_search_key: debounce(function(state, data){
        state[`${store_prefix}_search_key`] = data;
        this.dispatch('fetch_dues_by_month',{page: 1});
    },500),
};

export default {
    state,
    getters,
    actions,
    mutations,
};
