import axios from "axios";
import management_router from "../../router/router";
import StoreModule from "./schema/StoreModule";

let test_module = new StoreModule('admin_employee_attendence','admin_attendence_employee','Employee-attendence');
const {store_prefix, api_prefix, route_prefix} = test_module;

// state list
const state = {
    ...test_module.states(),
    admin_employee_attendences: {}
};

// get state
const getters = {
    ...test_module.getters(),
    get_admin_employee_attendences: state => state.admin_employee_attendences,
};

// actions
const actions = {
    ...test_module.actions(),

    // [`fetch_admin_${store_prefix}s`]: async function ({state}, date) {
        
    //     let url = `/${api_prefix}/admin-all?page=${state[`${store_prefix}_page`]}&attendence_date=${date}`;
    //     await axios.get(url).then((res) => {
    //         this.commit(`set_admin_employee_attendences`, res.data);
    //     });
    // },

    [`fetch_${store_prefix}s`]: async function ({ state }, data) {
        console.log(data);
        let url = `/${api_prefix}/all?page=${state[`${store_prefix}_page`]}&status=${state[`${store_prefix}_show_active_data`]}&paginate=${state[`${store_prefix}_paginate`]}`;

        if(data && data.branch_id != '') {
            url = `/${api_prefix}/all?page=${state[`${store_prefix}_page`]}&status=${state[`${store_prefix}_show_active_data`]}&paginate=${state[`${store_prefix}_paginate`]}&branch_id=${data.branch_id}`;
        }
        if(data && data.role != '') {
            url = `/${api_prefix}/all?page=${state[`${store_prefix}_page`]}&status=${state[`${store_prefix}_show_active_data`]}&paginate=${state[`${store_prefix}_paginate`]}&role=${data.role}`;
        }

        if(data && data.branch_id != '' && data.role != '') {
            url = `/${api_prefix}/all?page=${state[`${store_prefix}_page`]}&status=${state[`${store_prefix}_show_active_data`]}&paginate=${state[`${store_prefix}_paginate`]}&branch_id=${data.branch_id}&role=${data.role}`;
        }
        
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
            this.commit(`set_${store_prefix}s`, res.data);
        });
    },

    admin_employee_attendence_submit: async function(state, data) {
        let url = `/${api_prefix}/employee-attendence`
        await axios.post(url, data)
        .then((res) => {
            window.s_alert(
                `Attendence updated!`
            );
        })
    },

    admin_employee_attendence_update: async function(state, data) {
        let url = `/${api_prefix}/employee-attendence-update`
        await axios.post(url, data)
        .then((res) => {
            window.s_alert(
                `Attendence updated!`
            );
        })
    },

    
}

// mutators
const mutations = {
    ...test_module.mutations(),
    set_admin_employee_attendences: function (state, data) {
        state.admin_employee_attendences = data;
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};
