module.exports = [
  {
    role: 'Owner',
    res_mgmt: 2,
    admin_mgmt: 4,
    role_mgmt: 4,
    branch_mgmt: 4,
    emp_mgmt: 4,
    floor_mgmt: 4,
    menu_mgmt: 4,
    menu_status_mgmt: 4,
    category_mgmt: 4,
    kitchen_mgmt: 4,
    waiting_mgmt: 4,
    order_mgmt: 3,
    billing_mgmt: 3,
    delivery_mgmt: 4,
  },
  {
    role: 'Admin',
    res_mgmt: 2,
    admin_mgmt: 1,
    role_mgmt: 4,
    branch_mgmt: 2,
    emp_mgmt: 4,
    floor_mgmt: 4,
    menu_mgmt: 4,
    menu_status_mgmt: 4,
    category_mgmt: 4,
    kitchen_mgmt: 4,
    waiting_mgmt: 4,
    order_mgmt: 3,
    billing_mgmt: 3,
    delivery_mgmt: 4,
  },
  {
    role: 'Branch Manager',
    res_mgmt: 1,
    admin_mgmt: 0,
    role_mgmt: 1,
    branch_mgmt: 2,
    emp_mgmt: 3,
    floor_mgmt: 2,
    menu_mgmt: 2,
    menu_status_mgmt: 2,
    category_mgmt: 2,
    kitchen_mgmt: 4,
    waiting_mgmt: 4,
    order_mgmt: 3,
    billing_mgmt: 3,
    delivery_mgmt: 4,
  },
  {
    role: 'Floor Manager',
    res_mgmt: 1,
    admin_mgmt: 0,
    role_mgmt: 1,
    branch_mgmt: 1,
    emp_mgmt: 1,
    floor_mgmt: 1,
    menu_mgmt: 1,
    menu_status_mgmt: 2,
    category_mgmt: 1,
    kitchen_mgmt: 1,
    waiting_mgmt: 4,
    order_mgmt: 3,
    billing_mgmt: 3,
    delivery_mgmt: 3,
  },
  {
    role: 'Billing Manager',
    res_mgmt: 1,
    admin_mgmt: 0,
    role_mgmt: 1,
    branch_mgmt: 1,
    emp_mgmt: 0,
    floor_mgmt: 1,
    menu_mgmt: 1,
    menu_status_mgmt: 1,
    category_mgmt: 1,
    kitchen_mgmt: 1,
    waiting_mgmt: 1,
    order_mgmt: 3,
    billing_mgmt: 3,
    delivery_mgmt: 3,
  },
  {
    role: 'Kitchen Manager',
    res_mgmt: 1,
    admin_mgmt: 0,
    role_mgmt: 1,
    branch_mgmt: 1,
    emp_mgmt: 0,
    floor_mgmt: 1,
    menu_mgmt: 2,
    menu_status_mgmt: 2,
    category_mgmt: 2,
    kitchen_mgmt: 2,
    waiting_mgmt: 1,
    order_mgmt: 1,
    billing_mgmt: 0,
    delivery_mgmt: 0,
  },
  {
    role: 'Kitchen Staff',
    res_mgmt: 1,
    admin_mgmt: 0,
    role_mgmt: 1,
    branch_mgmt: 1,
    emp_mgmt: 0,
    floor_mgmt: 1,
    menu_mgmt: 1,
    menu_status_mgmt: 1,
    category_mgmt: 1,
    kitchen_mgmt: 1,
    waiting_mgmt: 1,
    order_mgmt: 1,
    billing_mgmt: 0,
    delivery_mgmt: 0,
  },
  {
    role: 'Waiters',
    res_mgmt: 1,
    admin_mgmt: 0,
    role_mgmt: 1,
    branch_mgmt: 1,
    emp_mgmt: 0,
    floor_mgmt: 1,
    menu_mgmt: 1,
    menu_status_mgmt: 1,
    category_mgmt: 1,
    kitchen_mgmt: 1,
    waiting_mgmt: 1,
    order_mgmt: 3,
    billing_mgmt: 1,
    delivery_mgmt: 0,
  },
  {
    role: 'Maintenance Staff',
    res_mgmt: 1,
    admin_mgmt: 0,
    role_mgmt: 1,
    branch_mgmt: 1,
    emp_mgmt: 0,
    floor_mgmt: 1,
    menu_mgmt: 0,
    menu_status_mgmt: 0,
    category_mgmt: 0,
    kitchen_mgmt: 0,
    waiting_mgmt: 0,
    order_mgmt: 1,
    billing_mgmt: 0,
    delivery_mgmt: 0,
  },
  {
    role: 'Delivery Staff',
    res_mgmt: 1,
    admin_mgmt: 0,
    role_mgmt: 1,
    branch_mgmt: 1,
    emp_mgmt: 0,
    floor_mgmt: 1,
    menu_mgmt: 0,
    menu_status_mgmt: 0,
    category_mgmt: 0,
    kitchen_mgmt: 0,
    waiting_mgmt: 0,
    order_mgmt: 1,
    billing_mgmt: 0,
    delivery_mgmt: 2,
  },
];
