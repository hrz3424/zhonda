define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'driver/index' + location.search,
                    add_url: 'driver/add',
                    edit_url: 'driver/edit',
                    del_url: 'driver/del',
                    multi_url: 'driver/multi',
                    table: 'driver',
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
                        {field: 'id', title: __('Id')},
                        {field: 'avatar', title: __('Avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'name', title: __('Name')},
                        {field: 'idcard', title: __('Idcard')},
                        {field: 'nvq', title: __('Nvq')},
                        {field: 'carnum', title: __('Carnum')},
                        {field: 'phone', title: __('Phone')},
                        {field: 'fleet_id', title: __('Fleet_id')},
                        {field: 'typedata', title: __('Typedata'), searchList: {"0":__('Typedata 0'),"1":__('Typedata 1')}, formatter: Table.api.formatter.normal},
                        {field: 'status', title: __('Status'), searchList: {"0":__('Status 0'),"1":__('Status 1')}, formatter: Table.api.formatter.status},
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