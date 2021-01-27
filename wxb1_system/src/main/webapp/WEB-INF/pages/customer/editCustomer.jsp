<%--
  Created by IntelliJ IDEA.
  User: 66952
  Date: 2021/1/23
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>添加商户信息</title>
    <base href="${pageContext.request.contextPath}/">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>添加商户信息</legend>
</fieldset>

<form class="layui-form" action="" lay-filter="customerValue">
    <div class="layui-form-item">
        <label class="layui-form-label">商户名称</label>
        <div class="layui-input-block">
            <input type="hidden" name="customerId">
            <input type="text" name="customerName"  autocomplete="off" placeholder="请输入商户名称" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商户QQ</label>
        <div class="layui-input-block">
            <input type="text" name="qq"  autocomplete="off" placeholder="请输入商户QQ" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">微信号码</label>
        <div class="layui-input-block">
            <input type="text" name="wxh"  autocomplete="off" placeholder="请输入商户微信号码" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商户电话</label>
        <div class="layui-input-block">
            <input type="text" name="phone"  autocomplete="off" placeholder="请输入商户电话" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-inline">
            <input type="text" name="createTime" autocomplete="off" class="layui-input" id="createTime" placeholder="yyyy-MM-dd HH:mm:ss">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录账户</label>
        <div class="layui-input-block">
            <input type="text" name="loginName"  autocomplete="off" placeholder="请输入登录账户" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录密码</label>
        <div class="layui-input-block">
            <input type="text" name="loginPwd"  autocomplete="off" placeholder="请输入商户名称" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="radio" name="state" value="1" title="有效" checked="">
            <input type="radio" name="state" value="0" title="无效">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商户等级</label>
        <div class="layui-input-inline">
            <select name="level" lay-filter="level">
                <option value=""></option>
                <option value="0">非认证商户</option>
                <option value="1" selected="">认证商户V1</option>
                <option value="2">认证商户V2</option>
                <option value="3">认证商户V3</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账户余额</label>
        <div class="layui-input-block">
            <input type="text" name="accBalance"  autocomplete="off" placeholder="请输入账户余额" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">最后登录时间</label>
        <div class="layui-input-inline">
            <input type="text" name="updateTime" autocomplete="off" class="layui-input" id="updateTime" placeholder="yyyy-MM-dd HH:mm:ss">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商户网址</label>
        <div class="layui-input-block">
            <input type="text" name="website"  autocomplete="off" placeholder="请输入商户网址" class="layui-input">
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
    layui.use(['form','util','jquery','laydate' ], function(){
        var form = layui.form
            ,layer = layui.layer
            ,$ = layui.jquery
            ,laydate = layui.laydate
            ,util = layui.util;

        //日期时间选择器
        laydate.render({
            elem: '#createTime'
            ,type: 'datetime',
            trigger: 'click'
        });
        //日期时间选择器
        laydate.render({
            elem: '#updateTime'
            ,type: 'datetime',
            trigger: 'click'
        });

        //表单赋值
        var customerId = localStorage.getItem("customerId");
        $.get("/customer/selectOne",{"customerId": customerId},function (res) {
            if (res.code == 0) {
                var customer = res.data;
                form.val("customerValue", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                    "customerId": customer.customerId
                    ,"customerName": customer.customerName
                    ,"qq": customer.qq
                    ,"wxh": customer.wxh
                    ,"phone": customer.phone
                    ,"createTime": customer.createTime
                    ,"loginName": customer.loginName
                    ,"loginPwd": customer.loginPwd
                    ,"state": customer.state
                    ,"level": customer.level
                    ,"accBalance": customer.accBalance
                    ,"updateTime": customer.updateTime
                    ,"website": customer.website
                });
                //将localStorage清空
                localStorage.clear();
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            // layer.alert(JSON.stringify(data.field))
            console.log(JSON.stringify(data.field))
            $.ajax({
                type: "post",
                url: "/customer/updateCustomer",
                contentType: "application/json",
                data: JSON.stringify(data.field),
                success: function (res) {
                    console.log(res)
                    if (res.code == 0) {
                        parent.layer.closeAll();
                        parent.layer.alert(res.msg);
                        // var iframeIndex = parent.layer.getFrameIndex(window.name);
                        // parent.layer.close(iframeIndex);
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
