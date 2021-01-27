<%--
  Created by IntelliJ IDEA.
  User: 66952
  Date: 2021/1/20
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>角色列表</legend>
</fieldset>

<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
        </colgroup>
        <thead>
        <tr>
            <th>角色编码</th>
            <th>角色名称</th>
            <th>角色描述</th>
            <th>角色排序</th>
            <th>角色类型</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${roleList}" var="role">
            <tr>
                <td>${role.code}</td>
                <td>${role.name}</td>
                <td>${role.desc}</td>
                <td>${role.order}</td>
                <td>
                    <c:choose>
                        <c:when test="${role.type  == 1}">
                            业务角色
                        </c:when>
                        <c:otherwise>
                            管理角色
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <div class="layui-btn-group">
                        <button type="button" class="layui-btn" lay-role="add"><i class="layui-icon"></i>增加</button>
                        <button type="button" class="layui-btn" lay-role="update" data-role="${role.code}"><i class="layui-icon"></i>修改</button>
                        <button type="button" class="layui-btn" lay-role="delete" data-role="${role.code}"><i class="layui-icon"></i>删除</button>
                        <button type="button" class="layui-btn" lay-role="authorize" data-role="${role.code}"><i class="layui-icon"></i>授权</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>



<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['layer','jquery','util','tree'], function(){
        var $ = layui.jquery,
            layer = layui.layer,
            util = layui.util,
            tree = layui.tree;

        //处理属性 为 lay-active 的所有元素事件
        util.event('lay-role', {
            add: function(){
                layer.open({
                    type: 2 //此处以iframe举例
                    ,title: '添加操作'
                    ,area: ['100%','100%']
                    ,shade: 0
                    ,maxmin: false
                    ,content: '/role/addRole'
                    ,zIndex: layer.zIndex //重点1
                    ,success: function(layero){
                        layer.setTop(layero); //重点2
                    }
                });
            }
            ,update: function(){
                var code = $(this).data("role")
                localStorage.setItem("code",code);
                layer.open({
                    type: 2 //此处以iframe举例
                    ,title: '修改操作'
                    ,area: ['100%','100%']
                    ,shade: 0
                    ,maxmin: false
                    ,content: '/role/editRole'
                    ,zIndex: layer.zIndex //重点1
                    ,success: function(layero){
                        layer.setTop(layero); //重点2
                    }
                });
            }
            ,delete: function(){
                var code = $(this).data("role")
                $.ajax({
                    type: "post",
                    url: "/role/deleteOne",
                    data: "code=" + code,
                    success: function (res) {
                        if (res.code == 0) {
                            parent.layer.closeAll();
                            parent.layer.alert(res.msg);
                            window.location.reload();
                        }else {
                            parent.layer.closeAll();
                            parent.layer.alert("删除失败");
                        }
                    }
                });
            }
            ,authorize: function(){
                var code = $(this).data("role"); //得到需要传递的code值
                // localStorage.setItem("code",code);
                var that = this;
                //多窗口模式，层叠置顶
                layer.open({
                    type: 2 //此处以iframe举例
                    ,title: '角色授权'
                    ,area: ['325px', '450px']
                    ,shade: 0.5
                    ,maxmin: false
                    // ,offset: [ //为了演示，随机坐标
                    //     Math.random()*($(window).height()-300)
                    //     ,Math.random()*($(window).width()-390)
                    // ]
                    ,content: '/role/funcTree?code=' + code
                    // ,content: '/role/funcTree'
                    // ,btn: ['继续弹出', '全部关闭'] //只是为了演示
                    // ,yes: function(){
                    //     $(that).click();
                    // }
                    // ,btn2: function(){
                    //     layer.closeAll();
                    // }
                    ,zIndex: layer.zIndex //重点1
                    ,success: function(layero){
                        layer.setTop(layero); //重点2
                    }
                });
            }
        });

    });
</script>
</body>
</html>
