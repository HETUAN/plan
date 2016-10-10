require.config({
    baseUrl: '',
    paths: {
        jquery: '../Scripts/jquery-2.1.1.min',
        DateExtend: '../Scripts/DateExtend',
    }
});
define(['jquery', 'DateExtend'], function ($, DateExtend) {
    var Remind = function () { this.RemindList = []; }
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
                this.Run(msg, runtime);
            }

            if (HappenTime.AddMinute(item.UseTime).Compare(curdate) > 0) {
                //结束时间在当前时间之前。
                var runtime = HappenTime.SubToMilliseconds(curdate);
                var msg = item.Tag + " --> 任务结束";
                this.Run(msg, runtime);
            }
        }
        console.log(this.RemindList);
    }

    Remind.prototype.ClearTimeOut = function () {
        var idx = 0;
        var len = this.RemindList.length;
        for (; idx < len; idx++) {
            var r = this.RemindList.pop();
            clearTimeout(r);
        }
    }

    Remind.prototype.Run = function (msg, milliseconds) {
        //播放音乐
        var r = setTimeout(function () { var r = new Remind(); r.PlayMusic(msg); }, milliseconds);
        this.RemindList.push(r);
    }

    Remind.prototype.PlayMusic = function (msg) {
        //
        var audio = document.createElement("audio");
        audio.src = "../Scripts/ring.mp3";
        audio.play();
        setTimeout(function () { alert(msg); }, 500);
    }

    return { Remind: Remind }
});