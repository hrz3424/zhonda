define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'examination/examination/index' + location.search,
                    add_url: 'examination/examination/add',
                    edit_url: 'examination/examination/edit',
                    del_url: 'examination/examination/del',
                    multi_url: 'examination/examination/multi',
                    table: 'examination',
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
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
            /*require(['selectpage'], function () {
                $('#selectQuestionType').selectPage({
                    data: '/admin/question/question/index',
                    eAjaxSuccess: function (data) {
                        if(data) {
                            return {"list":data.list,totalRow:data.total};
                        }
                    },
                    eSelect: function (data) {
                        console.log(data.id);
                    }
                });
            });*/
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
