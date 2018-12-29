<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/12/29
  Time: 6:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    *{
        margin: 0px;
        padding: 0px;
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
    #right-row-1{
        padding: 0px;
        height: 100%;
        /*background-color: ;*/
    }
    #right-left{
        margin-top: 10px;
        padding: 0px;
        height: 60%;
    }
    #right-right-1{
        padding: 0px;
        height: 90%;
    }


    #myImg{
        text-align: center;
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

</style>

<div>
    <span class="glyphicon glyphicon-cog" id="too" style="font-size: 40px;margin-bottom: 10px"></span>
    <div id="right" class="myLeaf">
        <div class="row">
            <ul class="nav nav-pills nav-stacked list-group col-md-12 col-xs-6 ">
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/show/user/theUser/${user.id}">个人中心</a></li>
                <%--<li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toUserComment.do">我的评论</a></li>--%>
                <%--<li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toFollow.do">我的关注</a></li>--%>
                <%--<li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toFan.do">我的粉丝</a></li>--%>
                <%--<li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toUploadDoc.do">我的文件</a></li>--%>

            </ul>


            <ul class="list-group col-md-12 col-xs-6">
                <a href="${pageContext.request.contextPath}/show/message/myMessage/${user.id}" class="list-group-item">我的博客</a>
                <a href="${pageContext.request.contextPath}/show/message/trashMessage/${user.id}" class="list-group-item"><span class="glyphicon glyphicon-trash"></span> 回收站</a>
                <%--<a href="#" class="list-group-item">我的论坛</a>--%>
                <%--<a href="#" class="list-group-item">我的学院</a>--%>
            </ul>
        </div>

    </div>
</div>