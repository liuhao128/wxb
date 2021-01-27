<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${userInfo.role.name}-${userInfo.name}
                </a>
                <dl class="layui-nav-child">
                    <dd><a id="baseData" >基本资料</a></dd>
                    <dd><a id="setting1" >安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->

        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <iframe name="contentFrame" id="contentFrame" onload="fnFrameLoad()" width="100%" scrolling="no" frameborder="0"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="layui/layui.js"></script>
<script>
    //JavaScript代码区域
    function fnFrameLoad() {
        var ifm= document.getElementById("contentFrame");
        ifm.height=document.documentElement.clientHeight - 121;
    }

    layui.use(['element','layer','jquery'], function(){
        var element = layui.element;
        var layer = layui.layer;
        var $ = layui.jquery;


        $.get("getMenu", function (res) {
            if (res.code != 0) {
                layer.alert(res.msg);
            }else {
                // alert(JSON.stringify(res.data));
                var html = "<ul class=\"layui-nav layui-nav-tree\"  lay-filter=\"test\">";
                $.each(res.data, function (index, obj) {
                    if (index == 1) {
                        html += "<li class=\"layui-nav-item layui-nav-itemed\">";
                    }else {
                        html += "<li class=\"layui-nav-item \">";
                    }
                    html += "<a class=\"\" href=\"javascript:;\">"+obj.name+"</a>";
                    if (obj.childModuleList != null && obj.childModuleList.length > 0){
                        html += "<dl class=\"layui-nav-child\">";
                        $.each(obj.childModuleList, function (index1, obj1) {
                            html += "<dd><a href="+obj1.url+" target=\"contentFrame\">"+obj1.name+"</a></dd>";
                        })
                        html += "</dl>";
                    }
                    html += "</li>"
                })
                html += "</ul>"
                $(".layui-side-scroll").html(html);
                element.render('nav');
            }
        });

        $("#baseData").click(function () {
            var userId = ${userInfo.id};
            // localStorage.setItem("userId",userId);
            layer.open({
                type: 2 //此处以iframe举例
                ,title: '基本资料修改'
                ,area: ['100%','100%']
                ,shade: 0
                ,maxmin: false
                ,content: '/baseData?userId='+userId
                // ,content: '/baseData'
                ,zIndex: layer.zIndex //重点1
                ,success: function(layero){
                    layer.setTop(layero); //重点2
                }
            });
        })

        $("#setting1").click(function () {
            var userId = ${userInfo.id};
            localStorage.setItem("userId",userId);
            layer.open({
                type: 2 //此处以iframe举例
                ,title: '安全设置'
                ,area: ['100%','100%']
                ,shade: 0
                ,maxmin: false
                // ,content: '/setting?userId='+userId
                ,content: '/setting'
                ,zIndex: layer.zIndex //重点1
                ,success: function(layero){
                    layer.setTop(layero); //重点2
                }
            });
        })





    });
</script>
</body>
</html>

<%--    <div class="layui-side layui-bg-black">--%>
<%--        <div class="layui-side-scroll">--%>
<%--            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->--%>
<%--            <ul class="layui-nav layui-nav-tree"  lay-filter="test">--%>
<%--                <li class="layui-nav-item layui-nav-itemed">--%>
<%--                    <a class="" href="javascript:;">所有商品</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="test.html" target="contentFrame">列表一</a></dd>--%>
<%--                        <dd><a href="javascript:;">列表二</a></dd>--%>
<%--                        <dd><a href="javascript:;">列表三</a></dd>--%>
<%--                        <dd><a href="">超链接</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">解决方案</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;">列表一</a></dd>--%>
<%--                        <dd><a href="javascript:;">列表二</a></dd>--%>
<%--                        <dd><a href="">超链接</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item"><a href="">云市场</a></li>--%>
<%--                <li class="layui-nav-item"><a href="">发布商品</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
