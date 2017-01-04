
require.config({
    baseUrl: '',
    paths: {
        jquery: '../Scripts/jquery-2.1.1.min',
        DateExtend: '../Scripts/DateExtend',
    }
});
define(['jquery', 'DateExtend'],
    function ($, DateExtend) {
        var smallnote = function () { }

        smallnote.prototype.Init = function () {
            $("#smallNoteOpen")[0].onclick = function () {
                var r = $("#smallNote").css("right");
                if (r == "-200px") {
                    $("#smallNote").animate({
                        right: '0px'
                    });
                    $("#smallNoteOpen").text(">>");
                } else {
                    $("#smallNote").animate({
                        right: '-200px'
                    });
                    $("#smallNoteOpen").text("<<");
                }
            }
            var d = new smallnote();
            d.LoadData();
        }

        smallnote.prototype.LoadData = function () {
            $.get("/SmallNote/GetShowList?" + (new Date()).getMilliseconds(), function (data) {
                if (data != null) {
                    var content = '';
                    for (var i = 0; i < data.length; i++) {
                        content += '<li class="list-group-item ">';
                        content += '<button type="submit"  data="' + data[i].Id + '" class="btn btn-default badge">完成</button> <a title="' + data[i].Note + '" href="javascript:;">' + (data[i].Note.length <= 8 ? data[i].Note : data[i].Note.substr(0, 8)+"..") + "</a>";
                        content += '</li>';
                    }
                    content += '<li class="list-group-item ">';
                    content += '<button type="button" id="addsmallnote" data="" class="btn btn-default">添加</button> ';
                    content += '</li>';
                    content += '';
                    $("#smallNoteContent").html(content);
                    $("#addsmallnote")[0].onclick = function () {
                        var d = new smallnote();
                        d.Add();
                    }

                    var notes = $("#smallNoteContent button[type='submit']");
                    notes.each(function (idx, note) {
                        //
                        note.onclick = function () {
                            //console.log($(this));
                            var tag = $(this);
                            confirm("确定要删除吗？", function () {
                                var id = tag.attr("data");
                                var url = "/SmallNote/UpdateState";
                                $.post(url, { id: id, state: 1 }, function (result) {
                                    if (result) {
                                        var d = new smallnote();
                                        d.LoadData();
                                    } else {
                                        alert("失败！");
                                    }
                                });
                            });
                        }
                        //console.log(note);
                    })
                }
            });
        };

        smallnote.prototype.Add = function () {
            var d = new smallnote();
            var node = d.CreateModel(null);
            $("body").append(node);
            $("#SmallNoteAddConfirm")[0].onclick = function () {
                //
                console.log("SmallNoteAddConfirm");
                var note = $("#SmallNoteAddTitle").val().trim();
                if (note == "") {
                    alert("请输入标题");
                    return;
                }
                var url = "/SmallNote/AddSmallNote";
                $.post(url, { note: note }, function (data) {
                    //
                    if (data) {
                        $("#SmallNoteAddModal").remove();
                        var d = new smallnote();
                        d.LoadData();
                    } else {
                        alert("失败！");
                    }
                });
            }
            node.modal();
        }

        // 根据实体生成Model节点
        smallnote.prototype.CreateModel = function (data) {

            var node;
            node = $('<div class="modal fade" id="SmallNoteAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
                              '<div class="modal-dialog">' +
                                  '<div class="modal-content">' +
                                      '<div class="modal-header">' +
                                          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
                                          '</button>' +
                                          '<h4 class="modal-title" id="NoteAddModalLabel">' +
                                              'SmallNote弹出框' +
                                          '</h4>' +
                                      '</div>' +

                                      '<div class="modal-body">' +

                                       '<form class="form-horizontal" role="form">' +
                                       '    <input type="hidden" id="NoteId" value="0" />' +
                                       '    <div class="form-group">' +
                                       '        <label for="SmallNoteAddTitle" class="col-sm-2 control-label">Samll Note</label>' +
                                       '        <div class="col-sm-10">' +
                                       '            <input type="text" class="form-control" id="SmallNoteAddTitle" placeholder="Please Input">' +
                                       '        </div>' +
                                       '    </div>' +
                                       '</form>' +

                                       '</div>' +
                                       '<div class="modal-footer">' +
                                           '<button type="button" class="btn btn-default" data-dismiss="modal">' +
                                               '关闭' +
                                           '</button>' +
                                           '<button type="button" id="SmallNoteAddConfirm" class="btn btn-primary">' +
                                               '确认' +
                                           '</button>' +
                                       '</div>' +
                                   '</div>' +
                               '</div> ' +
                            '</div>');

            return node;
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
             
        }
        return smallnote;
    });
