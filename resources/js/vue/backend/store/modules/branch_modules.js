import axios from "axios";
import management_router from "../../router/router";
import StoreModule from "./schema/StoreModule";

let test_module = new StoreModule('branch','branch','Branch');
const {store_prefix, api_prefix, route_prefix} = test_module;

// state list
const state = {
    ...test_module.states(),
    branch_batchs: {},
    [`orderByAsc`]: false,
};

// get state
const getters = {
    ...test_module.getters(),
    get_branch_batchs: state => state.branch_batchs
};

// actions
const actions = {
    ...test_module.actions(),
    [`fetch_${store_prefix}s`]: async function ({ state }) {
        let url = `/${api_prefix}/all?page=${state[`${store_prefix}_page`]}&status=${state[`${store_prefix}_show_active_data`]}&paginate=${state[`${store_prefix}_paginate`]}`;
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

    [`fetch_${store_prefix}`]: async function ({ state, commit }, { id }) {
        let url = `/${api_prefix}/${id}`;
        await axios.get(url).then((res) => {
            this.commit(`set_${store_prefix}`, res.data);

            var image = `
                <img src="/${res.data.image}"/>
            `;
                
            setTimeout(() => {
                var file_previews = document.querySelector('.file_preview');
                file_previews.innerHTML = image || ''
            }, 1000);

        });
    },

    /** override store */
    [`store_${store_prefix}`]: function({state, getters, commit}){
        const {form_values, form_inputs, form_data} = window.get_form_data('.branch_create_form');
        // const {get_user_role_selected: role} = getters;
        // role.forEach(i=>form_data.append('user_role_id[]',i.role_serial));

        axios.post(`/${api_prefix}/store`,form_data)
            .then(res=>{
                window.s_alert('new branch has been created');
                $('.branch_create_form input').val('');
                // commit('set_clear_selected_user_roles',false);
                management_router.push({name:`All${route_prefix}`})
            })
            .catch(error=>{

            })
    },

    // fetch_branch_batchs: function (params) {
        
    // },

    fetch_branch_batchs: async function(state, id) {
        let url = `/${api_prefix}/branch-batches/${id}`
        await axios.get(url)
        .then((res) => {
            this.commit('set_branch_batchs', res.data);
        })
    },

    set_branch_for_batch: function ({ commit, dispatch }, data) {
        commit(`set_selected_${store_prefix}s`, data);
        dispatch('fetch_branch_batchs', data.id);
    },

    [`create_${store_prefix}_admin`]: function({state, getters, commit}, branch_id){
        const {form_values, form_inputs, form_data} = window.get_form_data('.create_branch_admin');
        // const {get_user_role_selected: role} = getters;
        // role.forEach(i=>form_data.append('user_role_id[]',i.role_serial));

        form_data.append('branch_id', branch_id);
        axios.post(`/${api_prefix}/create-branch-admin`,form_data)
            .then(res=>{
                window.s_alert('new branch admin has been created');
                $('.create_branch_admin input').val('');
                // commit('set_clear_selected_user_roles',false);
                management_router.push({name:`All${route_prefix}`})
            })
            .catch(error=>{

            })
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
    set_branch_batchs: function (state, data) {
        state.branch_batchs = data;
        // console.log(state.class_batchs);
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};
