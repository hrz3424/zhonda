define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'company/index' + location.search,
                    add_url: 'company/add',
                    edit_url: 'company/edit',
                    del_url: 'company/del',
                    multi_url: 'company/multi',
                    table: 'company',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('ID')},
                        {field: 'name', title: __('Name')},
                        {field: 'logo', title: __('Logo'), events: Table.api.events.image, formatter: Table.api.formatter.image, operate: false},
                        {field: 'district', title: __('district')},
                        {field: 'address', title: __('Address')},
                        {field: 'license', title: __('License'), events: Table.api.events.image, formatter: Table.api.formatter.image, operate: false},
                        {field: 'contact', title: __('Contact')},
                        {field: 'phone', title: __('Phone')},
                        {field: 'user.email', title: __('User.email')},
                        {field: 'user.logintime', title: __('User.logintime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'user.loginip', title: __('User.loginip')},
                        {field: 'user.token', title: __('User.token')},
                        {field: 'user.status', title: __('User.status'), formatter: Table.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});