
<!DOCTYPE html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script type="text/javascript" src="js/slide.js"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/jquery.foucs.js" type="text/javascript"></script>
 <script src="js/jquery.js" type="text/javascript"></script>
<!--[if IE 7]>
<link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
<![endif]-->
<title>产品列表页</title>
</head>
<script>
 $(function () {
     var goodsTypeId=101
     $.ajax({
         method:"post",
         url:"/sales.action",
         data:{"goodsTypeId":goodsTypeId},
         dataType:"json",
         success:function (data) {
             var result="";
             $(data).each(function (i) {
                 result+="<li class=\"\">\n" +
                     "     <em class=\"ranking_label\">"+(i+1)+"</em>\n" +
                     "     <a href=\"#\" class=\"img\"> <img src='images/fruit/"+this.goodsPic+"' width=\"100px\" height=\"100px\" /></a>\n" +
                     "     <p class=\"ranking_name\">"+this.goodsName+"</p>\n" +
                     "     <p class=\"price\"><b>￥</b>"+this.goodsPrice+"</p>\n" +
                     "     <p><a href='goodsDetail.action?goodsId="+this.goodsId+"'>立即查看< </a></p>\n" +
                     "     </li>"
             })
             $(".ranking_list").html(result);
         }
     })
 })
</script>
<body>
<!--顶部样式-->
<div class="top_header">
<em class="left_img"></em>
<div class="header clearfix" id="header">
<a href="#" class="logo_img"><img src="images/logo.png" /></a>
<div class="header_Section">
 <div class="shortcut">
  <ul>
   <li  class="hd_menu_tit"><em class="login_img"></em><a href="Login.jsp">登录</a></li>
   <li  class="hd_menu_tit"><em  class="registered_img"></em><a href="registered.jsp">注册</a></li>
   <li  class="hd_menu_tit"><em class="Collect_img"></em><a href="allCollection.action">收藏夹</a></li>
   <li  class="hd_menu_tit"><em class="cart_img"></em><a href="allCarfruit.action">购物车</a></li>
   <li  class="hd_menu_tit list_name" data-addclass="hd_menu_hover"><a href="#">网站导航</a><em class="navigation_img"></em>
     
    <div class="hd_menu_list">
     <span class="wire"></span>
		   <ul>
		    <li><a href="#">常见问题</a></li>
			<li><a href="#">在线退换货</a></li>
		    <li><a href="#">在线投诉</a></li>
			<li><a href="#">配送范围</a></li>
		   </ul>
		</div>	
   </li>
  </ul>
 </div>
 <div class="nav" id="Navigation">
  <ul class="Navigation_name">
   <li class=""><a href="index.jsp">首页</a></li>
   <li class=""><a href="Products.jsp">所有果蔬</a></li>
   <li class=""><a href="teamBuyIndex.action">活动专区</a></li>
   <li class=""><a href="fruitIndex.action">水果馆</a></li>
   <li class=""><a href="vegetablesIndex.action">蔬菜馆</a></li>
   <li class=""><a href="nutsIndex.action">坚果馆</a></li>
   <li class=""><a href="user.jsp">会员中心</a></li>
  </ul>
 </div>
 <script>$("#Navigation").slide({titCell:".Navigation_name li"});</script>
</div>
</div>
<em class="right_img"></em>
</div>
<!---->
<div><a href="#"><img src="images/AD_page_img_02.png" width="100%"/></a></div>
<!--位置-->
<div class="Bread_crumbs">
 <div class="Inside_pages clearfix">
   <div class="left">当前位置：<a href="#">首页</a>&gt;<a href="#">水果馆</a></div>
   <div class="right Search">
   <form>
    <input name="" type="text"  class="Search_Box"/>
    <input name="" type="button"  name="" class="Search_btn"/>
    </form>
   </div>
 </div>
</div>
<!--产品列表-->
<div class="Inside_pages clearfix">
<div class="margintop">
 <DIV class="left_style">
  <div class="title_img_p">
   <strong style="font-family: 楷体;font-size: 34px;position: relative;left: 58px;top: 50px;color: whitesmoke">水果馆</strong></div>
   <div class="ranking">
    <div class="ranking_title"><span>销量</span>排行</div>
    <ul class="ranking_list">

    </ul>
   </div>
 </DIV>
 <DIV class="right_style" id="fruit">
     <div align="center" class="pages_Collects clearfix">
         <a href="/fruitIndex.action?pageIndexs=1">首页</a>
         <a href="/fruitIndex.action?pageIndexs=${pageIndexs-1}">上一页</a>
         <strong ><u>${pageIndexs}/${totalPages}</u></strong>
         <a href="/fruitIndex.action?pageIndexs=${pageIndexs+1}">下一页</a>
         <a href="/fruitIndex.action?pageIndexs=${totalPages}">尾页</a>
     </div>
    <ul class="list_style" >
     <c:forEach var="goods" items="${sessionScope.goodsList}">
     <li class="clearfix">
       <div class="product_lists clearfix">
        <a href="addCollection4.action?goodsId=${goods.goodsId}" class="Collect"></a>
        <a href="#"><img src="images/fruit/${goods.goodsPic}"  width='207' height='219'/></a>
        <p class="title_p_name">${goods.goodsName}</p>
        <p class="title_Profile" style="height: 45px">${goods.goodsInfo}</p>
        <p class="price"><b>￥</b>${goods.goodsPrice}</p>
        <p class="btn_style"><a href="goodsDetail.action?goodsId=${goods.goodsId}" class="buy_btn"></a><a href="addCar2.action?goodsId=${goods.goodsId}&goodsPrice=${goods.goodsPrice}" class="Join_btn"></a></p>
        </div>
       </li>
     </c:forEach>
    </ul>
 </DIV>
 </div>
</div>
<!--底部样式-->
<div class="footer">
 <div class="footer_img_bg"></div>
 <div class="footerbox">
  <div class="footer_info">
    <div class="footer_left">
     <a href="#"><img src="images/logo.png" /></a>
     <p class="erwm">
     <img src="images/erweim.png"  width="80px" height="80px"/>
     <img src="images/erweim.png"  width="80px" height="80px"/>
     <p>
    </div>
    <div class="helper_right clearfix">
     <dl>
      <dt><em class="guide"></em>新手指南</dt>
      <dd><a href="#">注册新用户</a></dd>
      <dd><a href="#">实名认证</a></dd>
      <dd><a href="#">找回密码</a></dd>
     </dl>
     <dl>
      <dt ><em class="h_about"></em>关于我们</dt>
      <dd><a href="#">关于我们</a></dd>
      <dd><a href="#">政策服务</a></dd>
      <dd><a href="#">常见问题</a></dd>
     </dl>
     <dl>
      <dt ><em class="h_conact"></em>联系我们</dt>
      <dd><a href="#">联系我们</a></dd>
      <dd><a href="#">在线客服</a></dd>
     </dl>
    </div>
  </div>
 </div> 
 <div class=" Copyright ">
   @2015 四川莆田特色馆版权所有 
 </div>
</div>
</body>
</html>
