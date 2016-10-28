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
            $.get("../LeetCode/GetNextQuestion?" + (new Date()).getMilliseconds(), function (data) {
                //
                console.log(data);
            });
        };

        return { leetcode: leetcode }
    });