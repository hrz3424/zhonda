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
            var selected = $("div[data-id='sign_0']")
            var $question = $("#question-list");
            $(document).on("click", ".input-check", function(){
                var _this = $(this);
                var $questionids = $('#questionids');
                var $id = _this.val();
               if(_this.is(':checked')){
                   var data = $questionids.val();
                   if(data) {
                       data = data + ','+ $id;
                   }else {
                       data = $id;
                   }
                   $questionids.val(data);
               }
               else {
                   var data = $questionids.val();
                   if(data) {
                       var $newdata = data.split(',');
                       $newdata.splice($.inArray($id,$newdata),1);
                       $questionids.val($newdata);
                   }
               }
               //return false;
           });
           $(function () {
                $('div[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    var $qid = $(this).attr("data-id")
                    $(selected).css("background", "none")
                    $(this).css("background", "#C6C2C2")
                    selected = this
                    console.log($qid);
                    Fast.api.ajax({
                        url:'/admin/examination/examination/getQuestions',
                        data:{question_id: $qid},
                        type: 'post'
                    }, function(data, ret){
                        //成功的回调
                        //console.log(data);
                        if(!$.isArray(data)){
                            return false;
                        }else{
                            $question.html('');
                            var $questionids = $('#questionids');
                            var $data = $questionids.val();
                            var $newdata = $data.split(',');
                            console.log($newdata);
                            data.filter(function (item) {
                                console.log(item);
                                if($.inArray(''+item.id,$newdata) >= 0){
                                    var $qstring = ' <div><input  class="input-check" type="checkbox"  checked="checked" name="item" value='+item.id+'><span>'+item.title+'</span></div>';
                                }else {
                                    var $qstring = ' <div><input  class="input-check" type="checkbox"    name="item" value='+item.id+'><span>'+item.title+'</span></div>';
                                }

                                $question.append($qstring);
                            });
                        };



                        return false;
                    }, function(data, ret){
                        //失败的回调
                        console.log(data);
                        return false;
                    });
                })
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
