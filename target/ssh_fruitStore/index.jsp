<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.flh.model.entity.Customer" %>
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
<title>易田商城首页</title>
</head>
<script>
    //最新上架
    $(function () {
        var goodsTypeId=101
        $.ajax({
           method:"post",
            url:"newGoods.action",
            data:{"goodsTypeId":goodsTypeId},
            dataType:"json",
            success:function (data) {
                var result="";
                $(data).each(function () {
                result+=" <div class=\"AD1\"><a href='goodsDetail.action?goodsId="+this.goodsId+"'><img src='images/fruit/"+this.goodsPic+"' /></a></div>"
                });
                $("#fruit").html(result);
            }
        })
    })
    $(function () {
        var goodsTypeId=102
        $.ajax({
            method:"post",
            url:"newGoods.action",
            data:{"goodsTypeId":goodsTypeId},
            dataType:"json",
            success:function (data) {
                var result="";
                $(data).each(function () {
                    result+=" <div class=\"AD1\"><a href='goodsDetail.action?goodsId="+this.goodsId+"'><img src='images/vegtables/"+this.goodsPic+"' /></a></div>"
                });
                $("#vegetables").html(result);
            }
        })
    })
    $(function () {
        var goodsTypeId=103
        $.ajax({
            method:"post",
            url:"newGoods.action",
            data:{"goodsTypeId":goodsTypeId},
            dataType:"json",
            success:function (data) {
                var result="";
                $(data).each(function () {
                    result+=" <div class=\"AD1\"><a href='goodsDetail.action?goodsId="+this.goodsId+"'><img src='images/Nuts/"+this.goodsPic+"' /></a></div>"
                });
                $("#nuts").html(result);
            }
        })
    })
</script>
<script>
    if (${empty goodsListTop}){
        location.href="/rankGoods.action"
    }
    if (${empty goodsListBu}){
        location.href="/RecommendGoods.action"
    }
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
<!--幻灯片样式-->
<div class="AD_bg_img">
 <!--幻灯片样式-->
	  <div class="slider">
	   <div id="slideBox" class="slideBox">
			<div class="hd">
				<ul></ul>
			</div>
			<div class="bd">
				<ul>
					<li><a href="#" target="_blank"><img src="images/AD_img.png" /></a></li>
			        <li><a href="#" target="_blank"><img src="images/AD_img.png" /></a></li>
				</ul>
			</div>
			<a class="prev" href="javascript:void(0)"></a>
			<a class="next" href="javascript:void(0)"></a>
		</div>
		<script type="text/javascript">
		jQuery(".slideBox").slide({titCell:".hd ul",mainCell:".bd ul",autoPlay:true,autoPage:true,interTime:9000});
		</script>
	  </div>   
</div>
<!--手风琴效果-->
<div class="recommend_style ">
 <em class="ye_img"></em>
<div class="mian">
 <div class="title_name"><a href="teamBuyIndex.action" class="link_name">最新促销</a></div>
 <div class="carouFredSel">
 <script type="text/javascript" src="js/slider.js"></script>
 <div id="center">
 <div id="slider">
<c:forEach var="goods" items="${sessionScope.goodsListTop}">
   <div class="slide">
    <a href="goodsDetail.action?goodsId=${goods.goodsId}" title="酒店会所设计" target="_blank">
        <c:if test="${goods.goodstype.goodsTypeId==101}">
            <img class="diapo" border="0" src="images/fruit/${goods.goodsPic}" style="opacity: 1; visibility: visible;">
        </c:if>
        <c:if test="${goods.goodstype.goodsTypeId==102}">
            <img class="diapo" border="0" src="images/vegtables/${goods.goodsPic}" style="opacity: 1; visibility: visible;">
        </c:if>
        <c:if test="${goods.goodstype.goodsTypeId==103}">
            <img class="diapo" border="0" src="images/Nuts/${goods.goodsPic}" style="opacity: 1; visibility: visible;">
        </c:if>
    </a>
   <div class="backgroundText_name" >
    <div class="product_info">
     <h2>${goods.goodsName}</h2>
     <p>原价：<b>￥${goods.goodsPrice}</b></p>
     </div>
     <div class="product_price">
     <a href="#" class="price_btn">
     <p class="left_title_p"></p>
     <p class="zj_bf"><em>￥</em>${goods.teamBuyPrice}</p>
     <p class="right_buf"></p>
     </a>
     </div>
   </div>
    <div class="text"></div>
   </div>
