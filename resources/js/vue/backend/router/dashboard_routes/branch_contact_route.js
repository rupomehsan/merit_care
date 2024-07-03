import Layout from '../../views/admin/branch_contact/Layout'
import AllBranchContact from '../../views/admin/branch_contact/All'
import CreateBranchContact from '../../views/admin/branch_contact/Create'
import EditBranchContact from '../../views/admin/branch_contact/Edit'
import DetailsBranchContact from '../../views/admin/branch_contact/Details'


export default {
    path: 'branch-contact',
    component: Layout,
    props: {
        role_permissions: ['super_admin'],
        layout_title: 'BranchContact Contact Management',
    },
    children: [
        {
            path: '',
            name: 'AllBranchContact',
            component: AllBranchContact,
        },
        {
            path: 'create',
            name: 'CreateBranchContact',
            component: CreateBranchContact,
        },
        {
            path: 'edit/:id',
            name: 'EditBranchContact',
            component: EditBranchContact,
        },
        {
            path: 'details/:id',
            name: 'DetailsBranchContact',
            component: DetailsBranchContact,
        },
    ],

};
