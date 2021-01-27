<%--
  Created by IntelliJ IDEA.
  User: 66952
  Date: 2021/1/23
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<%--<table class="layui-hide" id="test"></table>--%>
<table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script type="text/html" id="barDemo">
<%--    <a class="layui-btn layui-btn-xs" lay-event="add">添加</a>--%>
<%--    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
<%--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
</script>

<%--<script type="text/html" id="checkboxTpl">--%>
<%--    <!-- 这里的 checked 的状态只是演示 -->--%>
<%--    <input type="checkbox" name="state"  value="{{d.state}}" lay-event="switchEnableEvent" lay-skin="switch" lay-text="女|男" lay-filter="lockDemo" {{ d.state == 1  ? 'checked' : ''}} >--%>
<%--</script>--%>
<script type="text/html" id="state">
    {{#  if(d.state === 0 ){ }}
    <button type="button" class="layui-btn">待审核</button>
    {{#  } }}
    {{#  if(d.state === 1 ){ }}
    <button type="button" class="layui-btn layui-btn-normal">已上架</button>
    {{#  } }}
    {{#  if(d.state === 2 ){ }}
    <button type="button" class="layui-btn layui-btn-danger">已下架</button>
    {{#  } }}
</script>


<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table','form','jquery'], function(){
        var table = layui.table
            ,form = layui.form
            ,$ = layui.jquery
            ,layer = layui.layer;

        table.render({
            elem: '#currentTableId'
            ,url:'/good/selectAll'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '商品数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'goodId', title: '商品编号'}
                ,{field:'goodName', title: '商品名称'} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{field:'customerId', title: '商户ID'}
                ,{field:'goodPic1', title: '商品图片1'}
                ,{field:'goodPic2', title: '商品图片2'}
                ,{field:'goodPic3', title: '商品图片3'}
                ,{field:'promoteDesc', title: '推广说明'}
                ,{field:'copyIds', title: '文案ID'}
                ,{field:'copyDesc', title: '文案说明'}
                ,{field:'forwardLink', title: '跳转链接'}
                ,{field:'orderNo', title: '订单编号'}
                ,{field:'typeId', title: '类型编号'}
                ,{field:'tags', title: '商品分类'}
                ,{field:'state', title:'状态', width: 120 , templet: '#state', event:'changeState'}
                ,{field:'createTime', title: '加入时间'}
                ,{field:'toped', title: '是否置顶'} //单元格内容水平居右 align: 'right'  单元格内容水平居中 , align: 'center'
                ,{field:'recomed', title: '是否推荐'}
                ,{field:'topedTime', title: '置顶时间'}
                ,{field:'recomedTime', title: '推荐时间'}
                ,{field:'spcId', title: '站内文案ID'}
                ,{field:'zonId', title: '空间文案ID'}
                ,{field:'sellNum', title: '购买人数作弊值'}
                ,{field:'website', title: '产品网址'}
                ,{field:'kfqq', title: '客服QQ'}
                ,{fixed: 'right', title:'操作', width: 80, toolbar: '#barDemo'}
            ]],
            limits: [1, 3, 5, 10],
            limit: 10,
            page: true,
            skin: 'line'
        });

        //头工具栏事件
        table.on('toolbar(currentTableFilter)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(currentTableFilter)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                $.ajax({
                    type: "post",
                    url: "/customer/deleteOne",
                    data: {
                        "customerId": data.customerId
                    },
                    success: function (res) {
                        console.log(res)
                        if (res.code == 0) {
                            layer.confirm('真的删除行么', function(index){
                                obj.del();
                                layer.close(index);
                            });
                            // parent.layer.closeAll();
                            // parent.layer.alert(res.msg);
                            // parent.window.location.reload();
                        }else {
                            parent.layer.closeAll();
                            parent.layer.alert("删除失败");
                        }
                    }
                });
            } else if(obj.event === 'edit'){
                var customerId = localStorage.setItem("customerId", obj.data.customerId)
                layer.open({
                    type: 2 //此处以iframe举例
                    ,title: '修改操作'
                    ,area: ['100%','100%']
                    ,shade: 0
                    ,maxmin: false
                    ,content: '/customer/editCustomer'
                    //监听弹出关闭，更新表格数据
                    ,end:function () {
                        //重载表格数据
                        table.reload('currentTableId', {
                            page: {
                                curr: 1
                            }
                        }, 'data');
                    }
                });
            }else if(obj.event === 'add'){
                layer.open({
                    type: 2 //此处以iframe举例
                    ,title: '添加操作'
                    ,area: ['100%','100%']
                    ,shade: 0
                    ,maxmin: false
                    ,content: '/customer/addCustomer'
                    //监听弹出关闭，更新表格数据
                    ,end:function () {
                        //重载表格数据
                        table.reload('currentTableId', {
                            page: {
                                curr: 1
                            }
                        }, 'data');
                    }
                });
            }else if (obj.event === 'changeState') {//状态开关
                if (obj.data.state == 0) {
                    $.get("/good/updateState",{goodId: obj.data.goodId , state: obj.data.state + 1},
                        function (res) {
                            if (res.code == 0) {
                                layer.alert("审核通过");
                            }
                            table.reload("currentTableId");
                        });
                }else if (obj.data.state == 1) {
                    $.get("/good/updateState", {goodId: obj.data.goodId , state: obj.data.state + 1},
                        function (res) {
                            if (res.code == 0) {
                                layer.alert("已下架");
                            }
                            table.reload("currentTableId");
                        });
                }else if (obj.data.state == 2) {
                    $.get("/good/updateState", {goodId: obj.data.goodId , state: obj.data.state - 1},
                        function (res) {
                            if (res.code == 0) {
                                layer.alert("已上架");
                            }
                            table.reload("currentTableId");
                        });
                }
            }else if(obj.event === 'detail'){//详情
                var goodId = localStorage.setItem("goodId", obj.data.goodId)
                layer.open({
                    type: 2 //此处以iframe举例
                    ,title: '商品详情'
                    ,area: ['100%','100%']
                    ,shade: 0
                    ,maxmin: false
                    ,content: '/good/detailList'
                    //监听弹出关闭，更新表格数据
                    ,end:function () {
                        //重载表格数据
                        table.reload('currentTableId', {
                            page: {
                                curr: 1
                            }
                        }, 'data');
                    }
                });
            }
        });

        //审批，上架，下架


    });
</script>

</body>
</html>