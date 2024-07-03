import axios from "axios";
import management_router from "../../router/router";
import StoreModule from "./schema/StoreModule";

let test_module = new StoreModule('student', 'institute/student', 'Student');
const { store_prefix, api_prefix, route_prefix } = test_module;

// state list
const state = {
    ...test_module.states(),
};

// get state
const getters = {
    ...test_module.getters(),
};

// actions
const actions = {
    ...test_module.actions(),
    [`fetch_${store_prefix}`]: async function ({ state, commit }, { id }) {
        let url = `/${api_prefix}/${id}`;
        await axios.get(url).then((res) => {
            this.commit(`set_${store_prefix}`, res.data);

            var image = `
                <img src="/${res.data.student.user.photo}"/>
            `;

            setTimeout(() => {
                var file_previews = document.querySelector('.file_preview');
                file_previews.innerHTML = image || ''
            }, 1000);

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
                    if (e.response.status == 400) {
                        window.s_alert('error ' + e.response.status + ': ' + e.response.data.error, 'error')
                    }
                });
        }
    },

    /** export all data into csv */
    [`export_${store_prefix}_all`]: async function ({ state }) {
        let col = Object.keys(state[`${store_prefix}s`].data[0]);

        var export_csv = new window.CsvBuilder(
            `${store_prefix}_list.csv`
        ).setColumns(col);

        window.start_loader();
        let last_page = state[`${store_prefix}s`].last_page;
        for (let index = 1; index <= last_page; index++) {
            state.page = index;
            state.paginate = 10;
            await this.dispatch(`fetch_${store_prefix}s`);
            let values = state[`${store_prefix}s`].data.map((i) =>
                Object.values(i)
            );
            export_csv.addRows(values);

            let progress = Math.round((100 * index) / last_page);
            window.update_loader(progress);
        }
        await export_csv.exportFile();
        window.remove_loader();
    },

    /** export selected data into csv */
    [`export_selected_${store_prefix}_csv`]: function ({ state }) {
        let col = Object.keys(state[`${store_prefix}_selected`][0]);
        let values = state[`${store_prefix}_selected`].map((i) => Object.values(i));
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

};

export default {
    state,
    getters,
    actions,
    mutations,
};
