import axios from "axios";
import management_router from "../../router/router";
import StoreModule from "./schema/StoreModule";

let test_module = new StoreModule('topic','customer/communication_topic','Topic');
const {store_prefix, api_prefix, route_prefix} = test_module;

// state list
const state = {
    ...test_module.states(),
    all_districts: {},
    all_divisions: {},
    all_upozilas: {}
};

// get state
const getters = {
    ...test_module.getters(),
    get_all_districts: state => state.all_districts,
    get_all_divisions: state => state.all_divisions,
    get_all_upozilas: state => state.all_upozilas,
};

// actions
const actions = {
    ...test_module.actions(),

    [`fetch_all_districts`]: async function ({ state, commit }) {
        let url = `/district/get-all`;
        await axios.get(url).then((res) => {
            this.commit(`set_all_districts`, res.data);
        });
    },

    [`fetch_districts_by_division`]: async function ({ state, commit }, id) {
        let url = `/district/district-by-division/${id}`;
        await axios.get(url).then((res) => {
            this.commit(`set_all_districts`, res.data);
        });
    },

    [`fetch_all_divisions`]: async function ({ state, commit }) {
        let url = `/division/get-all`;
        await axios.get(url).then((res) => {
            this.commit(`set_all_divisions`, res.data);
        });
    },

    [`fetch_all_upozilas`]: async function ({ state, commit }) {
        let url = `/upozila/get-all`;
        await axios.get(url).then((res) => {
            this.commit(`set_all_upozilas`, res.data);
        });
    },

    [`fetch_upozila_by_district`]: async function ({ state, commit }, id) {
        let url = `/upozila/upozila-by-district/${id}`;
        await axios.get(url).then((res) => {
            this.commit(`set_all_upozilas`, res.data);
        });
    },
}

// mutators
const mutations = {
    ...test_module.mutations(),
    set_all_districts: function (state, data) {
        state.all_districts = data;
    },
    set_all_divisions: function (state, data) {
        state.all_divisions = data;
    },
    set_all_upozilas: function (state, data) {
        state.all_upozilas = data;
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};
