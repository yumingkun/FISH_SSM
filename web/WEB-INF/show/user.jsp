
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
    <%--引入bootstrap--%>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

    <%--&lt;%&ndash;整体css js&ndash;%&gt;--%>
    <%--<link rel="stylesheet" type="text/css" href="../../css/main.css"/>--%>
    <%--<script src="../../js/main.js" type="text/javascript" charset="utf-8"></script>--%>


</head>
<body>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%--1:引入头部--%>
<jsp:include page="./common/header.jsp" />



<%--侧边栏--%>
<div class="container" id="container">
    <div class="row">
        <div class="container col-md-2" >
            <jsp:include page="./common/side.jsp" />
        </div>


        <div id="left" class="container col-md-8 panel panel-default" style="max-height: 600px"  >
            <h3 id="right-h3" class="panel-heading">个人中心</h3>
            <div id="right-row-1" class="row" style="margin: 0px;">
                <div id="right-left" class="col-md-3">
                    <div class="thumbnail" style="margin: 5px;">
                        <c:if test="${user!=null}">
                            <img alt="" src="<%=basePath%>${user.head}">
                        </c:if>

                        <c:if test="${user==null}">
                            <<img src="../../img/notlogin.jpg" class="img-circle">
                        </c:if>


                        <center><button style="margin: 0px;width: 100%;" class="btn btn-default"  data-toggle="modal" data-target="#myModal">修改头像</button></center>
                    </div>



                </div>
                <div id="right-right-1" class="col-md-9" style="padding: 15px;">
                    <div>
                        <%--修改用户信息--%>
                        <p class="text-muted">ID:${user.id}<a  href="#" style="float: right"><span class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#myModa2" style="font-size: 20px"></span></a></p>
                        <%--<p>关注:${followNum}</p>--%>
                        <%--<p>粉丝:${fanNum}</p>--%>

                    </div>
                    <hr>
                    <div>
                        <p>用户名：${user.username}</p>
                        <p>邮箱：${user.email}</p>
                    </div>
                </div>

            </div>


        </div>
        <%--右边整体end--%>


        </div>



    </div>
</div>



<%--表单--%>
<form action="<%=request.getContextPath()%>/show/upload.do" method="post" enctype="multipart/form-data" id="myForm" class="form">
    <input type="file" id="myFile" name="myFile" style="display: none">
</form>


<!--修改头像 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="font-family:'Wawati SC'">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel" >
                    上传头像
                </h4>
            </div>
            <div class="modal-body text-center">
                <%--text-cente  bootstrap子元素居中--%>
                <span id="myImg">
                     <c:if test="${user!=null}">
                         <img alt="" src="<%=basePath%>${user.head}" class="img-circle">
                     </c:if>

                    <c:if test="${user==null}">
                        <<img src="../../img/notlogin.jpg" class="img-circle">
                    </c:if>
                </span>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="$('#myFile').click();" >浏览</button>
                <button type="button" class="btn btn-primary" id="btn">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!--修改用户信息模态框（Modal） -->
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="font-family:'Wawati SC'">
        <div class="modal-content">
            <div class="modal-header"  >
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title"  style="font-weight: 700;"> 修改用户信息</h4>
            </div>

            <div class="modal-body text-center" >
                <!--修改用户信息表单-->
                <form id="updateform" action="${pageContext.request.contextPath}/show/user/updateUser" method="post" style="text-align: left;">
                    <div class="form-group">
                        <input type="hidden" name="id" value="${user.id}">
                        <label for="username" class="control-label">用户名:</label>
                        <input type="text" class="form-control" id="username" name="username" value="${user.username}">
                    </div>
                    <div class="form-group">
                        <label for="email" class="control-label">Email:</label>
                        <input type="text" class="form-control" id="email" name="email" value="${user.email}">
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">密码:</label>
                        <input type="password" class="form-control" id="password" name="password" value="${user.password}">
                    </div>
                </form>
                <!--修改用户信息表单end-->
            </div>

            <div class="modal-footer" >
                <!--点击提交表单-->
                <button type="button" class="btn btn-default" onclick="update_info()">提交 </button>
            </div>
        </div>
    </div>
</div>


<%--页脚--%>
<jsp:include page="./common/footer.jsp" />
<%--页脚end--%>


</body>


<script type="text/javascript">

    $("#too").click(function(){
        $(".myLeaf").toggle(1000);


    });

    // 头像表单点击提交按钮事件
    $("#btn").on("click", function () {
        $('#myForm').submit();
    });

    //预览
    myFile.onchange=function(){
        var file=this.files[0] ;  // 获取input上传的图片数据;

        var url=window.URL.createObjectURL(file);  // 得到bolb对象路径，可当成普通的文件路径一样使用，赋值给src;
        document.getElementById("myImg").innerHTML="<img src='"+url+"' class='img-circle'/>";
    };

    $("#test").click(function () {
        alert("test");
        $("#myLeaf").css({ display:block});
    });


    //提交修改用户信息表单
    function update_info(){
        // alert("我是表单");
  	 $("#updateform").submit();
    }



</script>
</html>
