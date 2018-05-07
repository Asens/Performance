<style>


    .form-box {
        width: 160px;
        float: left;
        display: inline-block;
        margin: 10px;
    }
</style>

<div class="layui-row ud">

    <div class="layui-col-md12" style="margin-top: 1px;padding: 1px 0;">
        <blockquote class="layui-elem-quote"
                    style="width:40%;font-size: 1.4rem;background-color: white;
                    color: #009688;border-bottom: 1px solid rgba(12,12,12,.1);
                    border-left: 6px solid #009688;padding: 9px 15px">
            全部性能数据
            <i class="layui-icon out-tip" data-tip="由于接收位置和一些框架限制，
            不能保证处理到全部请求和错误，比如400,404或是Filter中的异常">
                &#xe607;</i>
        </blockquote>
    </div>

    <div class="layui-col-md12">
        <fieldset class="layui-elem-field site-demo-button"
                  style="margin-top: 10px;">
            <legend>筛选</legend>
            <div style="padding: 20px;min-height: 60px;">
                <form class="layui-form" action="/view" id="viewForm">
                    <div class="form-box">
                        <input type="text" name="urlName" placeholder="页面名称"
                               class="layui-input" value="${urlName!}">
                    </div>

                    <div class="form-box">
                        <select name="httpCode">
                            <option value="">状态码</option>
                        [#list httpCodeList as hc]
                            <option value="${hc}"
                                    [#if httpCode??&&httpCode==hc]selected[/#if]>${hc}
                            </option>
                        [/#list]
                        </select>
                    </div>

                    <div class="form-box">
                        <input type="text" name="overTime" placeholder="处理时间大于该值(ms)"
                               class="layui-input" value="${overTime!}">
                    </div>

                    <div class="form-box" style="width: 300px;">
                        <input type="hidden" name="start" id="start" value="${start!}">
                        <input type="hidden" name="end" id="end" value="${end!}">
                        <input class="date-range" id="date-range" size="40" style="width: 260px;"
                               [#if start??&&end??]value="${start!} 至 ${end!}"[/#if]
                               placeholder="选择时间"/>
                    </div>




                    <div class="form-box" style="float: right">

                        <button class="layui-btn" lay-submit lay-filter="viewForm">查询
                        </button>

                    </div>

                </form>
            </div>
        </fieldset>
    </div>

    <div class="layui-col-md12">
        <table class="layui-table">
            <thead>
            <tr>

                <th>
                    页面名称
                </th>
                <th>
                    状态
                </th>
                <th>
                    <span style="cursor: pointer;color: #009688">处理时间(/ms)</span>
                    <span id="sort_login" class="layui-table-sort layui-inline"
                          lay-sort="[#if order??][#if order==0]asc[#elseif order==1]desc[/#if][/#if]">
                        <i class="layui-edge layui-table-sort-asc" data-order="0"></i>
                        <i class="layui-edge layui-table-sort-desc" data-order="1"></i>
                    </span>
                </th>
                <th>
                    <span style="cursor: pointer;color: #009688">DAO层调用次数(/次)</span>
                    <span id="sort_login" class="layui-table-sort layui-inline"
                          lay-sort="[#if order??][#if order==2]asc[#elseif order==3]desc[/#if][/#if]">
                        <i class="layui-edge layui-table-sort-asc" data-order="2"></i>
                        <i class="layui-edge layui-table-sort-desc" data-order="3"></i>
                    </span>
                </th>
                <th>
                    <span style="cursor: pointer;color: #009688">单次最长查询时间(/ms)</span>
                    <span id="sort_login" class="layui-table-sort layui-inline"
                          lay-sort="[#if order??][#if order==4]asc[#elseif order==5]desc[/#if][/#if]">
                        <i class="layui-edge layui-table-sort-asc" data-order="4"></i>
                        <i class="layui-edge layui-table-sort-desc" data-order="5"></i>
                    </span>
                </th>
                <th>
                    <span style="cursor: pointer;color: #009688">时间</span>
                    <span id="sort_login" class="layui-table-sort layui-inline"
                          lay-sort="[#if order??][#if order==6]asc[#elseif order==7]desc[/#if][/#if]">
                        <i class="layui-edge layui-table-sort-asc" data-order="6"></i>
                        <i class="layui-edge layui-table-sort-desc" data-order="7"></i>
                    </span>
                </th>
                <th>
                    操作
                </th>

            </tr>
            </thead>
            <tbody>
            [#list list as performance]
            <tr>
                <td style="max-width: 150px;overflow: hidden;text-overflow: ellipsis;">
                    <a href="${performance.url!}" title="${performance.url!}" target="_blank">
                    [#if performance.urlName??]
                        ${performance.urlName}
                    [#else]
                        ${performance.parsedURL!}
                    [/#if]
                    </a>
                </td>
                <td>
                [#if (performance.httpCode)??&&(performance.httpCode)==500]
                    <span style="color: #d73435;font-weight: 500">错误</span>
                [#elseif (performance.httpCode)??&&(performance.httpCode)==200]
                    <span style="color: #00a854;font-weight: 500">正常</span>
                [#else]
                    ${(performance.httpCode)!}
                [/#if]
                </td>
                <td>
                    [#if (performance.useTime)??&&(performance.useTime)>2000]
                        <span style="color: #d73435;font-weight: 500"> ${performance.useTime!'0'}</span>
                    [#elseif (performance.useTime)??&&(performance.useTime)>1000]
                        <span style="color: #f56a00;">${performance.useTime!'0'}</span>
                    [#elseif (performance.useTime)??&&(performance.useTime)<100]
                        <span style="color: #00a854;font-weight: 500">${performance.useTime!'0'}</span>
                    [#else]
                        ${performance.useTime!'0'}
                    [/#if]


                </td>
                <td>
                [#if (performance.queryCount)??&&(performance.queryCount)>50]
                    <span style="color: #d73435;font-weight: 500"> ${performance.queryCount!}</span>
                [#else]
                    ${performance.queryCount!}
                [/#if]

                </td>
                <td>
                    [#if (performance.maxQueryTime)??&&(performance.maxQueryTime)>500]
                        <span style="color: #d73435;font-weight: 500"> ${performance.maxQueryTime!}</span>
                    [#else]
                    ${performance.maxQueryTime!}
                    [/#if]
                </td>
                <td>
                ${(performance.viewDate?string('yyyy-MM-dd HH:mm:ss'))!}
                </td>

                <td>
                    <a href="javascript:performanceInfo('${performance.id}')"
                       class="layui-btn">
                        详细
                    </a>
                </td>


            </tr>
            [/#list]
            </tbody>
        </table>

    [#include "listPagination.ftl"]
    </div>


    <div style="height: 100px"></div>
</div>

<script>
    $(function(){
        bindOutTip();
    });

    $(function(){
        $('#date-range').dateRangePicker({
            language:'cn',
            separator: ' 至 ',
            //autoClose:true,
            format: 'YYYY-MM-DD HH:mm',
            time: {
                enabled: true
            }
        }).bind('datepicker-change',function(event,obj) {
            var str=obj.value;
            var arr=str.split(" 至 ");
            $("#start").val(arr[0]);
            $("#end").val(arr[1]);
        });
    });

    $(function(){
        var sort_button=$(".layui-table-sort");

        sort_button.prev().on("click",function(){
            if($(this).next().attr("lay-sort")==="asc"){
                $(this).next().find(".layui-table-sort-desc").click();
            }

            else if($(this).next().attr("lay-sort")==="desc"){
                goList('performance/list');
            }

            else if($(this).next().attr("lay-sort")===""){
                $(this).next().find(".layui-table-sort-asc").click();
            }
        });

        sort_button.find(".layui-table-sort-asc").on("click",function(){
            $(this).parent().attr("lay-sort","asc");
            var order=$(this).attr("data-order");
            goList('performance/list?order='+order);
        });

        sort_button.find(".layui-table-sort-desc").on("click",function(){
            $(this).parent().attr("lay-sort","desc");
            var order=$(this).attr("data-order");
            goList('performance/list?order='+order);
        });


    });

    function goList(url){
        $.ajax({
            method: "get",
            url: url,
            data: $("#viewForm").serialize(),
            success: function (data) {
                $("#main").html(data);
                $('html,body').animate({scrollTop: '0px'}, 0);
            }
        });
    }

    layui.use('form', function () {
        var form = layui.form;
        form.render();

        form.on('submit(viewForm)', function(data){
            goList('performance/list');
            return false;
        });

    });

    function performanceInfo(id){
        $.ajax({
            url: "performance/performanceInfo",
            data: {id: id},
            success: function (data) {
                layer.open({
                    area: '50%',
                    btn:0,
                    type:1,
                    shadeClose:true,
                    closeBtn:0,
                    title: false,
                    content: '<div id="userDetail" style="padding: 0 30px">' + data + '</div>'
                })
            }
        })
    }

</script>