</c:forEach>
   </div>
   </div>
<script type="text/javascript">/* ==== start script ==== */
slider.init();
</script>
 </div>  
</div>
 <em class="ye_img1"></em>
</div>
<!--最新上架产品样式-->
 <div class="new_products clearfix">
   <div class="mian">
    <div id="slideBox_list" class="slideBox_list">
     <div class="hd">
	  <div class="title_name"></div>
	  <div class="list_title"><ul>
          <li><h3>01</h3><a href="fruitIndex.action">水果</a></li>
          <li><h3>02</h3><a href="vegetablesIndex.action">蔬菜</a></li>
          <li><h3>03</h3><a href="nutsIndex.action">坚果</a></li>
          <a href="Products.jsp" style="color: white;font-size: 16px"><li><h3>04</h3>ALL</li></a>
      </ul></div>
    </div>
    
    <div class="bd">
     <div class="fixed_title_name">
      <span>新鲜</span>
     </div>
      <ul class="">
      <li class="advertising">
          <div id="fruit">

          </div>
          <div style="width: 150px;height:508px;background-image: url(images/title_img_new.png);margin-left: 1122px;border: 3px solid whitesmoke"></div>
        </li>
       <li class="advertising">
           <div id="vegetables">

           </div>
           <div style="width: 150px;height:508px;background-image: url(images/title_img_new.png);margin-left: 1122px;border: 3px solid whitesmoke"></div>
     </li>
      <li class="advertising">
          <div id="nuts">

          </div>
          <div style="width: 150px;height:508px;background-image: url(images/title_img_new.png);margin-left: 1122px;border: 3px solid whitesmoke"></div>
     </li>
     </ul>     
    </div>
   </div>
    <script type="text/javascript">jQuery(".slideBox_list").slide({mainCell:".bd ul"});</script>
  </div>
 </div>
 <!--产品推荐样式-->
 <div class="p_Slideshow">
  <div class="mian">
   <div class="title_style">
    <div class="title_img"></div>
    <div class="title_link_name">
<c:forEach var="goods" items="${sessionScope.goodsListBu}">
    <a href="goodsDetail.action?goodsId=${goods.goodsId}">${goods.goodsName}</a>
</c:forEach>

    </div>
   </div> 
  </div> <!--幻灯片样式-->
    <div id="main">   
        <div id="index_b_hero">
         <div class="title_img"></div>
            <div class="hero-wrap">
                <ul class="heros clearfix">
<c:forEach var="goods" items="${sessionScope.goodsListBu}">
                    <li class="hero">
                        <a href="goodsDetail.action?goodsId=${goods.goodsId}" target="_blank" title="第一张图的说明">
                            <c:if test="${goods.goodstype.goodsTypeId==101}">
                                <img src="images/fruit/${goods.goodsPic}" class="thumb" alt="" />
                            </c:if>
                            <c:if test="${goods.goodstype.goodsTypeId==102}">
                                <img src="images/vegtables/${goods.goodsPic}" class="thumb" alt="" />
                            </c:if>
                            <c:if test="${goods.goodstype.goodsTypeId==103}">
                                <img src="images/Nuts/${goods.goodsPic}" class="thumb" alt="" />
                            </c:if>
                        </a>
                        <div class="p_title_name">
                          <div class="p_recommend_info">
                           <h3>${goods.goodsName}</h3>
                           <p>新鲜包邮价：￥<b class="p_recommend_price">${goods.goodsPrice}</b>元</p>
                          </div>
                        </div>
                    </li>
</c:forEach>
                </ul>
            </div>
            <div class="helper">
                <div class="mask-left">
                </div>
                <div class="mask-right">
                </div>
                <a href="javascript:void(0)" class="prev icon-arrow-a-left"></a>
                <a href="javascript:void(0)" class="next icon-arrow-a-right"></a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $.foucs({ direction: 'right' });
    </script> 
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
