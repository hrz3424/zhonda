define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'video/video_detail/index' + location.search,
                    add_url: 'video/video_detail/add',
                    edit_url: 'video/video_detail/edit',
                    del_url: 'video/video_detail/del',
                    multi_url: 'video/video_detail/multi',
                    table: 'video_detail',
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
                        {field: 'url', title: __('Url'), formatter: Table.api.formatter.url},
                        {field: 'cover', title: __('Cover'),events: Table.api.events.image, formatter: Table.api.formatter.image, operate: false},
                        {field: 'introduce', title: __('Introduce')},
                        {field: 'vtime', title: __('Vtime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'video.name', title: __('Video.name')},
                        {field: 'video.num', title: __('Video.num')},
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
