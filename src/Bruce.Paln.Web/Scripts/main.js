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
        Remind: '../Scripts/remind',
        Plan: '../Scripts/plan',
        Weather: '../Scripts/weather',
        KeyCount: '../Scripts/KeyCount',
        LeetCode: '../Scripts/leetcode',
        SmallNote: '../Scripts/smallnote'
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

define(['jquery', 'DateExtend', 'bootstrap', 'moment', 'datetimepicker', 'User', 'Daily', 'Note', 'Remind', 'Plan', 'Weather', 'KeyCount', 'LeetCode', 'SmallNote'], function (jQuery, DateExtend, bootstrap, moment, datetimepicker, User, Daily, Note, Remind, Plan, Weather, KeyCount, leetcode,smallnote) {
    //console.log($);
    var $ = jQuery;

    var p = new Plan.planVM();
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
    var w = new Weather.Weather();
    $(function () {
        w.Init(id);
    });

    var note = new Note.Note();
    note.CreateLatestNote();

    KeyCount();
    (new leetcode()).LoadData();
    (new smallnote()).Init();
    
    //var remind = new Remind.Remind();
    //remind.Run();
    //var userVM = function () { }
    //userVM.prototype.LoadData = function () {
    //    $.get("/User/GetData", function (data) {
    //        if (data != null)
    //        {
    //            $("UserName").text("你好："+data.Name);
    //        }
    //    })
    //}
    //console.log($(":radio").val());
    //console.log($("input[name='showModel']").val());
});