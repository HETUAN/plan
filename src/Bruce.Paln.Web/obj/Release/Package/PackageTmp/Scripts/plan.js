require.config({
    baseUrl: '',
    paths: {
        jquery: '../Scripts/jquery-2.1.1.min',
        bootstrap: '../Scripts/bootstrap/bootstrap.min',
        moment: '../Scripts/bootstrap/moment-with-locales',
        datetimepicker: '../Scripts/bootstrap/bootstrap-datetimepicker',
        DateExtend: '../Scripts/DateExtend',
        User: '../Scripts/user',
        Daily: '../Scripts/daily',
        Note: '../Scripts/note',
        //Remind: '../Scripts/remind',
        //jqueryui: '../Scripts/datetime/jquery-ui-1.10.4.custom.min.js',
        //jqueryuidatepickerCN: '../Scripts/datetime/jquery.ui.datepicker-zh-CN.js',
        //jqueryuitimepacker: '../Scripts/datetime/jquery-ui-timepicker-addon.js',
        //jqueryuitimepickerCN: '../Scripts/datetime/jquery-ui-timepicker-zh-CN.js'
    },
    shim: {
        "bootstrap": ["jquery"],
        "moment": ["bootstrap"],
        "datetimepicker": ["bootstrap", "moment"]
    }
});

