require.config({
    baseUrl: '',
    paths: {
        jquery: '../Scripts/jquery-2.1.1.min',
        DateExtend: '../Scripts/DateExtend',
        echarts: '../Scripts/charts/echarts.min'
    }
});
define(['jquery', 'DateExtend', 'echarts'],
    function (jquery, DateExtend, echarts) {
        var $ = jquery;
        var keyCount = function () {
            $.get("../KeyCount/GetData?sday=" + new Date().AddMonth(-1).Formate('yyyy-MM-dd') + "&eday=" + (new Date).Formate('yyyy-MM-dd'),
                function (data) {
                    // 
                    //console.log(data);
                    var table = document.getElementById('keyCount');
                    var chart = echarts.init(table,
                        null,
                        {
                            renderer: 'canvas'
                        });
                    var xAxisData = [];
                    var showData = [];
                    for (var i = 0; i < data.length; i++) {
                        xAxisData.unshift(new Date(data[i]["Day"]).Formate('yyyy-MM-dd'));
                        showData.unshift(data[i]["KCount"]);
                    }

                    var option = {
                        title: {
                            text: '最近数据统计'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['数据']
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                magicType: { type: ['line', 'bar'] }
                            }
                        },
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: xAxisData
                        },
                        yAxis: {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value} 次'
                            }
                        },
                        series: [
                            {
                                name: '敲击次数',
                                type: 'line',
                                data: showData,
                                markPoint: {
                                    data: [
                                        { type: 'max', name: '最大值' },
                                        { type: 'min', name: '最小值' }
                                    ]
                                },
                                markLine: {
                                    data: [
                                        { type: 'average', name: '平均值' }
                                    ]
                                }
                            }
                        ]
                    };

                    //
                    chart.setOption(option);
                });
        }
        /*
        var keyCount = function () { }
        keyCount.prototype.LoadData = function () {
            $.get("../KeyCount/GetLastSevenDaysData?" + (new Date()).getMilliseconds(), function (data) {
                //
                console.log(data);
            });
        };
        return keyCount;
         */
        keyCount();
        return keyCount;
    });