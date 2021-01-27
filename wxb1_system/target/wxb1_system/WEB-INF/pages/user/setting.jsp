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
    <title>安全设置</title>
    <base href="${pageContext.request.contextPath}/">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>修改密码</legend>
</fieldset>

<form class="layui-form" action="" lay-filter="userInfoValue">
    <div class="layui-form-item">
        <label class="layui-form-label">账户</label>
        <div class="layui-input-block">
            <input type="hidden" name="userId">
            <input type="text" name="account" lay-verify="required" lay-reqtext="账户不能为空" placeholder="请输入账户"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">旧密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" lay-verify="required" lay-reqtext="旧密码不能为空" placeholder="请输入旧密码"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-block">
            <input type="text" name="newPassword"  lay-verify="required"  placeholder="请输入你要修改的密码"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-block">
            <input type="text"  lay-verify="required|confirmPass"  placeholder="请再次输入你要修改的密码"  autocomplete="off" class="layui-input">
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
        var userId = localStorage.getItem("userId");
        // var userId = location.search.substr(8);
        $.get("/selectUserInfo",{"userId": userId},function (res) {
            if (res.code == 0) {
                var userInfo = res.data;
                form.val("userInfoValue", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                    "userId": userId
                    ,"account": userInfo.account// "name": "value"
                    ,"password": userInfo.password
                });
            }
        });

        // 校验两次密码是否一致
        form.verify({
            confirmPass:function(value){
                if($('input[name=newPassword]').val() !== value)
                    return '两次密码输入不一致！';
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            // layer.alert(JSON.stringify(data.field))
            var userInfo = data.field;
            $.ajax({
                type: "post",
                url: "/updatePassword",
                data: {
                    "password": userInfo.newPassword,
                    "userId": userInfo.userId
                },
                success: function (res) {
                    if (res.code == 0) {
                        parent.layer.closeAll();
                        parent.layer.alert(res.msg);
                        // parent.window.location.reload();
                    }else {
                        parent.layer.closeAll();
                        parent.layer.alert("修改密码失败");
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