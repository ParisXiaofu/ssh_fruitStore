<%@ page import="com.flh.model.entity.Customer" %>
<%@ page import="com.flh.model.entity.Customerinfo" %>
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
<title>积分商城</title>
</head>

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
   <div class="left">当前位置：<a href="#">首页</a>&gt;<a href="#">素菜馆</a></div>
   <div class="right Search">
   <form>
    <input name="" type="text"  class="Search_Box"/>
    <input name="" type="button"  name="" class="Search_btn"/>
    </form>
   </div>
 </div>
</div>
<!--积分商城-->
<div class="Inside_pages clearfix">
  <div class="integral_style">
      <%Customerinfo customerinfo=(Customerinfo) session.getAttribute("customerInfo");%>
      <% Customer customer=(Customer) session.getAttribute("customer");%>
   <div class="integral_title"><em></em>积分商城<span>POINTS MALL</span></div>
   <div class="integral_user">
     <div class="user_name left">
      <a href="#" class="left">
          <img src="upload/<%=customerinfo.getCustPic()%>"width="60px" height="60px"/></a>
      <p class="left integral_user_name"><b><%=customer.getCustName()%></b> <a href="user.jsp">会员中心</a></p>
     </div>
     <div class="integral left">我的积分：
         <c:forEach var="custpoint" items="${sessionScope.custpointList}">
             <c:if test="${empty custpoint}">
                 0
             </c:if>
             ${custpoint}
         </c:forEach><a href="#">[查看明细]</a></div>
   </div>
   <!--列表样式-->
    <div class="integral_p_list">
        <div align="center"  class="pages_Collects clearfix">
            <a href="/goodsPointIndex.action?pageIndexp=1">首页</a>
            <a href="/goodsPointIndex.action?pageIndexp=${pageIndexp-1}">上一页</a>
            <strong ><u>${pageIndexp}/${totalPagep}</u></strong>
            <a href="/goodsPointIndex.action?pageIndexp=${pageIndexp+1}">下一页</a>
            <a href="/goodsPointIndex.action?pageIndexp=${totalPagep}">尾页</a>
        </div>
     <ul class="list_style">
         <c:forEach var="goods" items="${sessionScope.goodsListPoint}">
     <li class="clearfix">
       <div class="product_lists clearfix">
        <a href="addCollection7.action?goodsId=${goods.goodsId}" class="Collect"></a>
        <a href="#">
            <c:if test="${goods.goodstype.goodsTypeId==101}">
                <img src="images/fruit/${goods.goodsPic}" width='207' height='219'/>
            </c:if>
            <c:if test="${goods.goodstype.goodsTypeId==102}">
                <img src="images/vegtables/${goods.goodsPic}" width='207' height='219'/>
            </c:if>
            <c:if test="${goods.goodstype.goodsTypeId==103}">
                <img src="images/Nuts/${goods.goodsPic}" width='207' height='219'/>
            </c:if>
            </a>
        <p class="title_p_name">${goods.goodsName}</p>
        <p class="title_Profile" style="height: 45px">${goods.goodsInfo}</p>
        <p class="price">${goods.pointBuyPrice}积分</p>
        <p class="btn_style"><span class="Original_price">原价：${goods.goodsPrice}元</span><a href="javascript;('')" class="integral_buy_btn"></a></p>
        </div>
       </li>
         </c:forEach>
    </ul>
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
