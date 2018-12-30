<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文件上传</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        // 工具提示
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
        }

        a,a:hover,a:active{
            text-decoration: none;
            color: #92adff;
        }
        #container ul{
            padding: 0px ;
            width: 90%;
            border: 1px solid #C4C4C4;
            border-radius: 5px;

            /*box-shadow: 1px 2px 3px 0px #C4C4C4;*/
        }
        #container ul a{
            color: black;
            border: none ;
            text-align: center;
        }
        #container  ul li{
            width: 100%;
            border: none ;
            text-align: center;
        }
        /*#container ul .list-group-item a{*/
        /*display: block;*/
        /*height: 20px;*/
        /*margin-top: -10px;*/
        /*color:gray ;*/
        /*}*/
        #container ul a:hover{
            color: white ;
            background-color: #b0b8d2;
            /*box-shadow: 2px 2px 2px 0px #478EFF inset;*/
        }
        #container ul li:hover{
            color: white;
            cursor: pointer;
            background-color: #b0b8d2;
            /*box-shadow: 3px 3px 1px 1px #00428D inset;*/
        }

        #left{
            border: 1px solid #C4C4C4;
            padding: 0px;
            border-radius: 10px;
            /*box-shadow: 1px 2px 3px 0px #C4C4C4;*/
            min-height: 300px;
        }
        #right-h3{
            font-family: "Wawati SC";
            background-color: #f0f4ff;
            font-weight: bold;
            /*margin: 1px;*/
            margin-top: 0px;
            border-top-right-radius: 9px;
            border-top-left-radius: 9px;
            border: 0px;
        }
        #right-h3 span{
            display: inline-block;
            float: right;
        }

        #myImg img{
            width: 250px;
            height: 250px;
        }


        /*左边选项默认为不显示*/
        .myLeaf{
            display:block;
        }

        /*轮播图*/
        .myCarousel h1{
            display: none;
        }

        /*评论*/
        .myComment1 a{
            display: inline-block;
            float: right;
        }
        .myComment1 .com{
            color: #898bd0;
        }
        .myComment2 p{
             margin-left: 15px;
        }
        #deleteComment{
            color: rosybrown;
            float: right;
            margin-right: 15px;
        }


    </style>

</head>
<body>

<!-- 导航 -->
<%--1:引入头部--%>
<jsp:include page="./common/header.jsp" />
<!-- 导航end -->


<!-- 提示end -->

<%--内容--%>
<div class="container" id="container">
    <div class="row">
        <%--左边--%>
        <div class="col-md-2" >
            <jsp:include page="./common/side.jsp" />
        </div>

        <%--右边--%>
        <div id="left" class="col-md-10 panel panel-default"   >
            <h3 id="right-h3" class="panel-heading">我的评论</h3>
            <div class="container-fluid">
                <c:forEach items="${comments}" var="comment" varStatus="status">
                    <div class="row" id="${comment.id}">
                        <div class="panel ">
                            <!-- Default panel contents -->
                            <div class="panel-heading">
                                <p class="myComment1">
                                    <span>${comment.user.username} <span class="com"> 评论了您的文章 </span> ${comment.message.title}</span>
                                    <a role="button"  data-toggle="collapse" href="#${status.index}" aria-expanded="false" aria-controls="${status.index}"><span><fmt:formatDate value='${comment.create_time}' pattern='yyyy-MM-dd'/></span>  <span class="glyphicon glyphicon-menu-down"></span></a>
                                </p>
                            </div>
                            <div class="collapse myComment2"  id="${status.index}">
                                <p>${comment.content} <span class="glyphicon glyphicon-trash" id="deleteComment" role="button" onclick="deleteComment('${comment.id}')"></span></p>
                            </div>

                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>

    </div>




<%--页脚--%>
<jsp:include page="./common/footer.jsp" />
<%--页脚end--%>

</body>

<script>
    function deleteComment(commentId) {
        // alert(commentId);
        $.ajax({
            type:"post",
            dataType:"text",
            url:"${pageContext.request.contextPath}/show/comment/deleteComment/"+commentId,
            success:function(data){
                alert("删除成功");
                $("#"+commentId).hide(800);
            },
            error:function( XMLHttpRequest, textStatus, errorThrown){
                alert("删除失败")
            },

        });
    }
</script>

</html>