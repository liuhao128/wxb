<%--
  Created by IntelliJ IDEA.
  User: 66952
  Date: 2021/1/23
  Time: 17:42
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

<form class="layui-form" action="" lay-filter="goodValue">
    <div class="layui-form-item">
        <label class="layui-form-label">商品编号</label>
        <div class="layui-input-block">
            <input type="text" name="goodId" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-block">
            <input type="text" name="goodName" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商户ID</label>
        <div class="layui-input-block">
            <input type="text" name="customerId" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品图片1</label>
        <div class="layui-input-block">
            <input type="text" name="goodPic1" readonly  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品图片2</label>
        <div class="layui-input-block">
            <input type="text" name="goodPic2" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品图片3</label>
        <div class="layui-input-block">
            <input type="text" name="goodPic3" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">推广说明</label>
        <div class="layui-input-block">
            <input type="text" name="promoteDesc" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">文案ID</label>
        <div class="layui-input-block">
            <input type="text" name="copyIds" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">文案说明</label>
        <div class="layui-input-block">
            <input type="text" name="copyDesc" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">跳转链接</label>
        <div class="layui-input-block">
            <input type="text" name="forwardLink" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单编号</label>
        <div class="layui-input-block">
            <input type="text" name="orderNo" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类型编号</label>
        <div class="layui-input-block">
            <input type="text" name="typeId" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品分类</label>
        <div class="layui-input-block">
            <input type="text" name="tags" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block" >
            <input type="radio" disabled="disabled" name="state" value="0" title="待审核" checked="">
            <input type="radio" disabled="disabled" name="state" value="1" title="已上架">
            <input type="radio" disabled="disabled" name="state" value="2" title="已下架">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">加入时间</label>
        <div class="layui-input-inline">
            <input type="text" name="createTime" readonly autocomplete="off" class="layui-input" id="createTime" placeholder="yyyy-MM-dd HH:mm:ss">
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">是否置顶</label>
        <div class="layui-input-block">
            <input type="radio"  name="toped" value="1" title="是" checked="">
            <input type="radio"  name="toped" value="0" title="否">
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">是否推荐</label>
        <div class="layui-input-block">
            <input type="radio"  name="recomed" value="1" title="是" checked="">
            <input type="radio"  name="recomed" value="0" title="否">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">置顶时间</label>
        <div class="layui-input-inline">
            <input type="text" name="topedTime" readonly autocomplete="off" class="layui-input" id="topedTime" placeholder="yyyy-MM-dd HH:mm:ss">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">推荐时间</label>
        <div class="layui-input-inline">
            <input type="text" name="recomedTime" readonly autocomplete="off" class="layui-input" id="recomedTime" placeholder="yyyy-MM-dd HH:mm:ss">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">站内文案ID</label>
        <div class="layui-input-block">
            <input type="text" name="spcId" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">空间文案ID</label>
        <div class="layui-input-block">
            <input type="text" name="zonId" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">购买人数作弊值</label>
        <div class="layui-input-block">
            <input type="text" name="sellNum" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">产品网址</label>
        <div class="layui-input-block">
            <input type="text" name="website" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">客服QQ</label>
        <div class="layui-input-block">
            <input type="text" name="客服QQ" readonly  autocomplete="off"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
<%--            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">提交</button>--%>
            <button type="button" class="layui-btn layui-btn-primary" lay-active="btnCancel">返回</button>
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
            elem: '#topedTime'
            ,type: 'datetime',
            trigger: 'click'
        });
        //日期时间选择器
        laydate.render({
            elem: '#recomedTime'
            ,type: 'datetime',
            trigger: 'click'
        });

        //表单赋值
        var goodId = localStorage.getItem("goodId");
        $.get("/good/selectOne",{"goodId": goodId},function (res) {
            if (res.code == 0) {
                var good = res.data;
                form.val("goodValue", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                    "goodId": good.goodId
                    ,"goodName": good.goodName
                    ,"customerId": good.customerId
                    ,"goodPic1": good.goodPic1
                    ,"goodPic2": good.goodPic2
                    ,"goodPic3": good.goodPic3
                    ,"promoteDesc": good.promoteDesc
                    ,"copyIds": good.copyIds
                    ,"copyDesc": good.copyDesc
                    ,"forwardLink": good.forwardLink
                    ,"orderNo": good.orderNo
                    ,"typeId": good.typeId
                    ,"tags": good.tags
                    ,"state": good.state
                    ,"createTime": good.createTime
                    ,"toped": good.toped
                    ,"recomed": good.recomed
                    ,"topedTime": good.topedTime
                    ,"recomedTime": good.recomedTime
                    ,"spcId": good.spcId
                    ,"zonId": good.zonId
                    ,"sellNum": good.sellNum
                    ,"website": good.website
                    ,"kfqq": good.kfqq
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
