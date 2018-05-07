function bindOutTip(){
    var outTip=$(".out-tip,.app-config-icon");

    outTip.on("mouseover",function(){
        layer.tips($(this).attr("data-tip"), $(this), {
            tips: [3, '#009688'],
            time: 0
        });
    });

    outTip.on("mouseout",function(){
        layer.closeAll('tips');
    })
}

var dayInterval;

function goPage(page){
    clearInterval(dayInterval);
    var inter;
    $.ajax({
        url:page,
        beforeSend:function(){
            NProgress.start();
            inter=setInterval(function(){
                NProgress.inc();
            },200)
        },
        complete:function(){
            clearInterval(inter);
            NProgress.done();
        },
        success:function(data){
            $("#main").html(data);
        },
        error:function(a){
            layer.msg("加载失败",{icon:2})
        }
    })
}

function goPageInContainer(page,container){
    clearInterval(dayInterval);
    var inter;
    $.ajax({
        url:page,
        beforeSend:function(){
            NProgress.start();
            inter=setInterval(function(){
                NProgress.inc();
            },200)
        },
        complete:function(){
            clearInterval(inter);
            NProgress.done();
        },
        success:function(data){
            container.html(data);
        },
        error:function(a){
            layer.msg("加载失败",{icon:2})
        }
    })
}