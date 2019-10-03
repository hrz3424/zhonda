define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'plan/plan/index' + location.search,
                    add_url: 'plan/plan/add',
                    edit_url: 'plan/plan/edit',
                    del_url: 'plan/plan/del',
                    multi_url: 'plan/plan/multi',
                    table: 'plan',
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
                        {field: 'typedata', title: __('Typedata'), searchList: {"0": '日常培训',"1": '岗前培训'}, formatter: Table.api.formatter.normal},
                        {field: 'name', title: __('Name')},
                        {field: 'startdate', title: __('Startdate'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'enddate', title: __('Enddate'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'operate', title: __('Operate'), table: table,
                            events: Table.api.events.operate,
                            buttons: [
                                {
                                    name: 'company',
                                    text: '公司1',
                                    classname: 'btn btn-primary btn-xs btn-detail btn-dialog',
                                    url: 'plan/plan/company'
                                },
                                {
                                    name: 'video',
                                    text: '视频2',
                                    classname: 'btn btn-default btn-xs btn-detail btn-dialog',
                                    url: 'plan/plan/video'
                                },
                                {
                                    name: 'examination',
                                    text: '试卷3',
                                    classname: 'btn btn-success btn-xs btn-detail btn-dialog',
                                    url: 'plan/plan/examination'
                                },
                                {
                                    name: 'notice',
                                    text: '公告4',
                                    classname: 'btn btn-warning btn-xs btn-detail btn-dialog',
                                    url: 'plan/plan/notice'
                                },
                                {
                                    name: 'article',
                                    text: '文章5',
                                    classname: 'btn btn-danger btn-xs btn-detail btn-dialog',
                                    url: 'plan/plan/article'
                                },
                                {
                                    name: 'detail',
                                    text: '查看',
                                    classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                    url: 'notice/notice/detail'
                                }],
                            formatter: Table.api.formatter.operate
                        }
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
