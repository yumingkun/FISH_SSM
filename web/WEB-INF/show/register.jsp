<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/12/1
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <!--引入bootstrap-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <link rel="stylesheet"   href="${pageContext.request.contextPath }/css/bootstrap-theme.css">
    <script type="text/javascript"   src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/js/bootstrap.js"></script>

    <!--引入登录样式-->
    <link rel="stylesheet"  href="../../css/register.css">

</head>
<body>


<form id="registerform" >
    <canvas id="canvas" width="500" height="170" ></canvas>
    <h1>REGISTER</h1>
    <div class="form-group" >
        <label for="Username">Username</label>
        <input type="text" class="form-control" name="username" id="Username" placeholder="Username"  required pattern="^[a-zA-Z0-9\u4e00-\u9fa5]{6,12}$" title="6到10位">
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control"  name="email" id="email" placeholder="Password" required pattern="^\w+@\w+\.\w+$" title="请填写正确邮箱格式">
    </div>
    <div class="form-group">
        <label for="Password1">Password</label>
        <input type="password" class="form-control" name="password" id="Password1" placeholder="Password" required pattern="^[a-zA-Z0-9]{6,12}" title="6到12位英文或数字">
    </div>
    <div class="form-group">
        <label for="Password2">Confirm Password</label><span id="checkPassword" style="float: right"></span>
        <input type="password" class="form-control" id="Password2" placeholder="Confirm Password" required  pattern="^[a-zA-Z0-9]{6,12}" title="6到12位英文或数字" onmouseleave="check()">
    </div>

    <div class="form-group">
        <button type="button" class="btn btn-default" onclick="sub()">Sign up</button>
    </div>

</form>


</body>

<script>
    var canvas=document.getElementById("canvas");
    var cxt=canvas.getContext("2d");


    // 右线
    cxt.beginPath();
    cxt.moveTo(250,10);	//移动至开始点
    cxt.lineTo(490,150);
    cxt.shadowColor="#c0c9e4";
    cxt.lineWidth=4;
    cxt.strokeStyle='#FFFFFF';
    cxt.lineJoin='round';//　lineJoin 属性,可以设置线的交汇处的样式
    cxt.lineCap='round'; //lineCap 属性，定义线条的端点。
    cxt.shadowBlur=15;// shadowBlur	设置或返回用于阴影的模糊级别。
    cxt.shadowOffsetX=3; // shadowOffsetX	设置或返回阴影与形状的水平距离。
    // cxt.shadowOffsetY=3;   // shadowOffsetY	设置或返回阴影与形状的垂直距离。
    cxt.globalAlpha=0.3;//透明度
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画


    // 左线
    cxt.beginPath();
    cxt.moveTo(250,10);	//移动至开始点
    cxt.lineTo(10,150);
    cxt.shadowColor='#bec8e3';
    cxt.shadowBlur=15;
    cxt.shadowOffsetX=3;
    // cxt.shadowOffsetY=-3;
    cxt.strokeStyle='#FFFFFF';
    cxt.lineJoin='round';//　lineJoin 属性,可以设置线的交汇处的样式
    cxt.lineCap='round'; //lineCap 属性，定义线条的端点
    cxt.globalAlpha=0.3;//透明度
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画



    // 上圆
    cxt.beginPath();
    cxt.arc(250,15,5,0,2*Math.PI);
    cxt.globalAlpha=0.4;//透明度
    cxt.shadowBlur=0;
    cxt.shadowOffsetX=0; // shadowOffsetX	设置或返回阴影与形状的水平距离。
    cxt.shadowOffsetY=0;
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画

    // 左圆
    cxt.beginPath();
    cxt.arc(10,150,3,0,2*Math.PI);
    cxt.globalAlpha=0.4;//透明度
    cxt.shadowBlur=0;
    cxt.shadowOffsetX=0; // shadowOffsetX	设置或返回阴影与形状的水平距离。
    cxt.shadowOffsetY=0;
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画

    // 右圆
    cxt.beginPath();
    cxt.arc(490,150,3,0,2*Math.PI);
    cxt.globalAlpha=0.4;//透明度
    cxt.shadowBlur=0;
    cxt.shadowOffsetX=0; // shadowOffsetX	设置或返回阴影与形状的水平距离。
    cxt.shadowOffsetY=0;
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画

    function check() {
        // alert("11111");
        var ps1=$("#Password1").val();
        var ps2=$("#Password2").val();
        if (ps1!==ps2){
            $("#checkPassword").html('<span style="color: #ff9174;font-weight: 800">密码不一致</span>');
        }else {
            $("#checkPassword").html('<span style="color: #caffc9;font-weight: 800">密码一致</span>');
        }


    }

    // 注册提交
    function sub() {
        var username=$("#Username").val();
        var password=$("#Password1").val();
        var email=$("#email").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/show/register",
            type:"post",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({username:username,password:password,email:email}),
            success:function (data) {
                alert(data.username+"注册成功");
                window.location.href="${pageContext.request.contextPath}/show/login";
            },
            error:function (err) {
                alert("注册失败"+err);
            }
        })

    }


</script>
</html>
