<%--
  Created by IntelliJ IDEA.
  User: 66952
  Date: 2021/1/20
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>开启复选框</legend>
    </fieldset>
    <div id="funcTreeDiv" class="demo-tree"></div>

    <div style="margin: 30px; ">
        <button type="button" class="layui-btn" lay-active="btnSubmit">确定</button>
        <button type="button" class="layui-btn layui-btn-primary" lay-active="btnCancel">取消</button>
    </div>

<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['tree', 'util', 'layer', 'jquery'], function(){
        var tree = layui.tree
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.jquery;

        // var code = localStorage.getItem("code");
            var code = location.search.substr(6);
            //alert(code);
        $.get("/role/getTree",{roleId:code},function (res) {
            if (res.code == 0) {
                //开启复选框
                tree.render({
                    elem: '#funcTreeDiv'
                    ,data: res.data
                    ,showCheckbox: true
                    ,id: 'funcTree'
                });
            }else {
                layer.alert(res.msg);
            }
        });

        //处理属性 为 lay-active 的所有元素事件
        util.event('lay-active', {
            btnSubmit: function (othis) {
                var checkedData = tree.getChecked('funcTree'); //获取选中节点的数据
                var moduleIds = [];
                $.each(checkedData, function (index, obj) {
                    moduleIds.push(obj.id);
                    if (obj.children != null || obj.children.length > 0) {
                        $.each(obj.children, function (index1, obj1) {
                            moduleIds.push(obj1.id);
                        })
                    }
                })
                var moduleVO = {roleId: code, moduleIds: moduleIds};
                // layer.alert(JSON.stringify(moduleVO), {shade: 0});
                // console.log(moduleVO);
                $.ajax({
                    type: "post",
                    url: "/role/updateAuth",
                    contentType: "application/json",
                    data: JSON.stringify(moduleVO),
                    success: function (res) {
                        console.log(res);
                        if (res.code == 0) {
                            parent.layer.closeAll();
                            parent.layer.alert(res.msg);
                        }else {
                            parent.layer.closeAll();
                            parent.layer.alert("授权失败");
                        }
                    }
                });
            }
            ,btnCancel: function () {
                parent.layer.closeAll();
            }
        });
    });
</script>
</body>
</html>