define(['jquery', 'DateExtend', 'bootstrap', 'moment', 'datetimepicker', 'User', 'Daily', 'Note', 'Remind'], function (jQuery, DateExtend, bootstrap, moment, datetimepicker, User, Daily, Note, Remind) {
    //console.log($);
    var $ = jQuery;
    var planVM = function () {
        //this.remind = null;
        //if (Remind == null) {
        //    Remind = require("Remind");
        //    //console.log(Remind);
        //    this.remind = Remind.Remind();
        //    //r.StartRemind(data);
        //} else {
        //    this.remind = Remind.Remind();
        //}
        //console.log(this.remind);
    }

    planVM.prototype.remind = null;
    //planVM.prototype.Init = function () {
    //    if (Remind == null) {
    //        Remind = require("Remind"); 
    //        planVM.prototype.remind = new Remind.Remind(); 
    //    } else {
    //        planVM.prototype.remind = new Remind.Remind();
    //    } 
    //    //初始化界面
    //    planVM.prototype.Init = function () {
    //        //
    //    }
    //}

    //planVM.prototype.test = function (msg) {
    //    this.remind.Alert(msg);
    //}

    //var RR = require("../Scripts/remind");
    //console.log(RR);
    //加载数据
    planVM.prototype.LoadData = function () {
        var type = $("input[name='showModel']").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        if (type == "day") {
            type = 1;
        } else if (type == "day") {
            type = 2;
        } else if (type == "day") {
            type = 3;
        } else {
            type = 0;
        }
        var para = { type: type, startTime: startTime, endTime: endTime };
        $.post("/Home/GetData", para, function (data) {
            if (data != null) {
                //console.log(data); 
                var p = new planVM();
                p.TransferJsonToHtml(data);

                //设置提醒
                //if (Remind == null) {
                //    Remind = require("Remind");
                //    //console.log(Remind);
                //    var r = new Remind.Remind();
                //    r.StartRemind(data);
                //} else {
                //    var r = new Remind.Remind();
                //    r.StartRemind(data);
                //}
                //var r = new require("../Scripts/remind").Remind();
                //r.StartRemind(data);   
                if (Remind == null) {
                    Remind = require("Remind");
                    console.log(Remind);
                    Remind.Remind.StartRemind(data);
                } else {
                    console.log(Remind);
                    Remind.Remind.StartRemind(data);
                }
                p.ReBindDeleteAndEditEvent();
            } else {
                console.log("error");
            }
        }, "json");
    }

    planVM.prototype.TransferJsonToHtml = function (jsondata) {
        //
        var panel = $('<div class="panel-group" id="accordion">');
        var idx = -1;
        for (var i = 0; i < jsondata.length; i++) {
            var now = new Date();
            //console.log(now.Formate("yyyy-MM-dd hh:mm:ss.S"));
            var happenTime = eval(jsondata[i].HappenTime.replace(/\/Date\((\d+)\)\//gi, "new Date($1)"));
            var endTime = new Date(happenTime).AddMinute(jsondata[i].UseTime);
            var type = 'warning'

            if (endTime.Compare(now) < 0) {
                type = 'default'
            } else if (happenTime.Compare(now) < 0 && endTime.Compare(now) > 0) {
                type = 'success'
                idx = i;
            } else {
                type = 'info'
            }
            //warning
            var tag = $('<div class="panel panel-' + type + '">' +
                             '<div class="panel-heading">' +
                                '<h4 class="panel-title">' +
                                    '<a data-toggle="collapse" data-parent="#accordion"' +
                                    'href="#collapse' + i + '">' +
                                    '时间：' + happenTime.Formate("MM-dd hh:mm") + ' |  任务：' + jsondata[i].Tag + ' （' + jsondata[i].UseTime + '分钟）' +
                                     '</a>' +
                                     '<a style="float:right;" class="editbtn" val="' + jsondata[i].Id + '">编辑</a>' +
                                     '<a style="float:right;" class="deletebtn" val="' + jsondata[i].Id + '">删除&nbsp;&nbsp;</a>' +
                                     '<a style="float:right;" class="finishbtn" val-id="' + jsondata[i].Id + '" val-resultid="' + jsondata[i].Result + '">' + (jsondata[i].Result == 0 ? "添加" : "修改") + '完成&nbsp;&nbsp;</a>' +
                                 '</h4>' +
                             '</div>' +
                             '<div id="collapse' + i + '" class="panel-collapse collapse">' +
                                 '<div class="panel-body">' +
                                     '<p><h4><b>详细信息：</b></h4>' +
                                         jsondata[i].Detail +
                                     '</p>' +
                                     '<p><h4><b>结果：' + (jsondata[i].Result == 1 ? "成功" : (jsondata[i].Result == 0 ? "未添加" : "失败")) + '</b></h4><br />' +
                                         (jsondata[i].Summary == null ? "" : jsondata[i].Summary) +
                                     '</p>' +
                                 '</div>' +
                             '</div>' +
                        '</div>');
            panel.append(tag);
        }
        var plan = $("#plan");
        plan.empty();
        plan.append(panel);
        $("panel-collapse").collapse({ toggle: false });
        $("#collapse" + idx).collapse('show');
    }

    // 重新加载数据 已经弃用
    planVM.prototype.ReloadData = function () {
        var type = $("input[name='showModel']").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        if (type == "day") {
            type = 1;
        } else if (type == "day") {
            type = 2;
        } else if (type == "day") {
            type = 3;
        } else {
            type = 0;
        }
        var para = { type: type, startTime: startTime, endTime: endTime };
        $.post("/Home/GetData", para, function (data) {
            if (data != null) {
                //console.log(data);
                var plan = $("#plan");
                //console.log(plan.text());
                plan.empty();
                var p = new planVM();
                plan.append(p.TransferJsonToHtml(data));

                //设置提醒
                //if (Remind == null) {
                //    Remind = require("Remind");
                //    console.log(Remind);
                //    var r = new Remind.Remind();
                //    r.StartRemind(data);
                //} else {
                //    var r = new Remind.Remind();
                //    r.StartRemind(data);
                //}
                //var r = new require("../Scripts/remind").Remind();
                //r.StartRemind(data);
                if (Remind == null) {
                    Remind = require("Remind");
                    Remind.Remind.StartRemind(data);
                } else {
                    Remind.Remind.StartRemind(data);
                }

                new planVM().ReBindDeleteAndEditEvent();
            } else {
                console.log("error");
            }
        }, "json");
    }

    // 添加数据
    planVM.prototype.Add = function () {
        //
        console.log("add");
        $("#Id").val(0)
        $("#planImportance").val(0);
        $("#planTag").val("");
        $("#planDetail").val("");
        $("#planIsRemind").attr("checked", true);
        $("#planPerRemind").attr("checked", true);
        $("#planPerRemindTime").val(10);
        $("#planHappenTime").val((new Date).Formate("yyyy-MM-dd hh:mm"));
        $("#planUseTime").val("");

        $("#addModal").modal();
    }

    // 修改
    planVM.prototype.Edit = function (id) {
        //
        $.get("/Home/GetModel?Id=" + id, function (data) {
            //
            if (data != null) {
                console.log("edit");
                $("#Id").val(data.Id)
                $("#planImportance").val(data.Importance);
                $("#planTag").val(data.Tag);
                $("#planDetail").val(data.Detail);

                $("#planIsRemind").attr('checked', (data.IsRemind == 0 ? false : true));
                $("#planPerRemind").attr('checked', (data.PerRemind == 0 ? false : true));
                $("#planPerRemindTime").val(data.perRemindTime);
                $("#planHappenTime").val(TransferJsonTime(data.HappenTime).Formate("yyyy-MM-dd hh:mm:ss"));
                $("#planUseTime").val(data.UseTime);
                $("#addModal").modal();
            } else {
                console.log("edit load data error!");
            }
        })
    }

    // 删除
    planVM.prototype.Delete = function (entityId) {
        //
        confirm("确定要删除吗？", function () {
            $.post("/Home/Delete", { Id: entityId }, function (data) {
                if (data.result) {
                    var p = new planVM();
                    p.LoadData();
                } else {
                    alert("faile!");
                }
            });
        });
    }

    planVM.prototype.Finish = function (id, resultid) {
        //添加弹出层DOM节点
        var model = $('<div class="modal fade" id="editResultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
           '<div class="modal-dialog">' +
               '<div class="modal-content">' +
                   '<div class="modal-header">' +
                       '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
                       '</button>' +
                       '<h4 class="modal-title" id="myModalLabel">' +
                           '确认弹出框' +
                       '</h4>' +
                   '</div>' +

                   '<div class="modal-body">' +

                   '<form class="form-horizontal" role="form">' +
                   '<div class="form-group">' +
                   '     <label for="planResult" class="col-sm-2 control-label">结果</label>' +
                   '     <div class="col-sm-10">' +
                   '         <select id="planResult" class="form-control">' +
                   '             <option value="1">完成</option>' +
                   '             <option value="2">失败</option> ' +
                   '         </select>' +
                   '     </div>' +
                   ' </div>' +
                   ' <div class="form-group">' +
                   '     <label for="planSummary" class="col-sm-2 control-label">详细说明</label>' +
                   '     <div class="col-sm-10">' +
                   '         <textarea class="form-control" id="planSummary" rows="3"></textarea>' +
                   '     </div>' +
                   ' </div>' +
                   '<input type="hidden" id="planId" value="0" />' +
                   '</form>' +

                   '</div>' +
                   '<div class="modal-footer">' +
                       '<button type="button" class="btn btn-default" data-dismiss="modal">' +
                           '关闭' +
                       '</button>' +
                       '<button type="button" id="editResultConfirm" class="btn btn-primary">' +
                           '确认' +
                       '</button>' +
                   '</div>' +
               '</div>' +
           '</div> ' +
       '</div>');
        $("body").append(model);

        // 如果已存在需要请求并绑定数据
        if (resultid != 0) {
            $.get("/Home/GetResultModel?planId=" + id, function (data) {
                //
                if (data != null) {
                    $("#planId").val(data.PlanId);
                    $("#planResult").val(data.Result);
                    $("#planSummary").val(data.Summary);
                } else {
                    $("#planId").val(id);
                    $("#planResult").val(1);
                    $("#planSummary").val("");
                }
            });
        } else {
            $("#planId").val(id);
            $("#planResult").val(1);
            $("#planSummary").val("");
        }

        //模态弹出
        model.modal('show');

        if (resultid == 0) {
            $("#editResultConfirm")[0].onclick = function () {
                var param = { Id: 0 };
                param.PlanId = $("#planId").val();
                param.Result = $("#planResult").val();
                param.Summary = $("#planSummary").val();

                $.post("/Home/AddResult", param, function (data) {
                    if (data.result) {
                        $("#editResultModal")[0].remove();
                        var p = new planVM();
                        p.LoadData();
                    }
                });
            }
        } else {
            $("#editResultConfirm")[0].onclick = function () {
                var param = { Id: 0 };
                param.PlanId = $("#planId").val();
                param.Result = $("#planResult").val();
                param.Summary = $("#planSummary").val();

                $.post("/Home/EditResult", param, function (data) {
                    if (data.result) {
                        $("#editResultModal")[0].remove();
                        var p = new planVM();
                        p.LoadData();
                    }
                });
            }
        }
    }

    planVM.prototype.BindTypeEvnet = function () {
        // 日、周、月点击后radio按钮同时选定
        $(".head-nav ul li").each(function () {
            this.onclick = function () {
                $(this).children("input")[0].checked = true;
            }
        });

        // 添加按钮点击弹出模态
        $("#addPlan")[0].onclick = function () {
            var p = new planVM();
            p.Add();
        }

        // 添加模态提交事件
        $("#submit")[0].onclick = function () {
            var param = {};
            param.Id = $("#Id").val()
            param.UserId = "0";
            param.Importance = $("#planImportance").val();
            param.Tag = $("#planTag").val();
            param.Detail = $("#planDetail").val();
            param.IsRemind = $("#planIsRemind").attr("checked") == "checked" ? 1 : 0;
            param.PerRemind = $("#planPerRemind").attr("checked") == "checked" ? 1 : 0;
            param.perRemindTime = $("#planPerRemindTime").val();
            param.HappenTime = $("#planHappenTime").val();
            param.UseTime = $("#planUseTime").val();
            if (param.Id == null || param.Id == 0) {
                $.post("/Home/Add", param, function (data) {
                    if (data.result) {
                        var p = new planVM();
                        p.LoadData();
                        $("#addModal").modal('hide');
                    } else {
                        alert("add faile!");
                    }
                });
            } else {
                $.post("/Home/Edit", param, function (data) {
                    if (data.result) {
                        var p = new planVM();
                        p.LoadData();
                        $("#addModal").modal('hide');
                    } else {
                        alert("edit faile!");
                    }
                });
            }
        }

        // 选择日期后点击确定重新加载事件
        $("#reloadData")[0].onclick = function () {
            var p = new planVM();
            p.LoadData();
        }

        //日记列表 
        $("#DailyList")[0].onclick = function () {
            console.log("DailyList");
            var daily = new Daily.Daily();
            daily.DailyList();
        }

        // 添加日记模态提交事件
        $("#DailyAdd")[0].onclick = function () {
            console.log("DailyAdd");
            var daily = new Daily.Daily();
            daily.DailyAdd();
        }

        //便签列表 
        $("#NoteList")[0].onclick = function () {
            console.log("NoteList");
            var note = new Note.Note();
            note.NoteList();
        }

        //便签列表
        // 添加模态提交事件
        $("#NoteAdd")[0].onclick = function () {
            console.log("NoteAdd");
            var note = new Note.Note();
            note.NoteAdd();
        }

        // 添加日记模态提交事件
        $("#addDailySummary")[0].onclick = function () {
            console.log("DailyAdd");
            var daily = new Daily.Daily();
            daily.DailyAdd();
        }

    }

    planVM.prototype.BindViewDate = function (type) {
        if (type == "month") {
            $("#startTime").val(new Date().toDateString());
            $("#endTime").val(new Date().toDateString());
        } else if (type == "week") {
            $("#startTime").val(new Date().toDateString());
            $("#endTime").val(new Date().toDateString());
        } else {
            $("#startTime").val(new Date().toDateString());
            $("#endTime").val(new Date().toDateString());
        }
    }

    planVM.prototype.ReBindDeleteAndEditEvent = function () {
        $(".deletebtn").each(function () {
            this.onclick = function () {
                var id = $(this).attr("val");
                (new planVM).Delete(id);
            }
        });
        $(".editbtn").each(function () {
            //console.log("asdf");
            this.onclick = function () {
                var id = $(this).attr("val");
                (new planVM).Edit(id);
            }
        });

        $(".finishbtn").each(function () {
            //console.log("asdf");
            this.onclick = function () {
                var id = $(this).attr("val-id");
                var rid = $(this).attr("val-resultid");
                (new planVM).Finish(id, rid);
            }
        });

    }

    var TransferJsonTime = function (Time) {
        return eval(Time.replace(/\/Date\((\d+)\)\//gi, "new Date($1)"))
    }

    var confirm = function (content, callback) {
        //
        var model = $('<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
	        '<div class="modal-dialog">' +
		        '<div class="modal-content">' +
			        '<div class="modal-header">' +
				        '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
				        '</button>' +
				        '<h4 class="modal-title" id="myModalLabel">' +
					        '确认弹出框' +
				        '</h4>' +
			        '</div>' +
			        '<div class="modal-body">' +
				        content +
			        '</div>' +
			        '<div class="modal-footer">' +
				        '<button type="button" class="btn btn-default" data-dismiss="modal">' +
					        '关闭' +
				        '</button>' +
				        '<button type="button" id="confirm" class="btn btn-primary">' +
					        '确认' +
				        '</button>' +
			        '</div>' +
		        '</div>' +
	        '</div> ' +
        '</div>');
        $("body").append(model);
        model.modal('show');
        $("#confirm")[0].onclick = function () {
            callback && callback();
            $("#confirmModal")[0].remove();
        }

        //model.on('hide.bs.modal', function () {
        //    alert('嘿，我听说您喜欢模态框...');
        //})
    }


    /*
    var p = new planVM();
    p.LoadData();
    p.BindTypeEvnet();
    $('#datetimepicker1').datetimepicker({
        defaultDate: new Date(),
    });
    $('#datetimepicker11').datetimepicker({
        defaultDate: new Date(),
    });
    $('#datetimepicker111').datetimepicker({
        defaultDate: new Date(),
    });
    //User.LoadData();
    var user = new User.User();
    user.LoadData(); 
    */
    return { planVM: planVM }
});