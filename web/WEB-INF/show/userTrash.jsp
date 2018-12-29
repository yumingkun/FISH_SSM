<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/10/26
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--当前用户所有文章的页面--%>
<!DOCTYPE html>
<html>
<head>
    <title>回收站</title>
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
    <%--引入bootstrap--%>
    <script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

    <%--整体css js--%>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>--%>
    <%--<script src="${pageContext.request.contextPath}/js/main.js" type="text/javascript" charset="utf-8"></script>--%>
    <style type="text/css">
        /*去除一些头部引入的样式*/
        #showSearch{
            display: none;
        }

        #ul-right a{
            border: none !important;
            text-align: center;
        }
        #ul-right li{
            width: 100%;
            border: none !important;
            text-align: center;
        }
        #ul-right a:hover{
            color: white !important;
            cursor: pointer;
            background-color: #0062FF !important;
            box-shadow: 2px 2px 2px 0px #478EFF inset;
        }
        #ul-right li:hover{
            color: white;
            cursor: pointer;
            background-color: #0062FF ;
            box-shadow: 3px 3px 1px 1px #00428D inset;
        }
        #right{

        }
        #left{
            /*border: 1px solid #C4C4C4;*/
            border: 3px solid rgba(83, 85, 136, 0.1);
            padding: 0px;
            border-radius: 4px;
            /*box-shadow: 1px 1px 1px 1px #C4C4C4;*/
            min-height: 450px;
            padding: 0;
            margin: 0;
        }

        #article a{
            text-decoration-style: none;
        }
        #article a,#article a:link,#article a:visited,#article a:hover,#article a:active{
            text-decoration: none;
            color:inherit;
        }


        /*文章图片大小*/
        .theSize img{
            height: 80px;
            width: 120px;
            border: 2px solid #f0a2b8;
        }

        .new-list-item{
            margin-bottom: 20px;
        }
        .new-list-item .title{
            font-size: 17px;
            font-weight:500;
            color: gray;
        }

    </style>
</head>
<body>


<%--导航--%>
<jsp:include page="./common/header.jsp" />


<div class="container" id="container">
    <div class="row">
        <%--左边--%>
        <div class=" col-md-2" >
            <jsp:include page="./common/side.jsp" />
        </div>

        <%--右边--%>
        <div class=" col-md-10" >
                <div class="row">

                    <form action="" METHOD="post" id="refishTrash" style="display: none"></form>
                    <div id="left" class="col-md-10     panel panel-group">

                        <h1 style="text-align: center;font-family: 'Wawati SC';font-weight: bold;color: gray">回收站</h1>

                        <%--中间地带--%>
                        <div class="panel-body form-inline" style="background-color: #f0bebd;height: 80px">

                        </div>

                        <%--右边选项--%>
                        <div id="article" class="panel-body"  >
                            <%--回收站--%>
                            <div class="new-list tab-pane fade in active"  id="thehome">
                                <c:forEach items="${messages}" var="message">
                                    <%--标记jq要恢复的节点--%>
                                    <div class="new-list-item clearfix row" id="${message.id}">
                                        <div class="col-xs-3 theSize" >
                                            <c:if test="${message.src==null or message.src==''}">
                                                <img src="../../img/nullsrc.png" id="nullImg" >
                                            </c:if>
                                            <c:if test="${message.src!=null and message.src!=''}">
                                                <img src="${message.src}">
                                            </c:if>
                                        </div>
                                        <div class="col-xs-6">
                                            <a href="#" class="title">${message.title}</a>

                                            <div class="info" style="margin-top: 30px">
                                                <span class="glyphicon glyphicon-tag" style="color: #6c7fd1"></span>
                                                <span>${message.category.gname}</span>
                                                <span class="glyphicon glyphicon-heart" style="color: #d17687"></span>
                                                <span>${message.laud}</span>
                                            </div>

                                        </div>

                                        <div class="col-xs-1 "><span class="glyphicon glyphicon-repeat" style="color: green" onclick="restore(${message.id})"></span></div>

                                        <div class="col-xs-1"><span class="glyphicon glyphicon-remove" style="color: brown" onclick="myDelete(${message.id})"></span></div>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                    </div>


            </div>


        </div>


    </div>

</div>





<%--尾--%>
<jsp:include page="./common/footer.jsp" />

</body>

<script type="text/javascript">
    // 点击恢复，文章
    function restore(id){

        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/show/message/restore/"+id,
            dataType:"text",
            success:function(data){
                alert("恢复成功");
                $("#"+id).hide(1000);

                $("#tishi").show(1000).delay(2000).hide(3000);
            }
        });

    }

    //点击彻底删除
    function myDelete(id){
        // alert(id);
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/show/message/delete/"+id,
            dataType:"text",
            success:function(data){
                alert("文章已经彻底删除");
                $("#"+id).hide(1000);
            }
        });
    }




</script>
</html>
