<%--
  Created by IntelliJ IDEA.
  User: 66952
  Date: 2021/1/21
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改基本资料</title>
    <base href="${pageContext.request.contextPath}/">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>修改基本资料</legend>
</fieldset>

<form class="layui-form" action="" lay-filter="roleValue">
<%--    <div class="layui-form-item">--%>
<%--        <label class="layui-form-label">用户编号</label>--%>
<%--        <div class="layui-input-block">--%>
<%--            <input type="hidden" name="userId" lay-verify="required" lay-reqtext="用户编号是必填项，不能为空鸭" autocomplete="off" placeholder="请输入角色编码" class="layui-input">--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="hidden" name="userId"  autocomplete="off"  class="layui-input">
            <input type="radio" name="sex" value="0" title="男" checked="">
            <input type="radio" name="sex" value="1" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>
        <div class="layui-input-block">
            <input type="text" name="nickName"  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱地址</label>
        <div class="layui-input-block">
            <input type="text" name="email"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">QQ号码</label>
        <div class="layui-input-block">
            <input type="text" name="qqNum"  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号码</label>
        <div class="layui-input-block">
            <input type="text" name="telephone"  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账号登录次数</label>
        <div class="layui-input-block">
            <input type="text" name="loginNum"  autocomplete="off"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">提交</button>
            <button type="button" class="layui-btn layui-btn-primary" lay-active="btnCancel">取消</button>
        </div>
    </div>

</form>

<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form','util','jquery' ], function(){
        var form = layui.form
            ,layer = layui.layer
            ,$ = layui.jquery
            ,util = layui.util;

        //表单赋值
        // var userId = localStorage.getItem("userId");
        var userId = location.search.substr(8);
        $.get("/selectUserExpInfo",{"userId": userId},function (res) {
            if (res.code == 0) {
                var userExpInfo = res.data;
                form.val("roleValue", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                    "userId": userExpInfo.userId// "name": "value"
                    ,"sex": userExpInfo.sex
                    ,"nickName": userExpInfo.nickName
                    ,"email": userExpInfo.email
                    ,"qqNum": userExpInfo.qqNum
                    ,"telephone": userExpInfo.telephone
                    ,"loginNum": userExpInfo.loginNum
                });
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            // layer.alert(JSON.stringify(data.field))
            $.ajax({
                type: "post",
                url: "/updateUserExpInfo",
                contentType: "application/json",
                data: JSON.stringify(data.field),
                success: function (res) {
                    if (res.code == 0) {
                        parent.layer.closeAll();
                        parent.layer.alert(res.msg);
                        // parent.window.location.reload();
                    }else {
                        parent.layer.closeAll();
                        parent.layer.alert("修改失败");
                    }
                }
            });
            return false;
        });

        //处理属性 为 lay-active 的所有元素事件
        util.event('lay-active', {
            btnCancel: function(){
                parent.layer.closeAll();
            }
        });

    });
</script>
</body>
</html>