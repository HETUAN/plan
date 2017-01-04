require.config({
    baseUrl: '',
    paths: {
        jquery: '../Scripts/jquery-2.1.1.min',
        DateExtend: '../Scripts/DateExtend',
    }
});
define(['jquery', 'DateExtend'],
    function ($, DateExtend) {
        var leetcode = function () { }

        leetcode.prototype.LoadData = function () {
            $.get("/LeetCode/GetNextQuestion?" + (new Date()).getMilliseconds(), function (data) {
                if (data != null) {
                    var node = $("#leetCode");
                    node.attr("data-original-title", "第" + data.QuestionId + "题");
                    node.attr("title", "第" + data.QuestionId + "题");
                    var content = "<p>" + data.QuestionTitle + "</p>";
                    content += "<p><a target='_blank' href='https://leetcode.com/problems/" + data.QuestionTitleSlug + "/'>原题地址</a></p>";
                    content += "<p><a target='_blank' href='http://www.jiuzhang.com/solutions/" + data.QuestionTitleSlug + "/'>答案地址</a></p>";
                    content += "<p><a target='_blank' href='http://www.lintcode.com/zh-cn/problem/" + data.QuestionTitleSlug + "/'>中文参考</a></p>";
                    content += "<p><a href='javascript:;' id='submitanswer'>提交答案</a></p>";
                    node.attr("data-content", content);
                    node.popover({ html: true });
                    node.on('shown.bs.popover', function () {
                        console.log($("#submitanswer"));
                        $("#submitanswer")[0].onclick = function () {
                            (new leetcode()).Answer(data.QuestionId);
                            $("#leetCode").popover('hide');
                        }
                    });
                }
            });
        };

        // 根据实体生成Model节点
        leetcode.prototype.CreateModel = function (id, answer, state) {
            var node;
            if (id == null) {
                return null;
            } else {
                node = $('<div class="modal fade" id="leetCodeAnswerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
                                  '<div class="modal-dialog">' +
                                      '<div class="modal-content">' +
                                          '<div class="modal-header">' +
                                              '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×' +
                                              '</button>' +
                                              '<h4 class="modal-title" id="NoteAddModalLabel">' +
                                                  'LeetCode弹出框' +
                                              '</h4>' +
                                          '</div>' +

                                          '<div class="modal-body">' +
                                           '<form class="form-horizontal" role="form">' +
                                           '    <input type="hidden" id="Qid" value="' + id + '" />' +
                                           '    <div class="form-group">' +
                                           '        <label for="leetCodeIsNext" class="col-sm-2 control-label"></label>' +
                                           '        <div class="col-sm-10">' +
                                           '            <input type="checkbox"  id="leetCodeIsNext" ' + (state == 1 ? "checked" : "") + '">是否显示下一题' +
                                           '        </div>' +
                                           '    </div>' +
                                           '    <div class="form-group">' +
                                           '        <label for="leetCodeAnswer" class="col-sm-2 control-label">答案</label>' +
                                           '        <div class="col-sm-10">' +
                                           '            <textarea class="form-control" id="leetCodeAnswer" rows="9"> ' + answer + '</textarea>' +
                                           '        </div>' +
                                           '    </div>' +
                                           '</form>' +
                                           '</div>' +
                                           '<div class="modal-footer">' +
                                               '<button type="button" class="btn btn-default" data-dismiss="modal">' +
                                                   '关闭' +
                                               '</button>' +
                                               '<button type="button" id="leetCodeAnswerConfirm" class="btn btn-primary">' +
                                                   '确认' +
                                               '</button>' +
                                           '</div>' +
                                       '</div>' +
                                   '</div> ' +
                                '</div>');
            }
            return node;
        }

        leetcode.prototype.SubmiutAnswer = function () {
            //
        }

        //添加Note
        leetcode.prototype.Answer = function (qid) {
            var node = (new leetcode()).CreateModel(qid, "", true);
            $("body").append(node);
            $("#leetCodeAnswerConfirm")[0].onclick = function () {
                var param = {};
                param.questionId = $("#Qid").val();
                param.answer = $("#leetCodeAnswer").val().trim();
                //param.Note = $("#leetCodeIsNext").val().trim(); 
                if (param.questionId == "") {
                    alert("请刷新重试！");
                    return;
                }
                if (param.answer == "") {
                    alert("内容为空");
                    return;
                }
                var url = "/LeetCode/AddAnswer";
                $.post(url, param, function (data) {
                    if (data.result) {
                        $("#leetCodeAnswerModal").remove();
                        (new leetcode()).LoadData();
                    } else {
                        alert("失败！");
                    }
                });
            }
            node.modal();
        }

        return leetcode;
    });