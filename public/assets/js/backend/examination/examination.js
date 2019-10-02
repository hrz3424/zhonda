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
                        {field: 'operate', title: __('Operate'), table: table,
                            events: Table.api.events.operate,
                            buttons: [{
                                name: 'detail',
                                text: __('Detail'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'examination/examination/detail'
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
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: '/admin/examination/examination/getQuestions',
                    table: 'question',
                }
            });

            var table = $("#qtable");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'question.id',
                showExport: false,
                showToggle: false,
                search:false,
                queryParams: function(params){
                    params['question_id'] = $("#qid").val() ;
                    return params;
                },
                columns: [
                    [
                        {checkbox: true,formatter: function (value,row, index) {
                            //console.log(row);
                                var $questionids = $('#questionids');
                                var $data = $questionids.val();
                                var $newdata = $data.split(',');
                                if($.inArray(''+row.id,$newdata) >= 0){
                                    return {
                                        checked: true
                                    };
                                }
                                else{
                                    return {
                                        checked: false
                                    };
                                }

                            }},
                        {field: 'id', title: __('ID'),operate: false},
                        {field: 'typedata', title: '题型', searchList: {"0":__('单选题'),"1":__('多选题')}, formatter: Table.api.formatter.normal},
                        {field: 'title', title: __('Title'),operate:'LIKE'},
                    ]
                ],
                onCheck: function (value,row, index) {
                    var $questionids = $('#questionids');
                    var $data = $questionids.val();
                    var $id = value.id;
                    if($data) {
                        $data = $data + ','+ $id;
                    }else {
                        $data = $id;
                    }
                    $questionids.val($data);

                },
                onUncheck: function (value,row, index) {
                    var $id = value.id;
                    var $questionids = $('#questionids');
                    var data = $questionids.val();
                    if(data) {
                        var $newdata = data.split(',');
                        $newdata.splice($.inArray($id,$newdata),1);
                        $questionids.val($newdata);
                    }

                },
            });

            // 为表格绑定事件
            Table.api.bindevent(table);

            var selected = $("div[data-id='sign_0']")
           $(function () {
                $('div[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    var $qid = $(this).attr("data-id")
                    $('#qid').val($qid);
                    $(selected).css("background", "none")
                    $(this).css("background", "#C6C2C2")
                    selected = this
                    console.log($qid);
                    $("#qid").val($qid);
                    table.bootstrapTable('refresh', {});
                })
            });
        },
        edit: function () {
            Controller.api.bindevent();
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: '/admin/examination/examination/getQuestions',
                    table: 'question',
                }
            });

            var table = $("#qtable");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'question.id',
                showExport: false,
                showToggle: false,
                search:false,
                queryParams: function(params){
                    params['question_id'] = $("#qid").val() ;
                    return params;
                },
                columns: [
                    [
                        {checkbox: true,formatter: function (value,row, index) {
                                //console.log(row);
                                var $questionids = $('#questionids');
                                var $data = $questionids.val();
                                var $newdata = $data.split(',');
                                if($.inArray(''+row.id,$newdata) >= 0){
                                    return {
                                        checked: true
                                    };
                                }
                                else{
                                    return {
                                        checked: false
                                    };
                                }

                            }},
                        {field: 'id', title: __('ID'),operate: false},
                        {field: 'typedata', title: '题型', searchList: {"0":__('单选题'),"1":__('多选题')}, formatter: Table.api.formatter.normal},
                        {field: 'title', title: __('Title'),operate:'LIKE'},
                    ]
                ],
                onCheck: function (value,row, index) {
                    var $questionids = $('#questionids');
                    var $data = $questionids.val();
                    var $id = value.id;
                    if($data) {
                        $data = $data + ','+ $id;
                    }else {
                        $data = $id;
                    }
                    $questionids.val($data);

                },
                onUncheck: function (value,row, index) {
                    var $id = value.id;
                    var $questionids = $('#questionids');
                    var data = $questionids.val();
                    if(data) {
                        var $newdata = data.split(',');
                        $newdata.splice($.inArray($id,$newdata),1);
                        $questionids.val($newdata);
                    }

                },
            });

            // 为表格绑定事件
            Table.api.bindevent(table);

            var selected = $("div[data-id='sign_0']")
            $(function () {
                $('div[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    var $qid = $(this).attr("data-id")
                    $('#qid').val($qid);
                    $(selected).css("background", "none")
                    $(this).css("background", "#C6C2C2")
                    selected = this
                    console.log($qid);
                    $("#qid").val($qid);
                    table.bootstrapTable('refresh', {});
                })
            });
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});
