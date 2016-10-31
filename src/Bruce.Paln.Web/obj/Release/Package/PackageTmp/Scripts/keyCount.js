require.config({
    baseUrl: '',
    paths: {
        DateExtend: '../Scripts/DateExtend',
        echarts: '../Scripts/charts/echarts.min'
    }
});
define(['DateExtend', 'echarts'],
    function (DateExtend, echarts) {
        var keyCount = function () {
            $.get("../KeyCount/GetLastSevenDaysData?" + (new Date()).getMilliseconds(),
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
                        xAxisData.unshift(new Date(data[i]["Day"]).getCnWeek());
                        showData.unshift(data[i]["KCount"]);
                    }

                    var option = {
                        title: {
                            text: '最近七天数据统计'
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


            var openKeyCount = document.getElementById("openKeyCount");
            console.log(openKeyCount);
            openKeyCount.addEventListener('click',
                function (e) {
                    var table = document.getElementById('keyCount');
                    if (table.style.display == "block") {
                        table.style.display = "none";
                    } else {
                        table.style.display = "block";
                    }
                })
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
        return keyCount;
    });