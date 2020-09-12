<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<%@ page import="com.flh.model.entity.Customer" %>
<%@ page import="com.flh.model.entity.Customerinfo" %>

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
<title>用户积分</title>
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
   <div class="right Search">
   <form>
    <input name="" type="text"  class="Search_Box"/>
    <input name="" type="button"  name="" class="Search_btn"/>
    </form>
   </div>
 </div>
</div>
<!--用户中心(积分)-->
<div class="Inside_pages clearfix">
  <div class="clearfix user" >
  <!--左侧菜单栏样式-->
   <div class="user_left">
      <div class="user_info">
       <div class="Head_portrait">
           <%Customerinfo customerinfo=(Customerinfo) session.getAttribute("customerInfo");%>
           <%if (customerinfo==null||customerinfo.getCustPic().length()==0){%>
           <img src="images/product_img_17.png"  width="100px" height="100px"/>
           <%}else{%>
           <img src="upload/<%=customerinfo.getCustPic()%>"width="100px" height="100px"/><%}%>
           <!--头像区域--></div>
          <div class="user_name">
              <% Customer customer=(Customer) session.getAttribute("customer");%>
              <%if(customer==null){%><a href="Login.jsp">登录</a><%}else{%>
              <strong>欢迎:<%=customer.getCustName()%></strong>&nbsp;
              <a id="loginOut" style="color: red;cursor: pointer" href="loginOut.action"><u>退出</u></a><%}%></div>
      </div>
      <ul class="Section">
          <li><a href="custInfoSelect.action"><em></em><span>个人信息</span></a></li>
          <li><a href="user_Password.jsp"><em></em><span>修改密码</span></a></li>
          <li><a href="user.jsp"><em></em><span>我的订单</span></a></li>
          <li><a href="custPoint.action"><em></em><span>我的积分</span></a></li>
          <li><a href="allCollection.action"><em></em><span>我的收藏</span></a></li>
          <li><a href="allAddress.action"><em></em><span>收货地址管理</span></a></li>
      </ul>
    </div>
    <!--右侧内容样式-->
     <div class="user_right">
      <div class="user_Borders">
      <div class="title_name">
        <span class="name">用户积分</span>
       </div>
       <!--积分样式-->
       <div class="user_integral_style slideTxtBox">
         <div class="hd">
          <ul>
           <li>积分获取记录</li>
           <LI>积分使用记录</LI>
          </ul>
         </div>
         <div class="bd">
           <ul>
            <div class="Integral_Number"><em></em>你当前的积分：<b>
                <c:forEach var="custpoint" items="${sessionScope.custpointList}">

                    <c:forEach var="custpointPay" items="${sessionScope.custpointListPay}">
                        ${custpoint-custpointPay}
                    </c:forEach>

                </c:forEach>
            </b></div>
            <table>
             <thead>
               <tr>
                <td>积分获取订单号</td>
                <td>订单金额</td>
                <td>积分</td>
                <td>获取日期</td>
               </tr>
             </thead>
             <tbody>
             <c:forEach var="custpoint" items="${sessionScope.custpointList1}">
               <td>4546546546454${custpoint.pointId}</td>
               <td>${custpoint.orders.ordersTotalPage}</td>
               <td>${custpoint.pointNum}</td>
               <td>${custpoint.orders.ordersCreateTime}</td>
              </tr>
             </c:forEach>
             <tr>
             </tbody>
            </table>
           </ul>
           <ul>
           <div class="Integral_Number"><em></em>你消费的积分：<b> <c:forEach var="custpointPay" items="${sessionScope.custpointListPay}">
              ${custpointPay}
           </c:forEach></b></div>
           </ul>
         </div>
       </div>
       <script>jQuery(".slideTxtBox").slide({trigger:"click"});</script>
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
