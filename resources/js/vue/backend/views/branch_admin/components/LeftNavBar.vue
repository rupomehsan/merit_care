<template>
    <ul class="navigation navigation-main mt-0" id="main-menu-navigation" data-menu="menu-navigation">
        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center"
                :to="{ name: 'branch_dashboard' }" href="#">
                <!-- <i class="fa-solid fa-box"></i> -->
                <div>
                    <span class="icon"><i class="fa-sharp fa-solid fa-house"></i></span>
                    <span class="menu-title text-truncate">Dashboard</span>
                </div>
            </router-link>
        </li>


        <!-- <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center" :to="{ name: 'AllBranchAccount' }" href="#">
                <span class="icon"><i class="fa-sharp fa-solid fa-money-check"></i></span>
                <span class="menu-title text-truncate">Accounts</span>
            </router-link>
        </li> -->
        <li class="nav-item nested_list_sidebar">
            <a class="d-flex align-items-center nested_nav_list_sidebar" href="javascript:void(0)">
                <div>
                    <i class="fa-sharp fa-solid fa-money-check"></i>
                    <span class="menu-title text-truncate">Account Management</span>
                </div>
                <i class="drop_down_icon fa-solid fa-caret-down"></i>
            </a>

            <ul>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchAccountCategory' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Account Category</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchAccount' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Accounts</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'BranchIncomeSheet' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Income Sheet</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'BranchExpenseSheet' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Expense Sheet</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchIncome' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Income</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchExpense' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Expense</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AccountBalanceTransfer' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Transfer balance</span>
                        </div>
                    </router-link>
                </li>
            </ul>
        </li>



        <li class="nav-item nested_list_sidebar">
            <a class="d-flex align-items-center nested_nav_list_sidebar" href="javascript:void(0)">
                <div>
                    <span class="icon"><i class="fa-solid fa-file-invoice-dollar"></i></span>
                    <span class="menu-title text-truncate">Monthly Fees</span>
                </div>
                <i class="drop_down_icon fa-solid fa-caret-down"></i>
            </a>

            <ul>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchMonthlyFee' }" href="#">
                        <!-- <i class="fa-solid fa-box"></i> -->
                        <div>
                            <span class="icon"><i class="fa-regular fa-circle"></i></span>
                            <span class="menu-title text-truncate">All entries</span>
                        </div>

                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchMonthlyDues' }" href="#">
                        <!-- <i class="fa-solid fa-box"></i> -->
                        <div>
                            <span class="icon"><i class="fa-regular fa-circle"></i></span>
                            <span class="menu-title text-truncate">Due fees</span>
                        </div>
                    </router-link>
                </li>
            </ul>
        </li>

        <li class="nav-item nested_list_sidebar">
            <a class="d-flex align-items-center nested_nav_list_sidebar" href="javascript:void(0)">
                <div>
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span class="menu-title text-truncate">Product Management</span>
                </div>
                <i class="drop_down_icon fa-solid fa-caret-down"></i>
            </a>

            <ul>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'branch_product' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">All products</span>
                        </div>
                    </router-link>
                </li>

                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'CreateBranchProductOrder' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Bulk order</span>
                        </div>
                    </router-link>
                </li>

                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchOrder' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">All Orders</span>
                        </div>
                    </router-link>
                </li>
            </ul>
        </li>

        <!-- <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center" :to="{ name: 'branch_product' }" href="#">
                <span class="icon"><i class="fa-solid fa-cart-shopping"></i></span>
                <span class="menu-title text-truncate">Product</span>
            </router-link>
        </li> -->

        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center"
                :to="{ name: 'AllBranchClass' }" href="#">
                <!-- <i class="fa-solid fa-box"></i> -->
                <div>
                    <span class="icon"><i class="fa-solid fa-chalkboard-user"></i></span>
                    <span class="menu-title text-truncate">Class</span>
                </div>
            </router-link>
        </li>


        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center"
                :to="{ name: 'AllBranchBatch' }" href="#">
                <!-- <i class="fa-solid fa-box"></i> -->
                <div>
                    <span class="icon"><i class="fa-solid fa-user-group"></i></span>
                    <span class="menu-title text-truncate">Batch</span>
                </div>
            </router-link>
        </li>

        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center"
                :to="{ name: 'AllBranchTeacher' }" href="#">
                <div>
                    <i class="fa-solid fa-user-tie"></i>
                    <span class="menu-title text-truncate">Teacher Management</span>
                </div>
            </router-link>
        </li>

        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center"
                :to="{ name: 'AllBranchStudent' }" href="#">
                <div>
                    <i class="fa-solid fa-graduation-cap"></i>
                    <span class="menu-title text-truncate">Student Management</span>
                </div>
            </router-link>
        </li>

        <li class="nav-item nested_list_sidebar">
            <a class="d-flex align-items-center nested_nav_list_sidebar" href="javascript:void(0)">
                <div>
                    <i class="fa-solid fa-calendar-days"></i>
                    <span class="menu-title text-truncate">Schedule Management</span>
                </div>
                <i class="drop_down_icon fa-solid fa-caret-down"></i>
            </a>

            <ul>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'RoutineBranchSchedule' }" href="#">
                        <!-- <i class="fa-solid fa-box"></i> -->
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">At A Glance</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'CreateBranchSchedule' }" href="#">
                        <!-- <i class="fa-solid fa-box"></i> -->
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Create schedules</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchSchedule' }" href="#">
                        <!-- <i class="fa-solid fa-box"></i> -->
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">All schedules</span>
                        </div>
                    </router-link>
                </li>

            </ul>
        </li>

        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center" :to="{ name: 'AllBranchExam' }"
                href="#">
                <div>
                    <i class="fa-solid fa-list-check"></i>
                    <span class="menu-title text-truncate">Exam Management</span>
                </div>
            </router-link>
        </li>

        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center"
                :to="{ name: 'AllBranchEmployee' }" href="#">
                <div>
                    <i class="fa-solid fa-user-tie"></i>
                    <span class="menu-title text-truncate">Employee Management</span>
                </div>
            </router-link>
        </li>

        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center"
                :to="{ name: 'AllBranchLeaveApplication' }" href="#">
                <div>
                    <i class="fas fa-file-alt"></i>
                    <span class="menu-title text-truncate">Leave Management</span>
                </div>
            </router-link>
        </li>
        <!-- <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center" :to="{ name: 'AllBranchStudentAttendence' }" href="#">
                <i class="fa-solid fa-user-clock"></i>
                <span class="menu-title text-truncate">Student attendence</span>
            </router-link>
        </li> -->


        <li class="nav-item nested_list_sidebar">
            <a class="d-flex align-items-center nested_nav_list_sidebar" href="javascript:void(0)">
                <div>
                    <i class="fa-solid fa-user-clock"></i>
                    <span class="menu-title text-truncate">Attendence Management</span>
                </div>
                <i class="drop_down_icon fa-solid fa-caret-down"></i>
            </a>

            <ul>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchEmployeeAttendence' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Employee attendence</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchStudentAttendence' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Student attendence</span>
                        </div>
                    </router-link>
                </li>
            </ul>
        </li>



        <li class="nav-item nested_list_sidebar">
            <a class="d-flex align-items-center nested_nav_list_sidebar" href="javascript:void(0)">
                <div>
                    <i class="fa-solid fa-money-bills"></i>
                    <span class="menu-title text-truncate">Salary Management</span>
                </div>
                <i class="drop_down_icon fa-solid fa-caret-down"></i>
            </a>

            <ul>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchEmployeeSalary' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Employee salary</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'BranchSalarySheet' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Salary Sheet</span>
                        </div>
                    </router-link>
                </li>
            </ul>
        </li>



        <li class="nav-item nested_list_sidebar">
            <a class="d-flex align-items-center nested_nav_list_sidebar" href="javascript:void(0)">
                <div>
                    <i class="fa-solid fa-users-rectangle"></i>
                    <span class="menu-title text-truncate">Customer Management</span>
                </div>
                <i class="drop_down_icon fa-solid fa-caret-down"></i>
            </a>
            <ul>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchCustomer' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">All Customers</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchTopic' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Topics</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchCall' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Call history</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchSms' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Sms history</span>
                        </div>
                    </router-link>
                </li>
            </ul>
        </li>

        <li class="nav-item nested_list_sidebar">
            <a class="d-flex align-items-center nested_nav_list_sidebar" href="javascript:void(0)">
                <div>
                    <i class="fa-solid fa-bell"></i>
                    <span class="menu-title text-truncate">Notification</span>
                </div>
                <i class="drop_down_icon fa-solid fa-caret-down"></i>
            </a>
            <ul>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'AllBranchNotification' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Notifications</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'CreateBranchNotification' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Create Notification</span>
                        </div>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link active-class="navlink_single" class="d-flex align-items-center"
                        :to="{ name: 'CreateBranchBulkNotification' }" href="#">
                        <div>
                            <i class="fa-regular fa-circle"></i>
                            <span class="menu-title text-truncate">Bulk Notification</span>
                        </div>
                    </router-link>
                </li>
            </ul>
        </li>
        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center"
                :to="{ name: 'branch_notification' }" href="#">
                <div>
                    <i class="fa-solid fa-bell"></i>
                    <span class="menu-title text-truncate">My Notifications</span>
                </div>
            </router-link>
        </li>
        <li class="nav-item">
            <router-link active-class="navlink_single" class="d-flex align-items-center" :to="{ name: 'BranchProfile' }"
                href="#">
                <div>
                    <i class="fa-solid fa-id-card"></i>
                    <span class="menu-title text-truncate">Profile</span>
                </div>
            </router-link>
        </li>
        <li class="nav-item">
            <a @click.prevent="fetch_logout()" href="#">
                <div>
                    <span class="icon"><i class="fa-solid fa-power-off"></i></span>
                    <span class="menu-title text-truncate">Logout</span>
                </div>
            </a>
        </li>
    </ul>
</template>

<script>

import { mapActions, mapGetters } from "vuex";
export default {
    created: function () {
        setTimeout(() => {
            $(".nested_nav_list_sidebar").click(function () {
                // console.log($(this).children('.nested_list_sidebar'));
                [...document.querySelectorAll('.navigation > li')].forEach(el=>{
                    if(el.querySelector('.active') == null){
                        if(el !== event.target.closest('.navigation > li')){
                            el.classList.remove('active');
                        }
                    }
                })
                $(this).parent().toggleClass("active");
            });
        }, 1000);
    },
    methods: {
        ...mapActions(["fetch_logout"]),
        toggle() {
            window.toggleSidebar()
        }
    },
};
</script>

<style></style>
