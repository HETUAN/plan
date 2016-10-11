require.config({
    baseUrl: '',
    paths: {
        jquery: '../Scripts/jquery-2.1.1.min',
        DateExtend: '../Scripts/DateExtend',
        Plan: '../Scripts/plan',
    }
});
define(['jquery', 'DateExtend', 'Plan'], function ($, DateExtend, Plan) {
    var Remind = function () {
        this.Interval = null;
        this.RemindList = [];
        this.audio = document.createElement("audio");
        this.audio.src = "../Scripts/ring.mp3";
    }
    Remind.prototype.StartRemind = function (plan) {
        //此处应该使用将数据处理成提醒的时间点和信息的数组，然后每隔x毫秒遍历一遍看是否有到达时间的项，有则响铃并将数据移除。
        this.ClearTimeOut();
        if (plan == null) return;
        var idx = 0;
        var len = plan.length;
        for (; idx < len; idx++) {
            //[{"Id":26,"UserId":12,"Importance":1,"Tag":"测试声音","Detail":"测试声音","IsRemind":1,"PerRemind":1,"perRemindTime":10,"HappenTime":"\/Date(1476011400000)\/","UseTime":30,"HappenYear":2016,"HappenMonth":10,"HappenDay":9,"HappenHour":19,"HappenMinute":10,"CreateTime":"\/Date(1476011379857)\/","UpdateTime":"\/Date(1476011379857)\/","Result":0,"Summary":null}]
            var item = plan[idx];
            var HappenTime = DateExtend.TransferJsonTime(item.HappenTime);
            var curdate = new Date();
            if (HappenTime.Compare(curdate) > 0) {
                //开始时间在当前时间之前。
                var runtime = HappenTime.SubToMilliseconds(curdate);
                var msg = item.Tag + " --> 任务开始";
                var m = { type: "start", time: HappenTime.Copy(), msg: msg };
                this.RemindList.push(m);
                //this.Run(msg, runtime, callback);
            }

            if (HappenTime.AddMinute(item.UseTime).Compare(curdate) > 0) {
                //结束时间在当前时间之前。
                var runtime = HappenTime.SubToMilliseconds(curdate);
                var msg = item.Tag + " --> 任务结束";
                var m = { type: "stop", time: HappenTime.Copy(), msg: msg };
                this.RemindList.push(m);
                //this.Run(msg, runtime, callback);
            }
            //console.log(this.RemindList);
        }
        //console.log(this.RemindList);
        //console.log("-------------------");
        this.Run();
    }

    Remind.prototype.ClearTimeOut = function () {
        var idx = 0;
        var len = this.RemindList.length;
        for (; idx < len; idx++) {
            var r = this.RemindList.pop();
            clearTimeout(r);
        }
    }

    Remind.prototype.Run = function (msg, milliseconds, callback) {
        //播放音乐
        clearInterval(this.Interval);
        this.Interval = setInterval(function () {
            //console.log(arguments);
            var list = arguments[0];
            var i = 0;
            for (i in list) {
                //console.log(list[i]);
                var curdate = new Date();
                if (list[i].time.Compare(curdate) < 0) {
                    var r = new Remind();
                    r.PlayMusic(list[i].msg);
                    list.splice(i, 1);
                    if (Plan == null)
                    {
                        Plan = require("Plan");
                    }
                    var p = new Plan.planVM();
                    p.ReloadData();
                    break;
                }
            }
            //console.log(Plan);
            //console.log(list);
        }, 500, this.RemindList);
        
        //console.log(callback);
        //var r = setTimeout(function () { var r = new Remind(); r.PlayMusic(msg, callback); }, milliseconds);
        //this.RemindList.push(r);
    }

    Remind.prototype.PlayMusic = function (msg) {
        //
        //console.log("Play Music!");
        this.audio.play();
        setTimeout(function () { new Remind().Alert(msg); }, 1000);
    }

    Remind.prototype.Alert = function (msg) {
        alert(msg);
    }

    Remind.prototype.Recycle = function () {
        var list = arguments[0];
        var i = 0;
        for (i in list) {
            //console.log(list[i]);
            var curdate = new Date();
            if (list[i].time.Compare(curdate) > 0) {
                var r = new Remind();
                r.PlayMusic(list[i].msg);
                //var p = new require("plan").PlanVM();
                //p.ReloadData();
                console.log(list[i].msg);
                var p = new Plan.PlanVM();
                p.ReloadData();
                break;
            }
        }
        console.log("---");
        list.splice(i, 1);
    }
    return { Remind: Remind }
});