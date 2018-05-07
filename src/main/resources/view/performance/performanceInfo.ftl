<div class="layui-row" style="padding: 30px">

[#if queryMessages??]

    <fieldset class="layui-elem-field layui-field-title site-title">
        <legend><a name="attr" style="font-size: 18px">Dao层调用信息</a></legend>
    </fieldset>
    <table class="layui-table" lay-even lay-skin="nob">
        <thead>
        <tr>

            <th>
                类-函数名称
            </th>
            <th>
                调用次数
            </th>
            <th>
                处理时间
            </th>

        </tr>
        </thead>
        <tbody>
            [#list countMap as query,count]
            <tr>
                <td>
                ${query!}
                </td>
                <td>
                    [#if count??&&count>10]
                        <span style="color: #f04134">${count}</span>
                    [#else]
                    ${count}
                    [/#if]
                </td>
                <td>
                    [#if (timeMap[query])??&&(timeMap[query])>600]
                        <span style="color: #d73435;font-weight: 600">${timeMap[query]}ms</span>
                    [#elseif (timeMap[query])??&&(timeMap[query])>200]
                        <span style="color: #d73435">${timeMap[query]}ms</span>
                    [#elseif (timeMap[query])??&&(timeMap[query])>100]
                        <span style="color: #f56a00">${timeMap[query]}ms</span>
                    [#elseif (timeMap[query])??&&(timeMap[query])<20]
                        <span style="color: #00a854">${timeMap[query]}ms</span>
                    [#else]
                    ${timeMap[query]}ms
                    [/#if]

                </td>
            </tr>
            [/#list]
        </tbody>
    </table>
[/#if]

    <div class="layui-col-md12 m-t-20">
    [#if errorLog??]
        <fieldset class="layui-elem-field layui-field-title site-title">
            <legend><a name="attr" style="font-size: 18px">错误信息</a></legend>
        </fieldset>
        <blockquote class="layui-elem-quote layui-quote-nm" style="color: #f04134;
        font-weight: 600">
        ${message!}
        </blockquote>


        <fieldset class="layui-elem-field layui-field-title site-title">
            <legend><a name="attr" style="font-size: 18px">错误原因</a></legend>
        </fieldset>
        <blockquote class="layui-elem-quote layui-quote-nm" style="color: #f04134;
        font-weight: 600">
        ${cause!}
        </blockquote>


        [#if stackMessageList??]
            <fieldset class="layui-elem-field layui-field-title site-title">
                <legend><a name="attr" style="font-size: 18px">调用栈</a></legend>
            </fieldset>
            [#list stackMessageList as stack]
                <blockquote class="layui-elem-quote layui-quote-nm"
                            style="padding: 8px;color: #f04134;border-color: #f04134;">
                ${stack!}
                </blockquote>
            [/#list]

        [/#if]

    [/#if]
    </div>


    <div class="layui-col-md12 m-t-20">
    <p style="color: #999;">
        *注：为了传输和存储效率，对Dao层的调用信息做了简化和截断处理，对错误栈做了过滤处理
    </p>
    </div>
</div>