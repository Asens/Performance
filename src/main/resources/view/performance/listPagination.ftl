[#if fluxPageImpl.totalCount(count,pageable.pageSize)>1]
<input type="hidden" value="${pageable.pageNumber!}" id="pageNo">
<div class="layui-box layui-laypage layui-laypage-default" >
    <a href="javascript:gotoPrePage();" class="layui-laypage-prev prev [#if pageable.pageNumber==1]current[/#if]">
        <i class="layui-icon"></i>
    </a>
    [#if fluxPageImpl.totalCount(count,pageable.pageSize)<6]
        [#list 1..fluxPageImpl.totalCount(count,pageable.pageSize) as index]
            [#if pageable.pageNumber==index]
                <span class="layui-laypage-curr">
                    <em class="layui-laypage-em"></em>
                    <em>${index}</em>
                </span>
            [#else]
                <a href="javascript:gotoPage('${index}');" class="layui-laypage-first">
                ${index}
                </a>
            [/#if]

        [/#list]
    [#else]

        [#if pageable.pageNumber<4]
            [#list 1..5 as index]
                [#if pageable.pageNumber==index]
                    <span class="layui-laypage-curr">
                    <em class="layui-laypage-em"></em>
                    <em>${index}</em>
                </span>
                [#else]
                    <a href="javascript:gotoPage('${index}');" class="layui-laypage-first">
                    ${index}
                    </a>
                [/#if]
            [/#list]
        [#elseif fluxPageImpl.totalCount(count,pageable.pageSize)-pageable.pageNumber<3]
            [#list fluxPageImpl.totalCount(count,pageable.pageSize)-4..fluxPageImpl.totalCount(count,pageable.pageSize) as index]
                [#if pageable.pageNumber==index]
                    <span class="layui-laypage-curr">
                    <em class="layui-laypage-em"></em>
                    <em>${index}</em>
                </span>
                [#else]
                    <a href="javascript:gotoPage('${index}');" class="layui-laypage-first">
                    ${index}
                    </a>
                [/#if]
            [/#list]
        [#else]
            [#list pageable.pageNumber-2..pageable.pageNumber+2 as index]
                [#if pageable.pageNumber==index]
                    <span class="layui-laypage-curr">
                    <em class="layui-laypage-em"></em>
                    <em>${index}</em>
                </span>
                [#else]
                    <a href="javascript:gotoPage('${index}');" class="layui-laypage-first">
                    ${index}
                    </a>
                [/#if]
            [/#list]
        [/#if]
    [/#if]


    <a href="javascript:gotoNextPage();" class="layui-laypage-next">
        <i class="layui-icon"></i>
    </a>
    <span class="layui-laypage-skip">
                <input id="inputPageNo" type="text" value="${pageable.pageNumber}" class="layui-input"> /${count!}页
                <button type="button" class="layui-laypage-btn" onclick="gotoPage($('#inputPageNo').val())">跳转</button>
            </span>
    <span class="layui-laypage-count">共 ${count!} 条</span>
</div>
[/#if]


<script>
    function gotoPage(index) {
        $.ajax({
            method: "get",
            url: "performance/list?pageNo="+index,
            data: $("#viewForm").serialize(),
            success: function (data) {
                $("#main").html(data);
                $('html,body').animate({scrollTop: '0px'}, 0);
            }
        });
    }


    function gotoNextPage() {
        var pageNo = $("#pageNo").val();
        if ($("#next").hasClass("current"))
            return;
        var page=parseInt(pageNo) + 1;
        $.ajax({
            method: "get",
            url: "performance/list?pageNo="+page,
            data: $("#viewForm").serialize(),
            success: function (data) {
                $("#main").html(data);
                $('html,body').animate({scrollTop: '0px'}, 0);
            }
        });

    }

    function gotoPrePage() {
        if ($("#pre").hasClass("current"))
            return;
        var pageNo = $("#pageNo").val();
        var page=parseInt(pageNo) - 1;
        $.ajax({
            method: "get",
            url: "performance/list?pageNo="+page,
            data: $("#viewForm").serialize(),
            success: function (data) {
                $("#main").html(data);
                $('html,body').animate({scrollTop: '0px'}, 0);
            }
        });
    }
</script>