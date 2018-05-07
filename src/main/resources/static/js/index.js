
$(function(){
    var barChart=echarts.init(document.getElementById('p1'),'infographic');
    $.ajax({
        url:"todayViewJSON",
        success:function(data){
            barChart.setOption(data);
        }
    });
    dayInterval=setInterval(function(){
        $.ajax({
            url:"todayViewJSON",
            success:function(data){
                barChart.setOption(data);
            }
        });
    },5000)
});

$(function(){
    $.ajax({
        url:"monthViewJSON",
        data:{
            year:$("#year").val(),
            channel:$("#channel").val()
        },
        success:function(data){
            var barChart=echarts.init(document.getElementById('p2'),'infographic');
            barChart.setOption(data);
        }
    });
});

$(function(){
    var barChart=echarts.init(document.getElementById('p3'),'infographic');
    setTimeout(function(){
        $.ajax({
            url:"yearViewCalendarJSON",
            data:{
                year:$("#year").val(),
                channel:$("#channel").val()
            },
            success:function(data){
                barChart.setOption(data);
            }
        });
    },1);
});


$(function(){
    viewCount();
});

setTimeout(function(){
    $.ajax({
        url:"pageView2JSON",
        data:{
            year:$("#year").val(),
            channel:$("#channel").val()
        },
        success:function(data){
            var barChart=echarts.init(document.getElementById('p9'),'infographic');
            barChart.setOption(data);
        }
    });
},1000);

setTimeout(function(){
    $.ajax({
        url:"realOrderPieJSON",
        data:{
            year:$("#year").val(),
            channel:$("#channel").val()
        },
        success:function(data){
            var barChart=echarts.init(document.getElementById('p11'));
            barChart.setOption(data);
        }
    });

    $.ajax({
        url:"weixinPieJSON",
        data:{
            year:$("#year").val(),
            channel:$("#channel").val()
        },
        success:function(data){
            var barChart=echarts.init(document.getElementById('p12'));
            barChart.setOption(data);
        }
    });

    $.ajax({
        url:"itemPieJSON",
        data:{
            year:$("#year").val(),
            channel:$("#channel").val()
        },
        success:function(data){
            var barChart=echarts.init(document.getElementById('p13'));
            barChart.setOption(data);
        }
    });
},200);

setTimeout(function(){
    $.ajax({
        url:"mapJSON",
        data:{
            year:$("#year").val(),
            channel:$("#channel").val()
        },
        success:function(data){
            var barChart=echarts.init(document.getElementById('p14'));
            barChart.setOption(data);
        }
    });
},1000);


function viewCount(){
    $.ajax({
        url:"viewInYearJSON",
        data:{
            year:$("#year").val(),
            channel:$("#channel").val()
        },
        success:function(data){
            var barChart=echarts.init(document.getElementById('p6'),'infographic');
            barChart.setOption(data);

            barChart.on('click', function (params) {
                echarts.dispose(document.getElementById('p6'));
                var month=params.name.replace('月','');
                $.ajax({
                    url:"viewInMonthJSON",
                    data:{
                        month:month,
                        year:$("#year").val(),
                        channel:$("#channel").val()
                    },
                    success:function(data){
                        var monthChart=echarts.init(document.getElementById('p6'),'infographic');
                        monthChart.setOption(data);
                    }
                });
            });
        }
    });
}