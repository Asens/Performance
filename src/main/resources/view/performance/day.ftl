<style>
    .report p{
        line-height: 24px;
        font-size: 16px;
        margin-bottom: 9px;
    }
</style>

<div class="layui-row">

    <div class="layui-row" style="background-color: white;padding: 12px 20px">
        <div class="layui-col-md12" style="margin-top: 1px;padding: 1px 0;">
            <blockquote class="layui-elem-quote"
                        style="width:40%;font-size: 1.4rem;background-color: white;
                        color: #009688;border-bottom: 1px solid rgba(12,12,12,.1);
                        border-left: 6px solid #009688;padding: 9px 15px;
                        display: inline-block;">
                性能分析报告
            </blockquote>

            <div style="float: right;display: inline-block;margin-right: 10px;">
                <input class="date-range" id="date-range" size="40"
                       value="" placeholder="选择时间"/>
            </div>
            <div style="float: right;display: inline-block;margin-right: 10px;">
                <a class="layui-btn layui-btn-primary">今天</a>
                <a class="layui-btn layui-btn-primary">昨天</a>
            </div>

            <div style="float: right;display: inline-block;margin-right: 20px;">
                <a class="layui-btn layui-btn-primary"
                   style="color: #009688;border: none">邮件列表</a>
            </div>
        </div>
    </div>

    <div class="layui-col-md12" style="padding: 15px  12%">
        <div class="layui-row ud" style="padding: 45px">
            <div class="layui-col-md12" style="text-align: center">
                <p style="font-size: 22px;font-weight: 600">
                    2018年4月9日  ${app.name} 性能报告
                </p>
            </div>

            <div class="layui-col-md12 m-t-40 report">
                <p> ​共处理请求${total!'0'}个，其中出现错误的请求${error!'0'}个，
                    处理时间较慢（大于5s）请求${slow!'0'}个</p>

                <p>   请求的平均处理时间</p>

                <div class="inside" style="padding: 20px">
                    <i class="layui-icon out-tip inbox"
                       data-tip="所有用户的地域分布,统计用户信息中用户所在的省">
                        &#xe607;
                    </i>
                    <div id="urls" style="width: 100% ;height: 670px;"></div>
                </div>

                <p>   最慢的处理请求</p>

                <p>   调用Dao层超过50次的请求有${most!'0'}个，需酌情处理</p>

                <p>   详情选择上方筛选查询</p>

            </div>
        </div>
    </div>



    <div style="height: 100px"></div>
</div>
