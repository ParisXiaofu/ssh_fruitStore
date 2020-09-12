<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<%@ page import="com.flh.model.entity.Customer" %>
<%@ page import="com.flh.model.entity.Customerinfo" %>
<%@ page import="com.flh.model.entity.Address" %>
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
<title>用户地址管理</title>
</head>
<script src="js/jquery.js" type="text/javascript"></script>
<script>
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
   <div class="right Search">
   <form>
    <input name="" type="text"  class="Search_Box"/>
    <input name="" type="button"  name="" class="Search_btn"/>
    </form>
   </div>
 </div>
</div>
<!--用户中心(地址管理界面)-->
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
        <span class="name">地址管理</span>
       </div>
       <div class="about_user_info">
        <%if (session.getAttribute("address")==null){%>
         <form id="form1" name="form1" method="post" action="addAddress.action">
       <div class="user_layout">
        <ul>
         <li><label class="user_title_name">收件人姓名：
         </label><input name="addressRecName" type="text" class="add_text" ><em>*</em></li>
         <li><label class="user_title_name">省&nbsp;市&nbsp;区：</label>
          <input type="text" name="addressArea" class="add_text"><em>*</em></li>
         <li><label class="user_title_name">收货地址：</label>
          <input name="addressCity" type="text" class="add_text" ><em>*</em></li>
         <li><label class="user_title_name">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</label>
          <input name="addressEmail" type="text" class="add_text" ><em>*</em></li>
         <li><label class="user_title_name">手&nbsp;机&nbsp;号：</label>
          <input name="addressPhone" type="text" class="add_text" ><em>*</em></li>
         <li><label class="user_title_name">固定电话：</label>
          <input name="addressTel" type="text" class="add_text" ></li>
        </ul>
        <div class="operating_btn"><input name="buttom" type="submit" value="确认添加" class="submit—btn" id="buttoms"></div>
       </div>
         </form>
        <%}else {
         Address address=(Address) session.getAttribute("address");%>
         <form id="form1" name="form1" method="post" action="updateAddress.action">
          <div class="user_layout">
         <ul>
          <li><label class="user_title_name">收件人姓名：
          </label><input name="addressRecName" type="text" class="add_text" value="<%=address.getAddressRecName()%>"><em>*</em></li>
          <li><label class="user_title_name">省&nbsp;市&nbsp;区：</label>
           <input type="text" name="addressArea" class="add_text" value="<%=address.getAddressArea()%>"><em>*</em></li>
          <li><label class="user_title_name">收货地址：</label>
           <input name="addressCity" type="text" class="add_text" value="<%=address.getAddressCity()%>"><em>*</em></li>
          <li><label class="user_title_name">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</label>
           <input name="addressEmail" type="text" class="add_text" value="<%=address.getAddressEmail()%>"><em>*</em></li>
          <li><label class="user_title_name">手&nbsp;机&nbsp;号：</label>
           <input name="addressPhone" type="text" class="add_text" value="<%=address.getAddressPhone()%>"><em>*</em></li>
          <li><label class="user_title_name">固定电话：</label>
           <input name="addressTel" type="text" class="add_text"
                  <%if (address.getAddressTel()==null||address.getAddressTel().length()==0){%>
                  value=""<%}else {%>value="<%=address.getAddressTel()%>"><%}%></li>
         </ul>
         <div class="operating_btn"><input name="buttom" type="submit" value="确认修改" class="submit—btn" id="buttom"></div>
         </div>
          </form>
        <%}%>
       </div>
       <!--地址列表-->
       <div class="Address_List">
        <div class="title_name"><span class="name">用户地址列表</span></div>
        <div class="list">
         <table>
         <thead>
          <td class="list_name_title0">收件人姓名</td>
          <td class="list_name_title1">地区</td>
          <td class="list_name_title2">邮编</td>
          <td class="list_name_title3">电话</td>
          <td class="list_name_title4">收货地址</td>
          <td class="list_name_title5">操作</td>
         </thead>
           <c:forEach var="address" items="${sessionScope.addressList}">
          <tr>
           <input type="hidden"id="addressId" value="${address.addressId}"/>
           <td>${address.addressRecName}</td>
           <td>${address.addressArea}</td>
           <td>${address.addressEmail}</td>
           <td>${address.addressPhone}</td>
           <td>${address.addressCity}</td>
           <td><a href="getAddress.action?addressId=${address.addressId}">修改</a>
            <a href="deleteAddress.action?addressId=${address.addressId}">删除</a></td>
          </tr>
           </c:forEach>
         </table>

        </div>
       </div>
      </div>
   </div>
 </div>
</div>
<!--底部样式-->
<div class="footer">
 <div class="footer_img_bg">
  <div style="position: absolute;left: 95px;top: 45px;">
   <a href="/allAddress.action?pageIndex=1">首页</a>
   <a href="/allAddress.action?pageIndex=${pageIndex-1}">上一页</a>
   <u>${pageIndex}/${totalPage}</u>
   <a href="/allAddress.action?pageIndex=${pageIndex+1}">下一页</a>
   <a href="/allAddress.action?pageIndex=${totalPage}">尾页</a>
  </div>
 </div>
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
