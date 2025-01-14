import userLayout from '../../views/admin/users/Layout'
import AllUser from '../../views/admin/users/AllUser'
import CreateUser from '../../views/admin/users/CreateUser'
import EditUser from '../../views/admin/users/EditUser'
import DetailsUser from '../../views/admin/users/DetailsUser'
import ImportUser from '../../views/admin/users/ImportUser'

export default {
    path: 'user',
    component: userLayout,
    props: {role_permissions: ['super_admin']},
    children: [{
            path: '',
            name: 'AllUser',
            component: AllUser,
        },
        {
            path: 'import',
            name: 'ImportUser',
            component: ImportUser,
        },
        {
            path: 'create',
            name: 'CreateUser',
            component: CreateUser,
        },
        {
            path: 'edit/:id',
            name: 'EditUser',
            component: EditUser,
        },
        {
            path: 'details/:id',
            name: 'DetailsUser',
            component: DetailsUser,
        },
    ],

};
