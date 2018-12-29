<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/11/3
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>空空如也</title>
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css"/>
    <%--引入bootstrap--%>
    <script src="${pageContext.request.contextPath }/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">

    <%--整体css js--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css"/>
    <script src="${pageContext.request.contextPath }/js/main.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        .nullImg{
            margin: 10px auto;
            height:300px;
            margin-bottom: 100px;
        }

        .null h1{
            font-family: "Wawati SC";
            color: gray;
            font-weight: bold;
            text-align: center;
            font-size: 100px;
            margin-top: 80px;
        }
    </style>
</head>
<body>
<%--引入头--%>
<jsp:include page="./common/header.jsp"></jsp:include>

<div class="null">
    <h1>空空如也</h1>
    <img src="../../../img/null.png" class="nullImg">
</div>

<%--引入尾--%>
<jsp:include page="./common/footer.jsp"></jsp:include>

</body>
</html>
