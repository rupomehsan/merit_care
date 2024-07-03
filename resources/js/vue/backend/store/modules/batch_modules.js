import axios from "axios";
import management_router from "../../router/router";
import StoreModule from "./schema/StoreModule";

let test_module = new StoreModule('batch', 'institute/class_batch', 'Batch');
const {
    store_prefix,
    api_prefix,
    route_prefix
} = test_module;

// state list
const state = {
    ...test_module.states(),
    batch_subjects: {},
    admin_batch_names: [],
    batch_releated_subjects: [],
    batch_class_subject: {},
};

// get state
const getters = {
    ...test_module.getters(),
    get_batch_releated_subjects: state => state.batch_releated_subjects,
    get_batch_class_subject: state => state.batch_class_subject,
};

// actions
const actions = {
    ...test_module.actions(),

    fetch_all_batch_names: async function ({
        state
    }) {
        let url = `/${api_prefix}/all-json`
        await axios.get(url)
            .then((res) => {
                // this.commit('set_batch_subjects', res.data);
                state['admin_batch_names'] = res.data
            })
    },

    fetch_class_batch_subject_for_exam: async function ({
        commit
    }, {
        class_id,
        branch_id,
        batch_id,
    }) {
        if (!class_id) return;
        let url = `/${api_prefix}/subjects`;
        await axios.get(url, {
                params: {
                    class_id,
                    branch_id,
                    batch_id,
                }
            })
            .then((res) => {
                commit('set_batch_releated_subjects', res.data.subjects);
                commit('set_batch_class_subject', res.data);
            })
    },

    fetch_class_batch_subjects: async function (state, {
        class_id
    }) {
        if (!class_id) return;
        let url = `/${api_prefix}/subjects/${class_id}`
        await axios.get(url)
            .then((res) => {
                this.commit('set_batch_subjects', res.data);
            })
    },

    setSelectedBatchs: function ({
        commit,
        dispatch
    }, data) {
        commit(`set_selected_${store_prefix}s`, data);
        dispatch('fetch_class_batch_subjects', data.id);
    },

    [`delete_${store_prefix}`]: async function ({
            state,
            getters,
            dispatch
        },
        id
    ) {
        let cconfirm = await window.s_confirm("Delete");
        if (cconfirm) {
            axios
                .post(`/${api_prefix}/destroy`, {
                    id
                })
                .then(({
                    data
                }) => {
                    dispatch(`fetch_${store_prefix}s`);
                    window.s_alert(
                        `${store_prefix} has been deleted`
                    );
                })
                .catch((e) => {
                    if (e.response.status == 400) {
                        window.s_alert('error ' + e.response.status + ': ' + e.response.data.error, 'error')
                    }
                });
        }
    },
}

// mutators
const mutations = {
    ...test_module.mutations(),
    set_batch_subjects: function (state, data) {
        state.batch_subjects = data;
    },
    set_batch_releated_subjects: function (state, data) {
        state.batch_releated_subjects = data;
    },
    set_batch_class_subject: function (state, data) {
        state.batch_class_subject = data;
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};
