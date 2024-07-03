<template>
    <div class="container">
        <div class="card list_card">
            <div class="card-header">
                <h4>Create</h4>
                <div class="btns">
                    <router-link :to="{ name: `All${route_prefix}` }" class="btn rounded-pill btn-outline-warning">
                        <i class="fa fa-arrow-left me-5px"></i>
                        Back
                    </router-link>
                </div>
            </div>
            <form @submit.prevent="call_store(`store_${store_prefix}`, $event.target)" class="schedule_create_form"
                autocomplete="false" enctype="multipart/form-data">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-lg-11">
                            <div class="admin_form form_1">
                                <div class="form-group d-grid align-content-start gap-1 mb-2">
                                    <div>
                                        <label class="mb-2 text-capitalize">Select Class</label>
                                        <class-management-modal :select_qty="1"></class-management-modal>
                                    </div>
                                </div>

                                <div class="form-group d-grid align-content-start gap-1 mb-2">
                                    <label for="class_id">Batch</label>
                                    <select @change="class_wise_batches($event)" name="institute_class_batch_id"
                                        id="defaultSelect" class="form-select">
                                        <option value="">Select a batch</option>
                                        <option v-for="(item, index) in get_class_batchs" :key="index" :value="item.id">
                                            {{ item.name }}</option>
                                    </select>
                                </div>

                                <!-- <div class=" form-group d-grid align-content-start gap-1 mb-2 ">
                                    <div>
                                        <label class="mb-2 text-capitalize">
                                            Select Teacher
                                        </label>
                                        <teacher-management-modal :select_qty="1"></teacher-management-modal>
                                    </div>
                                </div> -->
                            </div>

                            <div class="mb-3" data-repeater-list="group-a">
                                <div class="repeater-wrapper pt-0 pt-md-4" data-repeater-item>
                                    <label class="form-label" for="collapsible-address">
                                        <h5>Schedules</h5>
                                    </label>
                                    <div class="d-flex rounded position-relative pe-0 mb-3"
                                        v-for="(input, index) in subjects" :key="index">
                                        <div class="row w-100">
                                            <div class="col-12 mb-md-0 mb-2">
                                                <div class="d-flex flex-wrap gap-3">
                                                    <div>
                                                        <label for="subject">Subject</label>
                                                        <input type="text" id="subject" v-model="input.title"
                                                            class="form-control text-light invoice-item-price "
                                                            placeholder="Subject name" disabled />
                                                    </div>

                                                    <div>
                                                        <label for="start_time">Start time</label>
                                                        <input type="time" id="start_time" v-model="input.start_time"
                                                            class="form-control invoice-item-price "
                                                            placeholder="Start time" />
                                                    </div>

                                                    <div>
                                                        <label for="end_time">End time</label>
                                                        <input type="time" id="end_time" v-model="input.end_time"
                                                            class="form-control invoice-item-price "
                                                            placeholder="End time" />
                                                    </div>

                                                    <div>
                                                        <label for="room_no">Room no</label>
                                                        <input type="number" id="room_no" v-model="input.room_no"
                                                            class="form-control invoice-item-price "
                                                            placeholder="Room no" />
                                                    </div>

                                                    <div>
                                                        <label for="teacher">Teacher</label>
                                                        <select id="" v-model="input.teacher_id" class="form-select">
                                                            <option v-for="teacher in branch_teachers"  :value="teacher.id" :key="teacher.id">
                                                                {{teacher.user.first_name}}
                                                                {{teacher.user.last_name}}
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-12 mb-md-0 mb-4 pb-2 mt-2 border-bottom">
                                                <label for="days">Days</label>
                                                <div class="d-flex gap-2 mt-2">
                                                    <div class="form-check form-check-inline"
                                                        v-for="(day, dayIndex) in ['Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']"
                                                        :key="dayIndex">
                                                        <input class="form-check-input" type="checkbox"
                                                            :id="day.toLowerCase() + '_' + index" :value="day.toLowerCase()"
                                                            v-model="input.days" />
                                                        <label class="form-check-label"
                                                            :for="day.toLowerCase() + '_' + index">{{ day }}</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
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
import { mapActions, mapMutations, mapGetters } from "vuex";
import InputField from "../../../components/InputField.vue";
import ClassManagementModal from "../class/components/ManagementModal.vue";
import BatchManagementModal from "../batch/components/ManagementModal.vue";
import SubjectManagementModal from "../subject/components/ManagementModal.vue";
import TeacherManagementModal from "../teacher/components/ManagementModal.vue";

/** store and route prefix for export object use */
import PageSetup from "./PageSetup";
const { route_prefix, store_prefix } = PageSetup;

export default {
    components: {
        InputField,
        ClassManagementModal,
        BatchManagementModal,
        SubjectManagementModal,
        TeacherManagementModal
    },
    data: function () {
        return {
            /** store prefix for JSX */
            store_prefix,
            route_prefix,
            subjects: [],
            branch_teachers: [],
        };
    },
    created: async function () {
        await this[`set_clear_selected_class_levels`](false);
        await this[`set_clear_selected_batchs`](false);
        await this[`set_clear_selected_subjects`](false);
        await this[`set_clear_selected_teachers`](false);

        axios.get('institute/teacher/branch-all-teachers')
            .then(res=>{
                this.branch_teachers = res.data;
            })
    },
    watch: {
        get_batch_subjects: function (val) {
            if (val.subjects.length > 0) {
                this.subjects = val.subjects.map(subject => {
                    return {
                        id: subject.id,
                        branch_id: subject.branch_id,
                        title: subject.title,
                        created_at: subject.created_at,
                        updated_at: subject.updated_at,
                        start_time: "",
                        end_time: "",
                        room_no: "",
                        teacher_id: "",
                        days: []
                    };
                });
            } else {
                this.subjects = [
                    {
                        id: null,
                        branch_id: null,
                        title: "",
                        created_at: "",
                        updated_at: "",
                        start_time: "",
                        end_time: "",
                        room_no: "",
                        teacher_id: "",
                        days: []
                    }
                ];
            }
        },

    },
    methods: {
        ...mapActions([
            `store_${store_prefix}`,
            'fetch_class_batch_subjects',
            'fetch_all_teachers',
        ]),
        ...mapMutations([
            `set_clear_selected_class_levels`,
            `set_clear_selected_batchs`,
            `set_clear_selected_subjects`,
            `set_clear_selected_teachers`
        ]),
        call_store: function (name, params = null) {
            params = {
                subjects: this.subjects
            };
            this[name](params);
        },
        class_wise_batches: function (event) {
            let class_id = event.target.value;
            // console.log(class_id);
            this.fetch_class_batch_subjects({class_id, });
        }
    },
    computed: {
        ...mapGetters([
            `get_batch`,
            `get_class_batchs`,
            `get_batch_subjects`,
            'get_all_teachers',
        ])
    }
};
</script>

<style></style>
