var notify={
    success:function(s){
        layer.closeAll();
        layer.open({
            content: '' +
            '<div style="padding: 7px;background-color: #00a854;color: white;' +
            'min-width: 120px;text-align: center">' +
            '   <i class="layui-icon" >&#xe60b;</i> ' +s+
            '</div>',
            title: false,
            time:3000,
            type:1,
            closeBtn: 0,
            btn:0,
            offset:'20px',
            shade: 0,
            anim:0
        });
    },
    error:function(s){
        layer.closeAll();
        layer.open({
            content: '' +
            '<div style="padding: 7px;background-color: #f04134;color: white;' +
            ';text-align: center">' +
            '   <i class="layui-icon" >&#xe60b;</i> ' +s+
            '</div>',
            title: false,
            time:3000,
            type:1,
            closeBtn: 0,
            btn:0,
            offset:'20px',
            shade: 0,
            anim:0
        });
    },
    warn:function(s){
        layer.closeAll();
        layer.open({
            content: '' +
            '<div style="padding: 7px;background-color: #f5a623;color: white;' +
            ';text-align: center">' +
            '   <i class="layui-icon" >&#xe60b;</i> ' +s+
            '</div>',
            title: false,
            time:3000,
            type:1,
            closeBtn: 0,
            btn:0,
            offset:'20px',
            shade: 0,
            anim:0
        });
    },
    info:function (s) {
        layer.closeAll();
        layer.open({
            content: '' +
            '<div style="padding: 7px;background-color: #1E9FFF;color: white;' +
            ';text-align: center">' +
            '   <i class="layui-icon" >&#xe60b;</i> ' +s+
            '</div>',
            title: false,
            time:3000,
            type:1,
            closeBtn: 0,
            btn:0,
            offset:'20px',
            shade: 0,
            anim:0
        });
    }

}