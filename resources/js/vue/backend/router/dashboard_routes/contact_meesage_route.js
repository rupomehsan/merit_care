import Layout from '../../views/admin/contact_messages/Layout'
import AllContactMessage from '../../views/admin/contact_messages/All'
import CreateContactMessage from '../../views/admin/contact_messages/Create'
import EditContactMessage from '../../views/admin/contact_messages/Edit'
import DetailsContactMessage from '../../views/admin/contact_messages/Details'
import ImportContactMessage from '../../views/admin/contact_messages/Import'

export default {
    path: 'contact-message',
    component: Layout,
    props: {
        role_permissions: ['super_admin','admin'],
        layout_title: 'Contact Message Management',
    },
    children: [{
            path: '',
            name: 'AllContactMessage',
            component: AllContactMessage,
        },
        {
            path: 'import',
            name: 'ImportContactMessage',
            component: ImportContactMessage,
        },
        {
            path: 'create',
            name: 'CreateContactMessage',
            component: CreateContactMessage,
        },
        {
            path: 'edit/:id',
            name: 'EditContactMessage',
            component: EditContactMessage,
        },
        {
            path: 'details/:id',
            name: 'DetailsContactMessage',
            component: DetailsContactMessage,
        },
    ],

};
