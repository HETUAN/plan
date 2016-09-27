require.config({
    baseUrl: '',
    paths: {
        jquery: '../Scripts/jquery-2.1.1.min',
        bootstrap: '../Scripts/bootstrap/bootstrap.min',
        moment: '../Scripts/bootstrap/moment-with-locales',
        datetimepicker: '../Scripts/bootstrap/bootstrap-datetimepicker',
        DateExtend: '../Scripts/DateExtend',
    },
    shim: {
        "bootstrap": ["jquery"],
        "moment": ["bootstrap"],
        "datetimepicker": ["bootstrap", "moment"]
    }
});
define(['jquery', 'bootstrap', 'moment', 'datetimepicker', 'DateExtend'], function ($, bootstrap, moment, datetimepicker, DateExtend) {
    var Daily = function () { }

    // 显示列表，未分分页
    Daily.prototype.DailyList = function (index) {
        //
        var pageSize = 5;//$("#dailyPagerSize").val();
        var pageIndex = index == null ? $("#dailyPager ul li[class='active']").text() : index;
        var title = $("#dailyPagerTitle").val();
        var date = $("#dailyPagerDate").val();
        if (pageIndex == null || pageIndex == "")
            pageIndex = 1;
        title = title == undefined ? "" : title;
        date = date == undefined ? "" : date;

        var param = "pageindex=" + pageIndex + "&pageSize=" + pageSize + "&title=" + title + "&date=" + date;
        $.get("/Daily/GetListPager?" + param, function (data) {
            var content = "";
            if (data == null) {
                content = "没有数据";
            } else {
                content += '<div class="row">';
                content += '   <div class="col-md-12">';
                content += '        <div class="panel panel-default">';
                content += '            <div class="panel-heading>';
                content += '            </div>';
                content += '            <div class="panel-body">';
                content += '                <div id="dailyListContent" class="table-responsive">';
                content += '                    <table class="table table-striped table-bordered table-hover">';
                content += '                        <thead>';
                content += '                            <tr>';
                //content += '                                <th>编号</th>';
                content += '                                <th>标题</th>';
                content += '                                <th>时间</th>';
                content += '                                <th>操作</th>';
                content += '                            </tr>';
                content += '                        </thead>';
                content += '                        <tbody>';

                for (var i = 0; i < data.List.length; i++) {
                    var DailyDate = eval(data.List[i].DailyDate.replace(/\/Date\((\d+)\)\//gi, "new Date($1)"));
                    content += '                            <tr>';
                    //content += '                                <td>' + data[i].Id + '</td>';
                    content += '                                <td>' + data.List[i].Title.substr(0, 30) + '</td>';
                    content += '                                <td>' + DailyDate.Formate("yyyy-MM-dd") + '</td>';
                    content += '                                <td><button type="button" class="btn btn-link" tag="DailyListEdit" val="' + data.List[i].Id + '">编辑</button>' + '' + '</td>';
                    content += '                            </tr>';
                }
                content += '                        </tbody>';
                content += '                    </table>';
                content += '                </div>';
                content += '            </div>';
                content += '            <div class="panel-footer" id="dailyListFooter" ></div>';
                content += '        </div>';
                content += '    </div>';
                content += '</div>';
            }

            var model = $('<div class="modal fade" id="DailyListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
               '<div class="modal-dialog">' +
                   '<div class="modal-content">' +
                       '<div class="modal-header">' +
                           '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
                           '</button>' +
                           '<h4 class="modal-title" id="DailyListModalLabel">' +
                               '确认弹出框' +
                           '</h4>' +
                       '</div>' +

                       '<div class="modal-body">' +
                       content +
                       '</div>' +
                       //'<div class="modal-footer">' +
                       //    '<button type="button" class="btn btn-default" data-dismiss="modal">' +
                       //        '关闭' +
                       //    '</button>' +
                       //    '<button type="button" id="editResultConfirm" class="btn btn-primary">' +
                       //        '确认' +
                       //    '</button>' +
                       //'</div>' +
                   '</div>' +
               '</div> ' +
           '</div>');
            $("body").append(model);
            var btns = $("button[val][tag='DailyListEdit'] ")
            btns.each(function (idx, btn) {
                //console.log(btn);
                btn.onclick = function () {
                    var dd = new Daily();
                    dd.DailyEdit($(this).attr("val"));
                }
            });
            var ddd = new Daily();
            ddd.Pager(data.rowCount, 5, data.curIndex);
            model.modal();
            model.on('hide.bs.modal',
                function () {
                    console.log($(this));
                    $(this).remove();
                })
        })
    }

    //添加Daily
    Daily.prototype.DailyAdd = function () {
        //todo 添加有重复根据日期限定或约束,添加和修改可以功能区分.
        console.log(this);
        var url = "/Daily/GetModelByDate?date=" + (new Date()).Formate("yyyy-MM-dd");
        $.get(url, function (data) {
            var d = new Daily();
            var node = d.CreateModel(data);
            $("body").append(node);
            console.log($("DailyDatedatetimepicker"));
            //$("DailyDatedatetimepicker").datetimepicker({
            //    defaultDate: new Date(),
            //});
            $("#DailyAddConfirm")[0].onclick = function () {
                //
                console.log("DailyAddConfirm");
                var param = {};
                param.Id = $("#DailyId").val();
                param.Title = $("#DailyAddTitle").val().trim();
                param.Summary = $("#DailyAddSummary").val().trim();
                param.DailyDate = new Date().Formate('yyyy-MM-dd');
                //param.Date = $("#DailyAddDate").val().trim();
                if (param.Title == "") {
                    alert("请输入标题");
                    return;
                }
                if (param.Summary == "") {
                    alert("请输入详细信息");
                    return;
                }
                //if (param.Date == "") {
                //    alert("请输入日期");
                //    return;
                //}
                var url = param.Id == 0 ? "/Daily/Add" : "/Daily/Edit";
                $.post(url, param, function (data) {
                    //
                    if (data.result) {
                        $("#DailyAddModal").remove();
                    } else {
                        alert("失败！");
                    }
                });
            }
            node.modal();
        })
    }

    // 编辑
    Daily.prototype.DailyEdit = function (id) {
        console.log(this);
        if (id == null) {
            return;
        }
        var url = "/Daily/GetModel?id=" + id;
        $.get(url, function (data) {
            var d = new Daily();
            var node = d.CreateModel(data);
            $("body").append(node);
            $("#DailyAddConfirm")[0].onclick = function () {
                //
                console.log("DailyAddConfirm");
                var param = {};
                param.Id = $("#DailyId").val();
                param.Title = $("#DailyAddTitle").val().trim();
                param.Summary = $("#DailyAddSummary").val().trim();
                param.DailyDate = new Date().Formate('yyyy-MM-dd');
                //param.Date = $("#DailyAddDate").val().trim();
                if (param.Title == "") {
                    alert("请输入标题");
                    return;
                }
                if (param.Summary == "") {
                    alert("请输入详细信息");
                    return;
                }
                var url = param.Id == 0 ? "/Daily/Add" : "/Daily/Edit";
                $.post(url, param, function (data) {
                    if (data.result) {
                        $("#DailyAddModal").remove();
                    } else {
                        alert("失败！");
                    }
                });
            }
            console.log($("#DailyAddConfirm").first());
            node.modal();
            node.on('hide.bs.modal',
                function () {
                    console.log($(this));
                    $(this).remove();
                })
        })
    }

    Daily.prototype.Pager = function (rows, pageSize, curIdx) {
        //
        var html = '';
        html += '<div class="row" id="dailyPager">';
        //html += '    <div class="col-sm-2">';
        //html += '        <div class="dataTables_info" id="dailyPager_info" role="alert" aria-live="polite" aria-relevant="all">';
        //html += '        </div>';
        //html += '    </div>';
        //html += '    <div class="col-sm-2">';
        //html += '    </div>';
        html += '    <div class="col-sm-10">';

        html += '        <div style="float:left; margin-top:3px; margin-right:5px; display:none;">';
        html += '            <select id="dailyPagerSize" class="input-sm">';
        html += '                <option value="10">10</option>';
        html += '                <option value="25">25</option>';
        html += '                <option value="50">50</option>';
        html += '                <option value="100">100</option>';
        html += '            </select>';
        html += '        </div>';

        html += '        <div  style="float:left;">';
        html += '        <ul id="dailyPager" class="pagination" style="margin:0px;">';
        //var pageSize = 5;//$("#dailyPagerSize").val();
        var pages = rows / pageSize;
        var startPidx = parseInt(curIdx / 5) * 5 + 1;
        var endPidx = startPidx + 5;

        html += '            <li><a href="#" val="' + (curIdx - 1) + '">&laquo;</a></li>';

        for (; startPidx < endPidx; startPidx++) {
            //
            if (startPidx == curIdx) {
                html += '            <li class="active"><a href="#" val="' + startPidx + '">' + startPidx + '</a></li>';
            } else {
                html += '            <li><a href="#" val="' + startPidx + '">' + startPidx + '</a></li>';
            }
        }
        html += '            <li><a href="#" val="' + (curIdx + 1) + '">&raquo;</a></li>';
        html += '        </ul>';
        html += '        </div>';

        html += '    </div>';
        html += '</div>';
        var node = $(html);
        $("#dailyListFooter").append(node);
        $("#dailyPagerSize").change = function () {
            var d = new Daily();
            d.DailyList();
        }

        $("#dailyPager li a").each(function () {
            console.log($(this));
            $(this)[0].onclick = function () {
                //console.log($(this));
                console.log($(this).attr("val"));
                var d = new Daily();
                d.DailyList($(this).attr("val"));
            }
        });

    }

    // 根据实体生成Model节点
    Daily.prototype.CreateModel = function (model) {

        var node;
        if (model.Id == null) {
            node = $('<div class="modal fade" id="DailyAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
                              '<div class="modal-dialog">' +
                                  '<div class="modal-content">' +
                                      '<div class="modal-header">' +
                                          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
                                          '</button>' +
                                          '<h4 class="modal-title" id="DailyAddModalLabel">' +
                                              '确认弹出框' +
                                          '</h4>' +
                                      '</div>' +

                                      '<div class="modal-body">' +

                                       '<form class="form-horizontal" role="form">' +
                                       '    <input type="hidden" id="DailyId" value="0" />' +
                                       '    <div class="form-group">' +
                                       '        <label for="DailyAddTitle" class="col-sm-2 control-label">标题</label>' +
                                       '        <div class="col-sm-10">' +
                                       '            <input type="text" class="form-control" id="DailyAddTitle" placeholder="请输入名字">' +
                                       '        </div>' +
                                       '    </div>' +
                                       '    <div class="form-group">' +
                                       '        <label for="DailyAddSummary" class="col-sm-2 control-label">详细说明</label>' +
                                       '        <div class="col-sm-10">' +
                                       '            <textarea class="form-control" id="DailyAddSummary" rows="3"></textarea>' +
                                       '        </div>' +
                                       '    </div>' +
                                       //'    <div class="form-group">' +
                                       //'        <label for="DailyDate" class="col-sm-2 control-label">日记</label> ' +
                                       //'        <div class="col-sm-9 input-group date" style="padding-left: 15px;" id="DailyDatedatetimepicker">' +
                                       //'            <input type="text" id="DailyDate" class="form-control" />' +
                                       //'            <span class="input-group-addon">' +
                                       //'                <span class="glyphicon glyphicon-calendar"></span>' +
                                       //'            </span>' +
                                       //'        </div>' +
                                       //'    </div>' +
                                       '</form>' +

                                       '</div>' +
                                       '<div class="modal-footer">' +
                                           '<button type="button" class="btn btn-default" data-dismiss="modal">' +
                                               '关闭' +
                                           '</button>' +
                                           '<button type="button" id="DailyAddConfirm" class="btn btn-primary">' +
                                               '确认' +
                                           '</button>' +
                                       '</div>' +
                                   '</div>' +
                               '</div> ' +
                            '</div>');
        } else {

            node = $('<div class="modal fade" id="DailyAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
                              '<div class="modal-dialog">' +
                                  '<div class="modal-content">' +
                                      '<div class="modal-header">' +
                                          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
                                          '</button>' +
                                          '<h4 class="modal-title" id="DailyAddModalLabel">' +
                                              '确认弹出框' +
                                          '</h4>' +
                                      '</div>' +

                                      '<div class="modal-body">' +

                                       '<form class="form-horizontal" role="form">' +
                                       '    <input type="hidden" id="DailyId" value="' + model.Id + '" />' +
                                       '    <div class="form-group">' +
                                       '        <label for="DailyAddTitle" class="col-sm-2 control-label">标题</label>' +
                                       '        <div class="col-sm-10">' +
                                       '            <input type="text" class="form-control" id="DailyAddTitle" value="' + model.Title + '" placeholder="请输入名字">' +
                                       '        </div>' +
                                       '    </div>' +
                                       '    <div class="form-group">' +
                                       '        <label for="DailyAddSummary" class="col-sm-2 control-label">详细说明</label>' +
                                       '        <div class="col-sm-10">' +
                                       '            <textarea class="form-control" id="DailyAddSummary" rows="3"> ' + model.Summary + '</textarea>' +
                                       '        </div>' +
                                       '    </div>' +
                                       //'    <div class="form-group">' +
                                       //'        <label for="DailyDate" class="col-sm-2 control-label">日记</label> ' +
                                       //'        <div class="col-sm-9 input-group date" style="padding-left: 15px;" id="DailyDatedatetimepicker">' +
                                       //'            <input type="text" id="DailyDate" class="form-control" />' +
                                       //'            <span class="input-group-addon">' +
                                       //'                <span class="glyphicon glyphicon-calendar"></span>' +
                                       //'            </span>' +
                                       //'        </div>' +
                                       //'    </div>' +
                                       '</form>' +

                                       '</div>' +
                                       '<div class="modal-footer">' +
                                           '<button type="button" class="btn btn-default" data-dismiss="modal">' +
                                               '关闭' +
                                           '</button>' +
                                           '<button type="button" id="DailyAddConfirm" class="btn btn-primary">' +
                                               '确认' +
                                           '</button>' +
                                       '</div>' +
                                   '</div>' +
                               '</div> ' +
                            '</div>');
        }
        return node;
    }

    return { Daily: Daily };
});