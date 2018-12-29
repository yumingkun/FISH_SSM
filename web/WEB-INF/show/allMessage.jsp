<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/19
  Time: 下午10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <title>FISH</title>
    <meta name='viewport' content='width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no'/>
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css"/>
    <%--引入bootstrap--%>
    <script src="${pageContext.request.contextPath }/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">

    <%--整体css js--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css"/>
    <script src="${pageContext.request.contextPath }/js/main.js" type="text/javascript" charset="utf-8"></script>

    <script>
        // 轮播图要求默认第一个
        $(function(){
            $(".carousel-inner .item:first-child").addClass("active")
        })
    </script>


    <style >
        a{
            color:gray;
        }
        /*加载更多*/
        .more{
            margin-top: 100px;
            height: 40px;
            line-height: 40px;
            border-radius: 20px;
            background-color: #b0b8d2;
            text-align: center;
            color: white;
            font-size: 16px;
            font-weight:bold;
            transition: all 1s;

        }

        .more:hover{
            color: #535588;
            box-shadow: 10px 10px 20px gainsboro ;
        }

         #nullImg{
             width: 130px;
             height: 90px;
             border: 2px solid #b9def0;
        }

        /*总计数*/
        .myAlert{
            background-color: rgba(235, 246, 255, 0.5);
            margin-top: 20px;
            width: 100%;
            font-family: "Wawati SC";
            text-align: center;
            font-size: 17px;
            font-weight: 800;
            color: #26263d;
        }
        .mylist .new-list-item img{
            width: 130px;
            height: 90px;
            border: 2px solid #b9def0;
            transition: all 0.5s;
        }
        .mylist .new-list-item img:hover{

            box-shadow: 10px 10px 20px gainsboro ;
        }



            /*轮播图*/
        #Caro{
            width: 100%;
            height: 270px;
            margin-bottom: 20px;

        }
        .carousel-inner .item img{
            display: block;
            width: 100%;
            height: 270px;

        }

        /*中间内容*/

        .info{
            margin-top: 40px;
        }

        /*推荐作者*/
        .author{
            margin-top:5px;
            padding: 5px;
            transition: all 1s;
            /*border: 1px solid red;*/
            clear: both;
            /*弹性布局*/
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content:flex-start;
            align-items:center;
        }
        .author:hover{
            box-shadow: 10px 10px 20px gainsboro ;
        }


        .author img{
            /*border: 1px solid red;*/
            width: 35px;
            height: 35px;
            border-radius: 50%;
            margin-right: 10px;
        }


        @media screen and (min-width: 1800px) {
            #xiang a:first-child{
                color: red;
            }
        }
    </style>


</head>
<body>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%--1：标签锚点--%>
<a name="top"></a>

<%--导航--%>
<jsp:include page="./common/header.jsp" />
<!-- 导航END -->

