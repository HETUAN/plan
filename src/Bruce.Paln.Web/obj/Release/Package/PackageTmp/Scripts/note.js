﻿require.config({
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
    var Note = function () { }

    // 显示列表，未分分页
    Note.prototype.NoteList = function (index) {
        //
        var pageSize = 5;//$("#dailyPagerSize").val();
        var pageIndex = index == null ? $("#dailyPager ul li[class='active']").text() : index;
        var title = $("#dailyPagerTitle").val();
        //var date = $("#dailyPagerDate").val();
        if (pageIndex == null || pageIndex == "")
            pageIndex = 1;
        title = title == undefined ? "" : title;
        //date = date == undefined ? "" : date;

        var param = "pageindex=" + pageIndex + "&pageSize=" + pageSize + "&title=" + title;
        $.get("/Note/GetListPager?" + param, function (data) {
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
                content += '                                <th>创建时间</th>';
                content += '                                <th>操作</th>';
                content += '                            </tr>';
                content += '                        </thead>';
                content += '                        <tbody id="dailyListTbody">';

                for (var i = 0; i < data.List.length; i++) {
                    var CreateTime = eval(data.List[i].CreateTime.replace(/\/Date\((\d+)\)\//gi, "new Date($1)"));
                    content += '                            <tr>';
                    //content += '                                <td>' + data[i].Id + '</td>';
                    content += '                                <td>' + data.List[i].Title.substr(0, 30) + '</td>';
                    content += '                                <td>' + CreateTime.Formate("yyyy-MM-dd hh:mm") + '</td>';
                    content += '                                <td><button type="button" class="btn btn-link" tag="NoteListEdit" val="' + data.List[i].Id + '">编辑</button>' + '' + '</td>';
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

            var model = $('<div class="modal fade" id="NoteListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
               '<div class="modal-dialog">' +
                   '<div class="modal-content">' +
                       '<div class="modal-header">' +
                           '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
                           '</button>' +
                           '<h4 class="modal-title" id="NoteListModalLabel">' +
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
            var btns = $("button[val][tag='NoteListEdit'] ")
            btns.each(function (idx, btn) {
                //console.log(btn);
                btn.onclick = function () {
                    var dd = new Note();
                    dd.NoteEdit($(this).attr("val"));
                }
            });
            var ddd = new Note();
            ddd.Pager(data.rowCount, 5, data.curIndex);
            model.modal();
            model.on('hide.bs.modal',
                function () {
                    console.log($(this));
                    $(this).remove();
                })
        })
    }

    // 显示列表，未分分页
    Note.prototype.NoteListReload = function (index) {
        //
        if (index == -1) return; //超出索引不显示
        var pageSize = 5;//$("#dailyPagerSize").val();
        var pageIndex = index == null ? $("#dailyPager ul li[class='active']").text() : index;
        var title = $("#dailyPagerTitle").val();
        //var date = $("#dailyPagerDate").val();
        if (pageIndex == null || pageIndex == "")
            pageIndex = 1;
        title = title == undefined ? "" : title;
        //date = date == undefined ? "" : date;

        var param = "pageindex=" + pageIndex + "&pageSize=" + pageSize + "&title=" + title;
        $.get("/Note/GetListPager?" + param, function (data) {
            var content = "";
            if (data == null) {
                content = "没有数据";
            } else {

                for (var i = 0; i < data.List.length; i++) {
                    var CreateTime = eval(data.List[i].CreateTime.replace(/\/Date\((\d+)\)\//gi, "new Date($1)"));
                    content += '                            <tr>';
                    //content += '                                <td>' + data[i].Id + '</td>';
                    content += '                                <td>' + data.List[i].Title.substr(0, 30) + '</td>';
                    content += '                                <td>' + CreateTime.Formate("yyyy-MM-dd hh:mm") + '</td>';
                    content += '                                <td><button type="button" class="btn btn-link" tag="NoteListEdit" val="' + data.List[i].Id + '">编辑</button>' + '' + '</td>';
                    content += '                            </tr>';
                }

            }

            $("#dailyListTbody").html(content);
            var btns = $("button[val][tag='NoteListEdit'] ")
            btns.each(function (idx, btn) {
                //console.log(btn);
                btn.onclick = function () {
                    var dd = new Note();
                    dd.NoteEdit($(this).attr("val"));
                }
            });
            var ddd = new Note();
            ddd.Pager(data.rowCount, 5, data.curIndex);
        })
    }

    //添加Note
    Note.prototype.NoteAdd = function () {
        //todo 添加有重复根据日期限定或约束,添加和修改可以功能区分.
        console.log(this);

        var d = new Note();
        var node = d.CreateModel(null);
        $("body").append(node);
        console.log($("NoteDatedatetimepicker"));
        //$("NoteDatedatetimepicker").datetimepicker({
        //    defaultDate: new Date(),
        //});
        $("#NoteAddConfirm")[0].onclick = function () {
            //
            console.log("NoteAddConfirm");
            var param = {};
            param.Id = $("#NoteId").val();
            param.Title = $("#NoteAddTitle").val().trim();
            param.Note = $("#NoteAddSummary").val().trim();
            //param.NoteDate = new Date().Formate('yyyy-MM-dd');
            //param.Date = $("#NoteAddDate").val().trim();
            if (param.Title == "") {
                alert("请输入标题");
                return;
            }
            if (param.Note == "") {
                alert("请输入详细信息");
                return;
            }
            //if (param.Date == "") {
            //    alert("请输入日期");
            //    return;
            //}
            var url = param.Id == 0 ? "/Note/Add" : "/Note/Edit";
            $.post(url, param, function (data) {
                //
                if (data.result) {
                    $("#NoteAddModal").remove();
                } else {
                    alert("失败！");
                }
            });
        }
        node.modal();
    }

    // 编辑
    Note.prototype.NoteEdit = function (id) {
        console.log(this);
        if (id == null) {
            return;
        }
        var url = "/Note/GetModel?id=" + id;
        $.get(url, function (data) {
            var d = new Note();
            var node = d.CreateModel(data);
            $("body").append(node);
            $("#NoteAddConfirm")[0].onclick = function () {
                //
                console.log("NoteAddConfirm");
                var param = {};
                param.Id = $("#NoteId").val();
                param.Title = $("#NoteAddTitle").val().trim();
                param.Note = $("#NoteAddSummary").val().trim();
                //param.NoteDate = new Date().Formate('yyyy-MM-dd');
                //param.Date = $("#NoteAddDate").val().trim();
                if (param.Title == "") {
                    alert("请输入标题");
                    return;
                }
                if (param.Note == "") {
                    alert("请输入详细信息");
                    return;
                }
                var url = param.Id == 0 ? "/Note/Add" : "/Note/Edit";
                $.post(url, param, function (data) {
                    if (data.result) {
                        $("#NoteAddModal").remove();
                    } else {
                        alert("失败！");
                    }
                });
            }
            console.log($("#NoteAddConfirm").first());
            node.modal();
            node.on('hide.bs.modal',
                function () {
                    console.log($(this));
                    $(this).remove();
                })
        })
    }

    Note.prototype.Pager = function (rows, pageSize, curIdx) {
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

        var pages = parseInt(rows / pageSize) + (rows % pageSize == 0 ? 0 : 1); //总页数
        var ppSize = 5; //分页时每次显示的数量
        var psidx = parseInt(curIdx / ppSize) * ppSize; //开始显示的索引
        //var len = pages < ppSize ? pages : (pages > (parseInt(psidx / ppSize) * ppSize))
        var len = pages < ppSize ? pages : (psidx > (parseInt(pages / ppSize) * ppSize) ? (pages % ppSize) : 5)
        var peidx = psidx + len;
        //var pageSize = 5;//$("#dailyPagerSize").val();

        //var pages = rows / pageSize;
        //var startPidx = parseInt(curIdx / 5) * 5 + 1;
        //var endPidx = startPidx + 5;
        if (curIdx - 1 <= 0)
            html += '            <li><a href="#" val="-1">&laquo;</a></li>';
        else
            html += '            <li><a href="#" val="' + (curIdx - 1) + '">&laquo;</a></li>';

        for (; psidx < peidx; psidx++) {
            //
            var spsidx = psidx + 1;
            if (spsidx == curIdx) {
                html += '            <li class="active"><a href="#" val="' + spsidx + '">' + spsidx + '</a></li>';
            } else {
                html += '            <li><a href="#" val="' + spsidx + '">' + spsidx + '</a></li>';
            }
        }
        if (curIdx + 1 > pages)
            html += '            <li><a href="#" val="-1">&raquo;</a></li>';
        else
            html += '            <li><a href="#" val="' + (curIdx + 1) + '">&raquo;</a></li>';

        html += '        </ul>';
        html += '        </div>';

        html += '    </div>';
        html += '</div>';
        //var node = $(html);
        $("#dailyListFooter").html(html);
        // 每页显示数量改变时响应 （暂时无用固定每页显示五条）
        $("#dailyPagerSize").change = function () {
            var d = new Note();
            d.NoteListReload();
        }

        $("#dailyPager li a").each(function () {
            console.log($(this));
            $(this)[0].onclick = function () {
                //console.log($(this));
                console.log($(this).attr("val"));
                var d = new Note();
                d.NoteListReload($(this).attr("val"));
            }
        });

    }

    // 根据实体生成Model节点
    Note.prototype.CreateModel = function (model) {

        var node;
        if (model == null || model.Id == null) {
            node = $('<div class="modal fade" id="NoteAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
                              '<div class="modal-dialog">' +
                                  '<div class="modal-content">' +
                                      '<div class="modal-header">' +
                                          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
                                          '</button>' +
                                          '<h4 class="modal-title" id="NoteAddModalLabel">' +
                                              '确认弹出框' +
                                          '</h4>' +
                                      '</div>' +

                                      '<div class="modal-body">' +

                                       '<form class="form-horizontal" role="form">' +
                                       '    <input type="hidden" id="NoteId" value="0" />' +
                                       '    <div class="form-group">' +
                                       '        <label for="NoteAddTitle" class="col-sm-2 control-label">标题</label>' +
                                       '        <div class="col-sm-10">' +
                                       '            <input type="text" class="form-control" id="NoteAddTitle" placeholder="请输入标题">' +
                                       '        </div>' +
                                       '    </div>' +
                                       '    <div class="form-group">' +
                                       '        <label for="NoteAddSummary" class="col-sm-2 control-label">详细说明</label>' +
                                       '        <div class="col-sm-10">' +
                                       '            <textarea class="form-control" id="NoteAddSummary" rows="9"></textarea>' +
                                       '        </div>' +
                                       '    </div>' +
                                       //'    <div class="form-group">' +
                                       //'        <label for="NoteDate" class="col-sm-2 control-label">日记</label> ' +
                                       //'        <div class="col-sm-9 input-group date" style="padding-left: 15px;" id="NoteDatedatetimepicker">' +
                                       //'            <input type="text" id="NoteDate" class="form-control" />' +
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
                                           '<button type="button" id="NoteAddConfirm" class="btn btn-primary">' +
                                               '确认' +
                                           '</button>' +
                                       '</div>' +
                                   '</div>' +
                               '</div> ' +
                            '</div>');
        } else {

            node = $('<div class="modal fade" id="NoteAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
                              '<div class="modal-dialog">' +
                                  '<div class="modal-content">' +
                                      '<div class="modal-header">' +
                                          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
                                          '</button>' +
                                          '<h4 class="modal-title" id="NoteAddModalLabel">' +
                                              '确认弹出框' +
                                          '</h4>' +
                                      '</div>' +

                                      '<div class="modal-body">' +

                                       '<form class="form-horizontal" role="form">' +
                                       '    <input type="hidden" id="NoteId" value="' + model.Id + '" />' +
                                       '    <div class="form-group">' +
                                       '        <label for="NoteAddTitle" class="col-sm-2 control-label">标题</label>' +
                                       '        <div class="col-sm-10">' +
                                       '            <input type="text" class="form-control" id="NoteAddTitle" value="' + model.Title + '" placeholder="请输入名字">' +
                                       '        </div>' +
                                       '    </div>' +
                                       '    <div class="form-group">' +
                                       '        <label for="NoteAddSummary" class="col-sm-2 control-label">详细说明</label>' +
                                       '        <div class="col-sm-10">' +
                                       '            <textarea class="form-control" id="NoteAddSummary" rows="9"> ' + model.Note + '</textarea>' +
                                       '        </div>' +
                                       '    </div>' +
                                       //'    <div class="form-group">' +
                                       //'        <label for="NoteDate" class="col-sm-2 control-label">日记</label> ' +
                                       //'        <div class="col-sm-9 input-group date" style="padding-left: 15px;" id="NoteDatedatetimepicker">' +
                                       //'            <input type="text" id="NoteDate" class="form-control" />' +
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
                                           '<button type="button" id="NoteAddConfirm" class="btn btn-primary">' +
                                               '确认' +
                                           '</button>' +
                                       '</div>' +
                                   '</div>' +
                               '</div> ' +
                            '</div>');
        }
        return node;
    }

    Note.prototype.CreateLatestNote = function () {
        //
        $.get("/Note/GetLastModel?" + (new Date()).getMilliseconds(), function (data) {
            if (data != null) {
                //
                var html = $('<p>' + data.Note + '</p>');
                var node = $("#lastNote");
                //node.title = data.Title;
                //node["data-content"] = ("<p>" + data.Title + "</p>");
                node.attr("title", data.Title);
                node.attr("data-content", "<p>" + data.Note + "</p>");
                node.popover({ html: true });
                node.on('show.bs.popover', function () {
                    //
                    $.get("/Note/GetLastModel?" + (new Date()).getMilliseconds(), function (data) {
                        if (data != null) {
                            var n = $("#lastNote");
                            n.attr("title", data.Title);
                            n.attr("data-content", "<p>" + data.Note + "</p>");
                        }
                    });
                });
            }
        });
    }

    return { Note: Note }
});