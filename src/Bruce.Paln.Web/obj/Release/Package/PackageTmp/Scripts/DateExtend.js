define([], function () {

    // 对当前日期的年进行增加或减少
    Date.prototype.AddYear = function (year) {
        var curYear = this.getFullYear();
        if (year == null)
            return
        else
            this.setFullYear(curYear + year)
        return this;
    }

    // 对当前日期的月进行增加或减少
    Date.prototype.AddMonth = function (month) {
        var curYear = this.getFullYear();
        var curMonth = this.getMonth() + 1;
        if (month + curMonth > 12) {
            var year = parseInt((month + curMonth) / 12);
            month = (month + curMonth) % 12 - 1;
            this.setFullYear(curYear + year);
            this.setMonth(month);
        } else {
            month = month + curMonth - 1;
            this.setMonth(month);
        }
        return this;
    }

    // 对当前日期的日进行增加或减少
    Date.prototype.AddDay = function (day) {
        var Milliseconds = 1000 * 60 * 60 * 24 * day;
        var curMilliseconds = this.getTime();
        this.setTime(curMilliseconds + Milliseconds);
    }

    // 对当前日期的小时进行增加或减少
    Date.prototype.AddHour = function (hour) {
        var Milliseconds = 1000 * 60 * 60 * hour;
        var curMilliseconds = this.getTime();
        this.setTime(curMilliseconds + Milliseconds);
        return this;
    }

    // 对当前日期的分钟进行增加或减少
    Date.prototype.AddMinute = function (minute) {
        var Milliseconds = 1000 * 60 * minute;
        var curMilliseconds = this.getTime();
        this.setTime(curMilliseconds + Milliseconds);
        return this;
    }

    // 对当前日期的秒进行增加或减少
    Date.prototype.AddSeconds = function (seconds) {
        var Milliseconds = 1000 * seconds;
        var curMilliseconds = this.getTime();
        this.setTime(curMilliseconds + Milliseconds);
        return this;
    }

    // 对当前日期的豪秒进行增加或减少
    Date.prototype.AddMilliseconds = function (Milliseconds) {
        var curMilliseconds = this.getTime();
        this.setTime(curMilliseconds + Milliseconds);
        return this;
    }

    //当前日期与另一个日期进行比较 返回值>0则日期较大=0相等或者出现错误
    Date.prototype.Compare = function (date) {
        var result = 0;
        if (typeof (date) == "object") {
            result = this.getTime() - date.getTime();
        } else if (date == null || date == "") {
            result = 0;
        } else {
            var d = new Date(date);
            result = this.getTime() - d.getTime();
        }
        return result;
    }

    //将两个时间相减返回毫秒数
    Date.prototype.SubToMilliseconds = function (date) {
        return this.getTime() - date.getTime();
    }

    //返回一个新的时间对象
    Date.prototype.Copy = function () {
        var d = new Date(this.Formate("yyyy-MM-dd hh:mm:ss.S"));
        return d;
    }

    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
    // 例子： 
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
    Date.prototype.Formate = function (fmt) {
        //
        var o = {
            "M+": this.getMonth() + 1, //月份 
            "d+": this.getDate(), //日 
            "h+": this.getHours(), //小时 
            "m+": this.getMinutes(), //分 
            "s+": this.getSeconds(), //秒 
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
            "S": this.getMilliseconds() //毫秒 
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    var TransferJsonTime = function (Time) {
        return eval(Time.replace(/\/Date\((\d+)\)\//gi, "new Date($1)"))
    }
    //return an object to define the "my/shirt" module.
    return {
        Date: Date,
        TransferJsonTime: TransferJsonTime
    }
}
);



