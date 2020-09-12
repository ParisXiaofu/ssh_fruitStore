<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
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

<!--[if IE 7]>
<link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
<![endif]-->
<title>商品团购</title>
</head>

<script>
    $(function () {
        $.ajax({
            method:"post",
            url:"/rankTeamGoods.action",
            dataType:"json",
            success:function (data) {
                var result = "";
                var i=1;
                $(data).each(function (i) {
                    if (this.goodstype.goodsTypeId==101){
                    result += "<div class=\"right_Group_p_style\">\n" +
                        "       <div class=\"clearfix\">\n" +
                        "        <div class=\"left_Group_name\">\n" +
                        "        <a href='addCollection6.action?goodsId="+this.goodsId+"' class=\"Collect\"></a>\n" +
                        "         <ul>\n" +
                        "          <li class=\"Group_p_name\"><strong style='font-size: 30px;color: red'>"+(i+1)+":</strong><a href=\"#\">" + this.goodsName + "</a></li>\n" +
                        "          <li class=\"Group_p_about\" style='height: 45px'>" + this.goodsInfo + "</li>\n" +
                        "          <Li class=\"spacing\">礼盒：商家自供</Li>\n"+
                        "          <li class=\"Group_price\"><span class=\"Current_price\"><i>￥</i>" + this.teamBuyPrice + "</span> <span class=\"Group_List\">原价：" + this.goodsPrice + "</span></li>\n" +
                        "          <li class=\"Group_p_buy\">\n" +
                        "           <span class=\"Group_Number\"><em></em>" + this.goodsSales + "人购买</span>\n" +
                        "           <span class=\"Group_button right\"><a href=\"#\" class=\"buy_button\"></a></span>\n" +
                        "          </li>\n" +
                        "         </ul>\n" +
                        "        </div>\n" +
                        "        <div class=\"right_Group_img\">" +
                        "       <a href=\"\" id='pic'>" +
                        "       <img src='images/fruit/"+this.goodsPic+"'  height=\"370\" width=\"365\"/>"+
                        "       </a></div>\n" +
                        "       </div>\n" +
                        "        <div class=\"Group_time\">\n" +
                        "         <em></em>系统故障，敬请谅解！" +
                        "       </div>\n" +
                        "     </div>";
                    }
                    if (this.goodstype.goodsTypeId==102){
                        result += "<div class=\"right_Group_p_style\">\n" +
                            "       <div class=\"clearfix\">\n" +
                            "        <div class=\"left_Group_name\">\n" +
                            "        <a href='addCollection6.action?goodsId="+this.goodsId+"' class=\"Collect\"></a>\n" +
                            "         <ul>\n" +
                            "          <li class=\"Group_p_name\"><strong style='font-size: 30px;color: red'>"+(i+1)+":</strong><a href=\"#\">" + this.goodsName + "</a></li>\n" +
                            "          <li class=\"Group_p_about\" style='height: 45px'>" + this.goodsInfo + "</li>\n" +
                            "          <Li class=\"spacing\">礼盒：商家自供</Li>\n"+
                            "          <li class=\"Group_price\"><span class=\"Current_price\"><i>￥</i>" + this.teamBuyPrice + "</span> <span class=\"Group_List\">原价：" + this.goodsPrice + "</span></li>\n" +
                            "          <li class=\"Group_p_buy\">\n" +
                            "           <span class=\"Group_Number\"><em></em>" + this.goodsSales + "人购买</span>\n" +
                            "           <span class=\"Group_button right\"><a href=\"#\" class=\"buy_button\"></a></span>\n" +
                            "          </li>\n" +
                            "         </ul>\n" +
                            "        </div>\n" +
                            "        <div class=\"right_Group_img\">" +
                            "       <a href=\"\" id='pic'>" +
                            "       <img src='images/vegtables/"+this.goodsPic+"'  height=\"370\" width=\"365\"/>"+
                            "       </a></div>\n" +
                            "       </div>\n" +
                            "        <div class=\"Group_time\">\n" +
                            "         <em></em>系统故障，敬请谅解！" +
                            "       </div>\n" +
                            "     </div>";
                    }
                    if (this.goodstype.goodsTypeId==103){
                        result += "<div class=\"right_Group_p_style\">\n" +
                            "       <div class=\"clearfix\">\n" +
                            "        <div class=\"left_Group_name\">\n" +
                            "        <a href='addCollection6.action?goodsId="+this.goodsId+"' class=\"Collect\"></a>\n" +
                            "         <ul>\n" +
                            "          <li class=\"Group_p_name\"><strong style='font-size: 30px;color: red'>"+(i+1)+":</strong><a href=\"#\">" + this.goodsName + "</a></li>\n" +
                            "          <li class=\"Group_p_about\" style='height: 45px'>" + this.goodsInfo + "</li>\n" +
                            "          <Li class=\"spacing\">礼盒：商家自供</Li>\n"+
                            "          <li class=\"Group_price\"><span class=\"Current_price\"><i>￥</i>" + this.teamBuyPrice + "</span> <span class=\"Group_List\">原价：" + this.goodsPrice + "</span></li>\n" +
                            "          <li class=\"Group_p_buy\">\n" +
                            "           <span class=\"Group_Number\"><em></em>" + this.goodsSales + "人购买</span>\n" +
                            "           <span class=\"Group_button right\"><a href=\"#\" class=\"buy_button\"></a></span>\n" +
                            "          </li>\n" +
                            "         </ul>\n" +
                            "        </div>\n" +
                            "        <div class=\"right_Group_img\">" +
                            "       <a href=\"\" id='pic'>" +
                            "       <img src='images/Nuts/"+this.goodsPic+"'  height=\"370\" width=\"365\"/>"+
                            "       </a></div>\n" +
                            "       </div>\n" +
                            "        <div class=\"Group_time\">\n" +
                            "         <em></em>系统故障，敬请谅解！" +
                            "       </div>\n" +
                            "     </div>";
                    }
                });
                $("#rank").html(result);
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
<div style="background:url(images/group_img.jpg) no-repeat; height:472px; width:100%; background-position:center"></div>
<!--位置-->
<div class="Bread_crumbs">
 <div class="Inside_pages clearfix">
   <div class="left">当前位置：<a href="#">首页</a>&gt;<a href="#">素菜馆</a></div>
   <div class="right Search">
   <form>
    <input name="" type="text"  class="Search_Box"/>
    <input name="" type="button"  name="" class="Search_btn"/>
    </form>
   </div>
 </div>
</div>

<!--团购样式-->
<div class="Inside_pages clearfix" >
 <div class="Group_buy">
    <div class="Group_title"><em></em>今日团购<span>GROUP-BUYING</span></div>
    <div class="Group_list clearfix">
     <div class="left_Group">
         <c:forEach var="goods" items="${sessionScope.TeamGoodsList}">
      <div class="Group_prodcut" >
      <div class="clearfix">
       <div class="Group_info">
         <ul>
          <li class="Group_p_name"><a href="#">${goods.goodsName}</a></li>
          <li class="Group_p_about" style="height: 45px">${goods.goodsInfo}</li>
          <Li>礼盒：商家自供</Li>
          <li class="Group_price"><span class="Current_price"><i>￥</i>${goods.teamBuyPrice}</span> <span class="Group_List">原价：${goods.goodsPrice}</span></li>
          <li class="Group_p_buy" >
           <span class="Group_Number"><em></em>${goods.goodsSales}人购买</span>
           <span class="Group_button right"><a href="#" class="buy_button"></a></span>
          </li>
         </ul>
       </div>
       <div class="Group_img"><a href="">
           <c:if test="${goods.goodstype.goodsTypeId==101}">
               <img src="images/fruit/${goods.goodsPic}" height="230" width="365"/>
           </c:if>
           <c:if test="${goods.goodstype.goodsTypeId==102}">
               <img src="images/vegtables/${goods.goodsPic}" height="230" width="365"/>
           </c:if>
           <c:if test="${goods.goodstype.goodsTypeId==103}">
               <img src="images/Nuts/${goods.goodsPic}" height="230" width="365"/>
           </c:if>
       </a></div>
       </div>
       <div class="Group_time">
         <em></em>系统故障，敬请谅解！
       </div>
      </div>
         </c:forEach>
         <div class="pages_Collect clearfix"  >
             <a href="/teamBuyIndex.action?pageIndexTeam=${pageIndexTeam-1}" class="on">《</a>
             <c:forEach var="num" items="${TeamtotalPageList}">
                 <a href="/teamBuyIndex.action?pageIndexTeam=${num}" id="num" >${num}</a>
             </c:forEach>
             <a href="/teamBuyIndex.action?pageIndexTeam=${pageIndexTeam+1}" style="background-color:#FF6600;color:white ">》</a>
         </div>
     </div>
     <!--右侧团购样式-->
     <div class="right_Group" >
        <div  class="Group_title"><em></em>促销榜<span>PROMOTIONS</span></div>
<div style="height: 30px"></div>

<div id="rank">

</div>
     <!--团购列表-->

     </div>
    </div>
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
