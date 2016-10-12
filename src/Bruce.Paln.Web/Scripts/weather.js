require.config({
    baseUrl: '',
    paths: {
        jquery: '../Scripts/jquery-2.1.1.min',
        DateExtend: '../Scripts/DateExtend',
    }
});
define(['jquery', 'DateExtend'], function ($, DateExtend) {
    var Weather = function () { }
    Weather.prototype.Node = null;

    // 显示天气
    Weather.Show = function () {
        //
    }

    Weather.prototype.Init = function () {
        //
    }

});