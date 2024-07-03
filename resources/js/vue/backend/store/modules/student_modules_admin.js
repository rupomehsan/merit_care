import axios from "axios";
import management_router from "../../router/router";
import StoreModule from "./schema/StoreModule";

let test_module = new StoreModule('admin_student', 'institute/admin-student', 'Student');
const { store_prefix, api_prefix, route_prefix } = test_module;

// state list
const state = {
    ...test_module.states(),
    class_batchs: {}
};

// get state
const getters = {
    ...test_module.getters(),
    get_branch_batches: state => state.branch_batches
};

// actions
const actions = {
    ...test_module.actions(),
    [`fetch_${store_prefix}`]: async function ({ state, commit }, { id }) {
        let url = `/${api_prefix}/${id}`;
        await axios.get(url).then((res) => {
            this.commit(`set_${store_prefix}`, res.data);

            var image = `
                <img src="/${res.data.user.photo}"/>
            `;

            setTimeout(() => {
                var file_previews = document.querySelector('.file_preview');
                file_previews.innerHTML = image || ''
            }, 1000);

        });
    },
    [`fetch_${store_prefix}s`]: async function ({ state }, data) {
        // let url = `/${api_prefix}/all?page=${state[`${store_prefix}_page`]}&status=${state[`${store_prefix}_show_active_data`]}&paginate=${state[`${store_prefix}_paginate`]}`;
        let link = new URL(location.origin + '/api/v1/' + api_prefix + '/all');
        link.searchParams.set('page', state[`${store_prefix}_page`]);
        link.searchParams.set('status', state[`${store_prefix}_show_active_data`]);
        link.searchParams.set('paginate', state[`${store_prefix}_paginate`]);
        link.searchParams.set('orderBy', state.orderByCol);

        if (state.orderByAsc) {
            link.searchParams.set('orderByType', 'ASC');
        } else {
            link.searchParams.set('orderByType', 'DESC');
        }

        if (state[`${store_prefix}_search_key`]) {
            link.searchParams.set('search_key', state[`${store_prefix}_search_key`]);
        }

        if (data && data.branch_id) {
            link.searchParams.set('branch_id', data.branch_id);
        }
        if (data && data.gender) {
            link.searchParams.set('gender', data.gender);
        }
        if (data && data.user_id) {
            link.searchParams.set('user_id', data.user_id);
        }

        await axios.get(link.href).then((res) => {
            this.commit(`set_${store_prefix}s`, res.data);
        });
    },
    fetch_branch_batches: async function (state, id) {
        let url = `/branch/branch-batches/${id}`
        await axios.get(url)
            .then((res) => {
                this.commit('set_branch_batches', res.data);
            })
    },
    SelectBranchAction: async function ({ commit, dispatch }, data) {
        this.commit(`set_selected_${store_prefix}s`, data);
        console.log(data);
        dispatch(`fetch_branch_batches`, data.id);
    },


    [`store_${store_prefix}`]: function ({ state, getters, commit }) {
        const { form_values, form_inputs, form_data } = window.get_form_data(`.admin_student_create_form`);
        // console.log(form_data, form_inputs, form_values);
        const { get_branch_selected: branch } = getters;

        form_data.append('branch_id', branch[0].id);


        axios.post(`/${api_prefix}/store`, form_data)
            .then(res => {
                window.s_alert(`new ${store_prefix} has been created`);
                $(`${store_prefix}_create_form input`).val('');
                commit(`set_clear_selected_branchs`, false);
                management_router.push({ name: `AllBranch` })
            })
            .catch(error => {
                console.log(error);
            })


    },

    [`update_${store_prefix}`]: function ({ state, getters, commit }) {
        const { form_values, form_inputs, form_data } = window.get_form_data(`.call_history_edit_form`);
        const { get_customer_selected: customer, get_topic_selected: topic } = getters;
        // role.forEach(i=>form_data.append('user_role_id[]',i.role_serial));

        form_data.append('topic_id', topic[0].id);
        form_data.append('customer_id', customer[0].id);
        form_data.append("id", state[store_prefix].id);

        axios.post(`/${api_prefix}/update`, form_data)
            .then(({ data }) => {
                commit(`set_${store_prefix}`, data);
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
                    if (e.response.status == 400) {
                        window.s_alert('error ' + e.response.status + ': ' + e.response.data.error, 'error')
                    }
                });
        }
    },

    /** export all data into csv */
    [`export_${store_prefix}_all`]: async function ({ state, commit }) {
        let col = [
            "branch",
            "name",
            "roll",
            "gender",
            "phone",
            "batch",
            "class",
        ]
        var export_csv = new window.CsvBuilder(
            `${store_prefix}_list.csv`
        ).setColumns(col);
        window.start_loader();
        let last_page = state[`${store_prefix}s`].last_page;
        for (let index = 1; index <= last_page; index++) {
            commit(`set_${store_prefix}_page`, index);
            state.paginate = 10;
            await this.dispatch(`fetch_${store_prefix}s`);
            let values = state[`${store_prefix}s`].data.map((i) => {
                // Object.values(i)
                let branch = i.user.branch_user.length ? i.user.branch_user[0].name : '';
                let batch = i.institute_class_batches.length ? i.institute_class_batches[0].name : '';
                let st_class = i.institute_class_batches.length ? i.institute_class_batches[0].class.title : '';
                return [
                    branch,
                    i.user.first_name + ' ' + i.user.last_name,
                    i.id,
                    i.gender,
                    i.user.mobile_number,
                    batch,
                    st_class
                ]

            });
            export_csv.addRows(values);

            let progress = Math.round((100 * index) / last_page);
            window.update_loader(progress);

        }
        await export_csv.exportFile();
        window.remove_loader();
    },

    /** export selected data into csv */
    [`export_selected_${store_prefix}_csv`]: function ({ state }) {
        let col = [
            "branch",
            "name",
            "roll",
            "gender",
            "phone",
            "batch",
            "class",
        ]
        let values = state[`${store_prefix}_selected`].map((i) => {
            // Object.values(i)
            let branch = i.user.branch_user.length ? i.user.branch_user[0].name : '';
            let batch = i.institute_class_batches.length ? i.institute_class_batches[0].name : '';
            let st_class = i.institute_class_batches.length ? i.institute_class_batches[0].class.title : '';
            return [
                branch,
                i.user.first_name + ' ' + i.user.last_name,
                i.id,
                i.gender,
                i.user.mobile_number,
                batch,
                st_class
            ]

        });
        new window.CsvBuilder(`${store_prefix}_list.csv`)
            .setColumns(col)
            // .addRow(["Eve", "Holt"])
            .addRows(values)
            .exportFile();
    },
}

// mutators
const mutations = {
    ...test_module.mutations(),
    set_branch_batches: function (state, data) {
        state.branch_batches = data;
        console.log(state.class_batchs);
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};
