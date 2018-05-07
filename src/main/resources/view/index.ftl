<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>性能分析</title>
    <script type="text/javascript" src="${res!}/jquery/jquery-2.2.3.min.js"></script>
    <link rel="stylesheet" href="${res!}/layui/css/layui.css"  media="all">
    <link href='${res!}/third/nprogress/nprogress.css' rel='stylesheet' />
    <link href='${res!}/js/web.css' rel='stylesheet' />

    <script type="text/javascript" src="${res!}/third/echarts4.min.js"></script>
    <script type="text/javascript" src="${res!}/third/china.js"></script>
    <script type="text/javascript" src="${res!}/third/infographic.js"></script>
    <script type="text/javascript" src="${res!}/third/macarons.js"></script>
    <script type="text/javascript" src="${res!}/layer/layer.js"></script>
    <script type="text/javascript" src="${res!}/third/nprogress/nprogress.js"></script>
    <script src="${res!}/js/web.js" charset="utf-8"></script>
    <script type="text/javascript" src="${res!}/jquery/notify.js"></script>

    <link rel="stylesheet" href="${res!}/third/daterangepicker/daterangepicker.min.css">
    <script type="text/javascript" src="${res!}/third/daterangepicker/moment.min.js"></script>
    <script type="text/javascript" src="${res!}/third/daterangepicker/jquery.daterangepicker.min.js"></script>

</head>
<body class="layui-layout-body" style="background-color: #f2f2f2">
<div class="layui-layout layui-layout-admin">

    <div class="layui-side layui-bg-black" >

        <div class="layui-side-scroll">
            <div class="logo" >
                <div class="logo layui-anim" style="margin-left: 10%;;padding: 30px 0;width: 200px">
                    <img src="${res!}/images/logo2.png" style="width: 150px">
                </div>
            </div>


            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item">
                    <a href="${res!}/config">${(app.name)!'配置'}</a>
                </li>

                <li class="layui-nav-item layui-this">
                    <a href="javascript:goPage('performance/list');">性能数据</a>

                </li>

                <li class="layui-nav-item">
                    <a href="javascript:goPage('performance/day');">性能报告</a>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body" >
        <div id="main">

        </div>
        <div style="height: 50px"></div>
    </div>

</div>
<script src="${res!}/layui/layui.js" charset="utf-8"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

    $(function(){
        goPage("performance/list");
    });


</script>
</body>
</html>