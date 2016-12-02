
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


        leetcode.prototype.LoadData = function () {
            $.get("/LeetCode/GetNextQuestion?" + (new Date()).getMilliseconds(), function (data) {
                if (data != null) { 
                }
            });
        };

        // 根据实体生成Model节点
        leetcode.prototype.CreateModel = function (id, answer, state) {
            var node;
            if (id == null) {
                return null;
            } else {
                node = $('<ul class="list-group"> '
                        +'<li class="list-group-item ">'
                        +'<button type="submit" class="btn btn-default badge">完成</button> '
                        +'折扣优惠'
                        +'</li>'
                        + '</ul>');
            }
            return node;
        }


    });
