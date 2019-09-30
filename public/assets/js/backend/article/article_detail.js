define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'article/article_detail/index' + location.search,
                    add_url: 'article/article_detail/add',
                    edit_url: 'article/article_detail/edit',
                    del_url: 'article/article_detail/del',
                    multi_url: 'article/article_detail/multi',
                    table: 'article_detail',
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
                        {field: 'title', title: __('Title')},
                        {field: 'cover', title: __('Cover'),events: Table.api.events.image, formatter: Table.api.formatter.image, operate: false},
                        {field: 'ptime', title: __('Ptime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'views', title: __('Views')},
                        {field: 'article.name', title: __('Article.name')},
                        {field: 'article.num', title: __('Article.num')},
                        {field: 'article.sort', title: __('Article.sort')},
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
