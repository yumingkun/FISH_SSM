<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>新建留言</title>

    <%--引入bootstrap--%>
    <script src="${pageContext.request.contextPath }/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <%--引入富文本框js css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/wangEditor.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/wangEditor.min.js"></script>


    <style type="text/css">
        a:hover,a:active{
            text-decoration: none;
        }

        /*所有的图片样式*/
        img{
            border-radius: 10px;
        }
        .container .title{
            font-family: "Wawati SC";
            text-align: center;
            font-size: 50px;
            font-weight: 800;
            color: gray;
        }

        /*内容图片*/
        .content img{
            width: 100%;
        }
        .container .content p{
            text-align: left;
            margin-top: 10px;
            margin-bottom: 10px;
            font-size: 16px;
            font-family: “Arial”,”Microsoft YaHei”,”黑体”,”宋体”,sans-serif;
        }

        /*作者信息*/
        .container ul.myself{
            width: 100%;
            height: 60px;
            /*border: 1px solid red;*/
            display: inline-block;
            list-style: none;
            padding: 0;
            margin: 0;
            margin-top: 50px;
            /*border: 1px solid red;*/
        }
        .container ul.myself li{
            width:80px;
            height: 60px;
            line-height: 60px;
            /*border: 1px solid red;*/
            float: left;
            /*border: 1px solid red;*/
        }


        /*作者头像*/
        .container ul.myself li img{
            width: 50px;
            height: 50px;
            line-height: 50px;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border: 2px solid #5c83b7;
        }

        .container ul.myself li .username{
            font-size: 15px;

            color: gray;
        }



        /*结束*/

        .theEnd{
            margin-top: 60px;
            width: 100%;
            font-family: "Wawati SC";
            text-align: center;
            font-size: 17px;
            font-weight: 800;
            color: #26263d;

        }
        .theEnd span{
            color: #b0b8d2;
        }


        /*喜欢和分享*/
        .like-active{
            width: 100%;
            margin: 40px 0;
            /*border:1px solid red;*/
            overflow: hidden;

        }

        /*喜欢*/
        .like-active #like{
            float: left;
            border: 1px solid #ea6f5a;
            padding: 15px 25px;
            border-radius: 40px;
            display: inline-block;
            transition: all 0.5s ease-in-out;
        }
        .like-active #like:hover{
            border: 1px solid #6c7fd1;
        }
        .like-active #like a{
           color: #ea6f5a;

        }

        /*分享*/
        .like-active .share{
            float: right;
        }


        /*评论样式*/
        .commment{
            width:100%;
            /*border: 1px solid red;*/
        }

        .commment .commment_rigth{

            height: 160px;
            border: 3px solid rgba(83, 85, 136, 0.1);
        }

        .commment  .commment_rigth textarea{
            width: 100%;
            height: 100px;
            /*去除默认样式*/
            resize:none;
            outline: none;
            border-style:none;
            border-bottom: 2px solid rgba(83, 85, 136, 0.1);

        }


        .commment .commment_rigth .btn{
            width: 120px;
            background: #6c7fd1;
            color: #fff;
            float: right;
            border-radius:20px;
            margin-top: 10px;
            margin-right: 5px;

        }
        .commment  .commment_rigth .btn:hover{
            color: #fff;
        }


        /*发表评论人的头像*/
        .commment  .commment_left{
            /*border: 1px solid red;*/
        }
        .commment  .commment_left  img{
            width: 50px;
            height: 50px;
            border-radius:50%;

        }



        /*网友评论部分*/
        .commment .div1{
            font-family: "Wawati SC";
            width: 100%;
            height: 50px;
            line-height: 50px;
            margin-bottom: 20px;
            /*border: 1px solid red;*/
        }
        .commment .div1 .span1{
            font-weight: 800;
            font-size: 25px;
        }
        .commment .div1 .span2{
            font-size: 15px;
            color: gray;
        }
        /*评论数*/
        .commment .div1 .span3{
            color: #6c7fd1;
            font-weight: 800;
            float: right;
            transition: all 0.5s;
        }
        .commment .div1 .span3:hover{
            color: #d15059;
            font-size: 18px;
        }




        /*全部评论*/

        .div2{
            font-family: "Wawati SC";
            width: 100%;
            height: 50px;
            line-height: 50px;
            margin-top:20px;
        }

         .div2 .span4{
            font-weight: 800;
            font-size: 25px;
        }

         .div2 .span5{
            color: #6c7fd1;
            font-weight: 800;
            float: right;
        }

        /*评论*/
        .allComment .containts{
            margin-top: 10px;
           border-bottom: 1px solid #f7f6ff;
            padding-bottom: 10px;

        }
        .allComment .containts .myHead{
            width: 100%;
            height: 50px;
            /*border: 1px solid red;*/
            /*弹性布局*/
            display: inline-flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content:space-between;
            align-items:center;

        }

        .allComment .containts .myHead img{
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .allComment .containts .myBody{
            margin-top: 20px;
            margin-left: 50px;

        }



        /*已关注样式*/
        .follow{
            padding: 5px;
            border-radius:5px;
            background-color: #c9e5ff;
        }


    </style>

</head>
<body>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%--1:引入头部--%>
<jsp:include page="./common/header.jsp"></jsp:include>
<%--1:文章详情主体--%>
<div class="container">

    <div class="col-md-3"></div>
    <!-- 左边文章 -->
    <div class="col-md-6">
        <h1  class="title">${message.title}</h1>

        <ul class="myself">
                <%--作者信息--%>

                    <li>
                        <img alt="" src="<%=basePath%>${message.user.head}">
                        <%--<c:choose>--%>
                            <%--<c:when test="${follow.status eq '1'}">--%>
                                <%--<span  class="follow">已关注</span>--%>
                            <%--</c:when>--%>
                            <%--<c:otherwise>--%>
                                <%--<span onclick="addFollow()" class="follow">关注</span>--%>
                            <%--</c:otherwise>--%>
                        <%--</c:choose>--%>
                    </li>
                    <li><span class="username"><span class="glyphicon glyphicon-user" style="color: #b6bfd9"> </span> ${message.user.username}</span> </li>


        </ul>

        <%--内容--%>
        <div  class="content">
            ${message.content}
        </div>




        <%--结束--%>
        <div class="theEnd"><hr><span class="glyphicon glyphicon-menu-right"></span> THE END <span class="glyphicon glyphicon-menu-left"></span></div>





        <%--喜欢和分享--%>
        <div class="like-active">

            <div id="like" onclick="addLuad()">
                <a >
                    <span class="glyphicon glyphicon-heart"></span>
                    <span id="myLaudNum"> ${message.laud}</span>
                </a>
            </div>
            <div class="share-active share">
                <div class="bdsharebuttonbox"  >
                    <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友" style="background: url('${pageContext.request.contextPath}/img/QQ.png') no-repeat 0,0;background-size:cover;width: 45px;height: 45px;"></a>
                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信" style="background: url('${pageContext.request.contextPath}/img/weixin.png') no-repeat 0,0;background-size:cover;width: 45px;height: 45px;"></a>
                </div>
            </div>
        </div>

        <hr>

        <%--写评论--%>

        <section class="commment ">
            <%--网友评论--%>
            <div class="div1"><span class="span1">网友评论</span><span class="span2">文明上网，理性发言，违者打死</span>   <span class="span3">条评论</span><span class="span3 mySpan3">${comments.size()}</span></div>

            <%--评论头像以及评论框--%>

            <div class="row" >
                <div class="col-md-2 ">
                    <div class="commment_left">
                        <c:if test="${sessionScope.user!=null}">
                            <img src="<%=basePath%>${sessionScope.user.head}" >
                        </c:if>

                        <c:if test="${sessionScope.user==null}">
                            <img src="../../img/notlogin.jpg">
                        </c:if>
                    </div>

                </div>
                    <%--写评论--%>
                <div class="col-md-10  " >
                    <div class="commment_rigth">
                        <textarea  class="text_send" id="text_send"></textarea>
                        <div class="btn" onclick="comment()" >发布评论</div>
                    </div>
                </div>
            </div>



        </section>

        <div class="div2"><span class="span4">全部评论</span>   <span class="span5">最新</span></div>

        <section class="allComment">
              <%--添加节点--%>
            <span class="insert"></span>

              <%--全部评论展示   --%>
               <c:forEach items="${comments}" var="comment">
                   <div class="containts">
                       <div class="myHead">
                           <div>
                               <img src="<%=basePath%>${comment.user.head}">
                               <span >${comment.user.username}</span>
                           </div>
                           <div>

                               <span ><fmt:formatDate value='${comment.create_time}' pattern='yyyy-MM-dd'/></span>
                           </div>
                       </div>
                       <div class="myBody">
                               ${comment.content}
                       </div>
                   </div>
               </c:forEach>


        </section>




    </div>

    <div class="col-md-3"></div>



</div>


<%--1:引入页尾--%>
<jsp:include page="./common/footer.jsp"></jsp:include>

</body>

<script >
    // 分享
    window._bd_share_config={common:{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},share:{},image:{"viewList":["qzone","sqq","tsina","weixin"],"viewText":"分享到：","viewSize":"16"},selectShare:{"bdContainerClass":null,"bdSelectMiniList":["qzone","sqq","tsina","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];




    function time(){
        function time(s) {
            return s < 10 ? '0' + s: s;
        }
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        return year+'-'+time(month)+"-"+time(date);
    }


    var now=time();
    var cnum=${comments.size()};//获取当前评论数
    function comment(){
        cnum+=1;//每次点击评论，评论总数+1
        $(".mySpan3").text(cnum);//评论+
        //获取评论信息
        var content = $("#text_send").val();
        //文章id;
        var id=${message.id};
        //当前用户id
        var user_id=${sessionScope.user.id};

        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/show/comment/addComment",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({message_id:id,content:content,user_id:user_id}),
            success:function(){
                var str=`
                           <div class="containts">
                                   <div class="myHead">
                                       <div>
                                           <img src="<%=basePath%>${sessionScope.user.head}">
                                           <span >${sessionScope.user.username}</span>
                                       </div>
                                       <div>

                                           <span >`+now+`</span>
                                       </div>
                                   </div>
                                   <div class="myBody">
                                           `+content+`
                                   </div>
                           </div>
                    `;
                $(".insert").before(str);
            },
            error:function( XMLHttpRequest, textStatus, errorThrown){

            },


        });

        $(".text_send").val("");

    }

    // 添加喜欢
    var num=${message.laud};
    function addLuad() {
        $.ajax({
            type:"post",
            async: true,//
            url:"<%=request.getContextPath()%>/show/addLaud.do?messageId="+${message.id},
            success:function(){
                num++;
                $("#myLaudNum").text(num);
                $("#like").attr("onclick"," ");

            },
            error:function( XMLHttpRequest, textStatus, errorThrown){
                // $(".allComment").append("失败");
            },


        });
    }



    //添加关注insert
    function addFollow() {
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/show/comment/addFollow/${message.user.id}/${sessionScope.user.id}",
            success:function(data){
                $(".follow").text("已关注");
                $(".follow").attr("onclick","")
            },
            error:function( XMLHttpRequest, textStatus, errorThrown){
                 alert("失败")
            },


        });
    }



</script>

</html>
