define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'message/index' + location.search,
                    add_url: 'message/add',
                    del_url: 'message/del',
                    multi_url: 'message/multi',
                    table: 'message',
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
                        {field: 'id', title: __('ID'),operate: false},
                        {field: 'name', title: __('Name')},
                        {field: 'createtime', title: __('Createtime'), formatter: Table.api.formatter.datetime, operate: 'RANGE', addclass: 'datetimerange', sortable: true},
                        {field: 'content', title: __('Content'),operate: false},
                        {field: 'objectdata', title: __('Objectdata'), searchList: {"0": '公司',"1": '驾驶员'}, formatter: Table.api.formatter.normal},
                        {field: 'operate', title: __('Operate'), table: table,
                            events: Table.api.events.operate,
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
                    index_url: 'company/index',
                    table: 'company',
                }
            });

            var table = $("#qtable");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                showExport: false,
                showToggle: false,
                search:false,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('ID'),operate: false},
                        {field: 'name', title: '公司名',operate:'LIKE'},
                    ]
                ],
                onCheck: function (value,row, index) {
                    var $companyids = $('#companyids');
                    var $data = $companyids.val();
                    var $id = value.id;
                    if($data) {
                        $data = $data + ','+ $id;
                    }else {
                        $data = $id;
                    }
                    $companyids.val($data);
                },
                onUncheck: function (value,row, index) {
                    var $id = value.id;
                    var $companyids = $('#companyids');
                    var data = $companyids.val();
                    if(data) {
                        var $newdata = data.split(',');
                        $newdata.splice($.inArray($id,$newdata),1);
                        $companyids.val($newdata);
                    }
                }
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'driver/index',
                    table: 'driver',
                }
            });

            var dtable = $("#dtable");

            // 初始化表格
            dtable.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                showExport: false,
                showToggle: false,
                search:false,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('ID'),operate: false},
                        {field: 'name', title: '姓名',operate:'LIKE'},
                        {field: 'phone', title: '手机号',operate:'LIKE'},
                        {field: 'carnum', title: '车牌号',operate:'LIKE'}
                    ]
                ],
                onCheck: function (value,row, index) {
                    var $driverids = $('#driverids');
                    var $data = $driverids.val();
                    var $id = value.id;
                    if($data) {
                        $data = $data + ','+ $id;
                    }else {
                        $data = $id;
                    }
                    $driverids.val($data);
                },
                onUncheck: function (value,row, index) {
                    var $id = value.id;
                    var $driverids = $('#driverids');
                    var data = $driverids.val();
                    if(data) {
                        var $newdata = data.split(',');
                        $newdata.splice($.inArray($id,$newdata),1);
                        $driverids.val($newdata);
                    }
                }
            });

            // 为表格绑定事件
            Table.api.bindevent(dtable);
            $(document).on("click", "input[type=radio]", function(){
                switch ($(this).val()) {
                    case '0':
                        $('.container').show();
                        $('.dcontainer').hide();
                        break;
                    case '1':
                        $('.container').hide();
                        $('.dcontainer').show();
                        break;
                }
            });
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
