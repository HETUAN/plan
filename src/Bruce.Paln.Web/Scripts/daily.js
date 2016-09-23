define([], function () {
    var Daily = function () { }
    Daily.DailyList = function () {
        //
        $.get("/Daily/GetList", function (data) {
            var content = "";
            if (data == null) {
                content = "没有数据";
            } else {
                content += '<div class="row">';
                content += '   <div class="col-md-6">';
                content += '      <!--   Kitchen Sink -->';
                content += '        <div class="panel panel-default">';
                content += '            <div class="panel-heading';
                content += '                Kitchen Sink';
                content += '            </div>';
                content += '            <div class="panel-body">';
                content += '                <div class="table-responsive">';
                content += '                    <table class="table table-striped table-bordered table-hover">';
                content += '                        <thead>';
                content += '                            <tr>';
                content += '                                <th>编号</th>';
                content += '                                <th>标题</th>';
                content += '                                <th>时间</th>';
                content += '                            </tr>';
                content += '                        </thead>';
                content += '                        <tbody>';

                for (var i = 0; i < data.length; i++) {
                    content += '                            <tr>';
                    content += '                                <td>' + data[i].Id + '</td>';
                    content += '                                <td>' + data[i].Title + '</td>';
                    content += '                                <td>' + data[i].DailyDate + '</td>';
                    content += '                            </tr>';
                }
                content += '                        </tbody>';
                content += '                    </table>';
                content += '                </div>';
                content += '            </div>';
                content += '        </div>';
                content += '         <!-- End  Kitchen Sink -->';
                content += '    </div>';
                content += '</div>';
            }
        })
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
                   content +
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
        model.model("show");

    }

    return { Daily: Daily };
});