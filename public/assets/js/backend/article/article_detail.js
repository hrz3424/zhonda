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
                        {field: 'operate', title: __('Operate'), table: table,
                            events: Table.api.events.operate,
                            buttons: [{
                                name: 'question',
                                text: '考题',
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'article/article_detail/question'
                            },
                            {
                                name: 'detail',
                                text: __('Detail'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'article/article_detail/detail'
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
        question: function () {
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
                    var $single = $('#single');
                    var $multi= $('#multi');
                    var $singlecount = $('.single-count');
                    var $multicount = $('.multi-count');
                    var $totalcount = $('.total-count');
                    var $totalscore = $('.total-score');
                    var $passscore = $('.pass-score');
                    var $id = value.id;
                    if($data) {
                        $data = $data + ','+ $id;
                    }else {
                        $data = $id;
                    }
                    $questionids.val($data);
                    var $type = value.typedata;
                    if($type=='0'){
                        var tmp = $single.val()*1 + 1;
                        $single.val(tmp);
                        $singlecount.html('单选题'+ tmp+ '道');
                    }else{
                        var tmp = $multi.val()*1 + 1;
                        $multi.val(tmp);
                        $multicount.html('多选题'+ tmp+ '道');
                    }
                    var $total = $single.val()*1 + $multi.val()*1;
                    $totalcount.html('共'+ $total +'道题目' );
                    $totalscore.html('总分:'+$total*10);
                    $passscore.html('及格分:'+ Math.round($total*10*0.8/10)*10);

                },
                onUncheck: function (value,row, index) {
                    var $id = value.id;
                    var $questionids = $('#questionids');
                    var data = $questionids.val();
                    var $single = $('#single');
                    var $multi= $('#multi');
                    var $singlecount = $('.single-count');
                    var $multicount = $('.multi-count');
                    var $totalcount = $('.total-count');
                    var $totalscore = $('.total-score');
                    var $passscore = $('.pass-score');
                    if(data) {
                        var $newdata = data.split(',');
                        $newdata.splice($.inArray($id,$newdata),1);
                        $questionids.val($newdata);
                    }
                    var $type = value.typedata;
                    if($type=='0'){
                        var tmp = $single.val()*1 - 1;
                        $single.val(tmp);
                        $singlecount.html('单选题'+ tmp+ '道');
                    }else{
                        var tmp = $multi.val()*1 - 1;
                        $multi.val(tmp);
                        $multicount.html('多选题'+ tmp+ '道');
                    }
                    var $total = $single.val()*1 + $multi.val()*1;
                    $totalcount.html('共'+ $total +'道题目' );
                    $totalscore.html('总分:'+$total*10);
                    $passscore.html('及格分:'+ Math.round($total*10*0.8/10)*10);

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
