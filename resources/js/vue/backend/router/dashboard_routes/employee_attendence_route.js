import Layout from '../../views/admin/employee_attendences/Layout'
import AllEmployeeAttendence from '../../views/admin/employee_attendences/All'
import DetailsEmployeeAttendence from '../../views/admin/employee_attendences/Details'
import CentralEmployeeAttendences from '../../views/admin/employee_attendences/Attendence'

export default {
    path: 'admin-control/employee_attendence',
    component: Layout,
    props: {
        role_permissions: ['super_admin'],
        layout_title: 'Employee Attendence Management',
    },
    children: [
        {
            path: '',
            name: 'AllEmployeeAttendences',
            component: AllEmployeeAttendence,
        },
        {
            path: 'central',
            name: 'CentralEmployeeAttendence',
            component: CentralEmployeeAttendences,
        },
        {
            path: 'details/:id',
            name: 'DetailsEmployeeAttendence',
            component: DetailsEmployeeAttendence,
        },
    ],

};

