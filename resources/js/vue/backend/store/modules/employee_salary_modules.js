import axios from "axios";
import management_router from "../../router/router";
import StoreModule from "./schema/StoreModule";

let test_module = new StoreModule('employee_salary','salary-statement','Employee-salary');
const {store_prefix, api_prefix, route_prefix} = test_module;

// state list
const state = {
    ...test_module.states(),
    all_employees: {},
    teacher_salary_statements: {},
    salary_categories: {}
};

// get state
const getters = {
    ...test_module.getters(),
    get_active_employees: state => state.all_employees,
    get_teacher_salary_statements: state => state.teacher_salary_statements,
    get_salary_categories: state => state.salary_categories
};

// actions
const actions = {
    ...test_module.actions(),

    fetch_active_employees: async function (params) {
        axios.get(`/${api_prefix}/get_all_employees`)
            .then((res) => {
                this.commit('set_all_employees', res.data);
            })
            .catch((e) => {
                console.log(e);
            });
    },

    fetch_salary_categories: async function() {
        axios.get(`/${api_prefix}/salary-categories`)
            .then((res) => {
                this.commit('set_salary_categories', res.data);
            })
            .catch((e) => {
                console.log(e);
            });
    },

    fetch_active_employees_by_month: async function (state, event) {
        let month = event?.target?.value;
        if(month == undefined) {
            let month = event;
            console.log(event);
        }
        // console.log(month);
        axios.get(`/${api_prefix}/get_all_employees_by_month/${month}`)
            .then((res) => {
                this.commit('set_all_employees', res.data);
            })
            .catch((e) => {
                console.log(e);
            });
    },

    submit_employee_salary: async function(state, data) {
        let url = `/${api_prefix}/submit-employee-salary`
        await axios.post(url, {employee_data: data})
        .then((res) => {
            window.s_alert(`Salary submitted successfully`);
        })
    },

    fetch_teacher_salary_statements: async function(state) {
        let paginate = 15;
        let url = `/${api_prefix}/teacher_salary_statements?page=1&paginate=${paginate}`
        await axios.get(url)
        .then((res) => {
            this.commit('set_teacher_salary_statements', res.data);
            // console.log(res.data.batch.institute_students);
        })
    },

    [`fetch_${store_prefix}`]: async function ({ state, commit }, { id }) {
        let url = `/${api_prefix}/${id}`;
        await axios.get(url).then((res) => {
            this.commit(`set_${store_prefix}`, res.data);

            commit(`set_selected_employees`, res.data.employee);
            // commit(`set_selected_customers`, res.data.customer);
        });
    },

    [`store_${store_prefix}`]: function({state, getters, commit}, event){
        const {form_values, form_inputs, form_data} = window.get_form_data(`.salary_form`);
        // console.log(form_data, form_inputs, form_values, event);
        const {get_employee_selected: employee} = getters;

        // form_data.append('topic_id',topic[0].id);
        form_data.append('user_id',employee[0].id);
        form_data.append('salary_category_id',event.salary_category_id);


        axios.post(`/${api_prefix}/store`,form_data)
            .then(res=>{
                window.s_alert(`new ${store_prefix} has been created`);
                $(`.salary_form`).val('');
                commit(`set_clear_selected_employees`,false);
                management_router.push({name:`AllBranchEmployeeSalary`})
            })
            .catch(error=>{
                console.log(error);
            })


    },

    [`update_${store_prefix}`]: function({state, getters, commit}){
        const {form_values, form_inputs, form_data} = window.get_form_data(`.salary_edit_form`);
        // console.log(form_data, form_inputs, form_values);
        const {get_employee_selected: employee} = getters;

        // form_data.append('topic_id',topic[0].id);
        if(employee[0]){
            console.log(employee);
            form_data.append('employee_id',employee[0].id);
        }
        if(state[store_prefix]){
            form_data.append("id", state[store_prefix].id);
        }

        axios.post(`/${api_prefix}/update`,form_data)
            .then(({data})=>{
                commit(`set_${store_prefix}`,data);
                window.s_alert(`${store_prefix} has been updated`);
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
    set_all_employees: function (state, data) {
        state.all_employees = data;
    },
    set_salary_categories: function (state, data) {
        state.salary_categories = data;
    },
    set_teacher_salary_statements: function(state, data) {
        state.teacher_salary_statements = data;
    }
};

export default {
    state,
    getters,
    actions,
    mutations,
};
