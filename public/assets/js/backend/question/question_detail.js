define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'question/question_detail/index' + location.search,
                    add_url: 'question/question_detail/add',
                    edit_url: 'question/question_detail/edit',
                    del_url: 'question/question_detail/del',
                    multi_url: 'question/question_detail/multi',
                    table: 'question_detail',
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
                        {field: 'typedata', title: __('Typedata'), searchList: {"0":__('单选题'),"1":__('多选题')}, formatter: Table.api.formatter.normal},
                        {field: 'title', title: __('Title')},
                        {field: 'answerdata', title: __('Answerdata'), searchList: {"A":__('A'),"B":__('B'),"C":__('C'),"D":__('D')}, operate:'FIND_IN_SET', formatter: Table.api.formatter.label},
                        {field: 'optiona', title: __('Optiona')},
                        {field: 'optionb', title: __('Optionb')},
                        {field: 'optionc', title: __('Optionc')},
                        {field: 'optiond', title: __('Optiond')},
                        {field: 'question.name', title: __('Question.name')},
                        {field: 'question.num', title: __('Question.num')},
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