<!-- 主内容 -->
<div class="container">
    <div class="row">
        <!-- 左边分类 -->
        <div class="col-sm-2 hidden-xs">
            <div class="side-bar-card flag clearfix" style="margin-top: 0">
                <div class="card-title">推荐作者</div>
                <div class="container-fluid">
                    <c:forEach items="${userlimit}" var="user">
                        <a href="${pageContext.request.contextPath}/show/message/author/${user.id}">
                            <div class="row author">
                                <img src="<%=basePath%>${user.head}">
                                <p>${user.username}</p>
                            </div>
                        </a>
                    </c:forEach>


                </div>

            </div>
            <%--<div class="list-group side-bar" id="xiang">--%>
                <%--<a class="list-group-item"><span class="glyphicon glyphicon-fire"></span>专题</a>--%>
                <%--<c:forEach items="${categories}" var="category">--%>
                    <%--&lt;%&ndash;<td>${category.id}</td>&ndash;%&gt;--%>
                    <%--<a href="<%=request.getContextPath()%>/show/oneCategory.do?cid=${category.id}" class="list-group-item">${category.gname}</a>--%>
                <%--</c:forEach>--%>

            <%--</div>--%>
        </div>
        <!-- 左边分类END -->
        <!-- 中间内容 -->
        <div class="col-sm-7">
            <%--轮播图====哇哈哈哈哈哈哈哈或或或或或或或或或或--%>
                <div class="container" id="Caro">
                    <div class="carousel slide" id="slidershow" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li class="active" data-target="#slidershow" data-slide-to="0"></li>
                            <li data-target="#slidershow" data-slide-to="1"></li>
                            <li data-target="#slidershow" data-slide-to="2"></li>
                            <li data-target="#slidershow" data-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner">

                            <c:forEach items="${carousels}" var="carousel">
                                <div class="item">
                                    <img src="<%=basePath%>${carousel.imgLoc}"/>
                                </div>
                            </c:forEach>


                        </div>
                        <a href="#slidershow" data-slide="prev" class="left carousel-control" role="button">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a href="#slidershow" data-slide="next" class="right carousel-control" role="button">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
                <%--轮播end--%>

            <%--初始值--%>
            <div class="new-list mylist">
                <c:forEach items="${messages}" var="message">
                    <div class="new-list-item clearfix">
                        <div class="col-xs-4 .text-center" >

                            <c:choose>

                                <c:when test="${not empty message.src}">
                                    <img src="${message.src}" class="thumbnail">
                                </c:when>

                                <c:otherwise>  <!--否则 -->
                                    <img src="../../img/nullsrc.png" id="nullImg" class="thumbnail">
                                </c:otherwise>

                            </c:choose>

                            <%--<c:if test="${message.src==null or message.src==''}">--%>

                            <%--</c:if>--%>
                            <%--<c:if test="">--%>

                            <%--</c:if>--%>
                        </div>
                        <div class="col-xs-7">

                            <a href="${pageContext.request.contextPath}/show/message/detail/${message.id}" class="title">${message.title}</a>
                            <%--<div class="content">--%>
                                    <%--&lt;%&ndash;<p>${message.content}</p>&ndash;%&gt;--%>

                            <%--</div>--%>
                            <div class="info">
                                <span class="glyphicon glyphicon-tag" style="color: #a5d1a4"></span>
                                <span>${message.category.gname}</span>
                                <span class="glyphicon glyphicon-user" style="color: #b6bfd9"></span>
                                <span>${message.user.username} </span>
                                <span class="glyphicon glyphicon-heart" style="color: #d17687"></span>
                                <span>${message.laud}</span>

                            </div>


                        </div>
                    </div>
                </c:forEach>
                <div class="showMore" style="margin-top: 10px">

                </div>

                <%--加载更多数据显示位置   --%>
            </div>

            <!-- 加载更多 -->
                <%--<c:if test="${show==1}">--%>
                    <%--<div class="alert myAlert" role="alert">${count}</div>--%>
                <%--</c:if>--%>

                <%--<c:if test="${show!=1}">--%>
                    <div class="more" onclick="page()">
                        加载更多
                    </div>
                <%--</c:if>--%>

        </div>
        <!-- 中间内容END -->
        <!-- 右边内容 -->
        <div class="col-sm-3 hidden-xs">


            <%--<br>--%>
            <div class="side-bar-card">
                <div class="card-title">推荐文章</div>
                <div class="card-body">
                    <div class="list">
                        <c:forEach items="${messageLimit}" var="message">
                            <a href="${pageContext.request.contextPath}/show/message/detail/${message.id}" >
                                <div class="item" >
                                    <div class="title">${message.title}</div>
                                    <div class="desc"><span class="glyphicon glyphicon-heart"></span> ${message.laud} </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右边内容END -->
    </div>
</div>




<%--页脚--%>
<jsp:include page="./common/footer.jsp" />

<%--页脚end--%>

<%--1：回到顶部--%>
<a title="返回顶部"  id="btn" ></a>

</body>

<script type="text/javascript">

    // 实现加载更多
    var clickNum = 0;//点击次数
    function page(){
        clickNum++;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/show/message/more/"+clickNum,
            dataType:"json",
            success:function(data){
                var str="";
                $.each(data,function(i,message){
                    var src=message.src?message.src:"../../img/nullsrc.png";
                    var tyle=message.src?"":"style=\"width: 130px;height: 90px;border: 2px solid #b9def0\"";
                    str+=`<div class="new-list-item clearfix" >
                            <div class="col-xs-4">
                                <img src='`+src+`' alt="" `+tyle+` class="thumbnail">
                            </div>
                            <div class="col-xs-7">

                                <a href="/show/detail.do?id=`+message.id+`&userId=`+message.user.id+`" class="title">`+message.title+`</a>
                                <div class="content">
                                        <%--<p>${message.content}</p>--%>
                                </div>
                                   <div class="info">
                                <span class="glyphicon glyphicon-tag" style="color: #a5d1a4"></span>
                                <span>`+message.category.gname+`</span>
                                <span class="glyphicon glyphicon-user" style="color: #b6bfd9"></span>
                                <span>`+message.user.username+` </span>
                                <span class="glyphicon glyphicon-heart" style="color: #d17687"></span>
                                <span>`+message.laud+`</span>

                            </div>

                            </div>
                        </div>

                    `;

                });

             $(".showMore").hide().append(str).show(1000);



            }
        });
    }



    //回到顶部
    //1：jQuery.fn是jQuery的原型对象也可以写成 $.fn
    //2：添加myScrollTo方法到jQuery原型($.fn)
    jQuery.fn.myScrollTo = function(speed) {
        var targetOffset = $(this).offset().top;
        console.log(targetOffset);//去除默认样式后是 0
        //$(this).offset()：获得位移对象（此时其实啥也没做）
        //$(this).offset().top：获得位移高度
        $('html,body').stop().animate({scrollTop: targetOffset}, speed);
        return this;
    };

    // 使用自定义的方法
    $("#btn").click(function(){
        $("body").myScrollTo(500);//调用，并传入速度
        return false;//阻止默认事件
    });



</script>



</html>
