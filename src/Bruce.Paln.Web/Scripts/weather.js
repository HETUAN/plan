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
    Weather.prototype.ip = "";
    Weather.prototype.id = "";
    Weather.prototype.addr = "";

    // 显示天气
    Weather.Show = function () {
        //
    }
    $(function () {

    });
    Weather.prototype.Init = function (id) {
        if (this.id != null)
            this.id = id;
        this.LoadWeather();
    }

    Weather.prototype.LoadWeather = function () {
        var url = "http://weather.123.duba.net/static/weather_info/" + this.id + ".html";
        //url = "http://www.weather.com.cn/data/sk/" + this.id + ".html"; 
        this.RequestData(url, this.ShowWeather);
    }

    Weather.prototype.RequestData = function (url, cb) {
        $.ajax({
            type: "get",
            async: false,
            url: url,
            dataType: "jsonp",
            jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
            jsonpCallback: "weather_callback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
            success: function (json) {
                console.log(json);
                cb(json);
            },
            error: function () {
                alert('fail');
            }
        });
    }

    Weather.prototype.ShowWeather = function (w) {
        var data = w.weatherinfo;
        var intro = data.city + " " + data.weather1 + " " + data.temp1 + " " + data['pm-level'];
        var instroNode = $("#weatherinstr");
        var imgNode = $("#weatherpic");
        //console.log(instroNode);
        //console.log(instroNode.first().text());
        //console.log(imgNode);
        //console.log(imgNode.first().attr("src"));
        instroNode.html("&nbsp;&nbsp;&nbsp;" + intro);
        imgNode.attr("src", "http://www.duba.com/static/v2/images/weather/a/a" + data.st1 + ".png");



        $("#weather").onclick = function () {
            //$("#hidenweather").show();
        };
       
        
      
    }


    return { Weather: Weather };
});