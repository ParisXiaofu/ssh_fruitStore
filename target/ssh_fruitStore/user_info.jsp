<%@ page import="com.flh.model.entity.Customerinfo" %>
<%@ page import="com.flh.model.entity.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
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
<title>用户中心</title>
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
<!--用户中心-->
<div class="Inside_pages clearfix">
  <div class="clearfix user" >
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
    <div class="user_right">
      <div class="user_Borders">
       <div class="title_name">
        <span class="name">个人信息设置</span>
       </div>
       <div class="about_user_info">
           <form id="form1" name="form1" method="post" action="updateCustInfo.action">
               <div class="user_layout">
                   <ul>
                       <li>
                           <label class="user_title_name">用户头像：</label>
                           <input type="file" name="file">
                           <input type="reset" value="重置"></li>
                       <li><label class="user_title_name">用户昵称：
                       </label><input name="custNames" type="text"  class="add_text"
                                      <%if(customerinfo.getCustomer().getCustName()==null){ %>value=""<%}else{%>value="<%=customerinfo.getCustomer().getCustName()%>"<%}%>/><em>*</em></li>
                       <li><label class="user_title_name">真实姓名：
                       </label><input name="custTname" type="text"  class="add_text"
                                      <%if(customerinfo.getCustTname()==null){ %>value=""<%}else{%>value="<%=customerinfo.getCustTname()%>"<%}%>/><em>*</em></li>
                       <li><label class="user_title_name">用户性别：
                       </label>
                           <label class="sex"><input type="radio" name="custSex" value="男" id="RadioGroup1_0"<%if (customerinfo.getCustSex().equals("男")){%>checked<%}else if(customerinfo.getCustSex()==null){%>checked<%}%>/><span>男</span></label>
                           <label class="sex"><input type="radio" name="custSex" value="女" id="RadioGroup1_1" <%if(customerinfo.getCustSex().equals("女")){%>checked<%}%>/><span>女</span></label>
                           <em>*</em></li>
                       <li><label class="user_title_name">手&nbsp;机&nbsp;号：
                       </label><input name="custTel" type="text"  class="add_text"
                                      value="<%=customerinfo.getCustomer().getCustTel()%>"/><em>*</em></li>
                       <li><label class="user_title_name">邮箱地址：
                       </label><input name="custEmail" type="text"  class="add_text"
                                      <%if(customerinfo.getCustEmail()==null){ %>value=""<%}else{%>value="<%=customerinfo.getCustEmail()%>"<%}%>/><em>*</em></li>
                   </ul>
                   <div class="operating_btn"><input name="name" type="submit" value="提交"  class="submit—btn"/></div>
               </div>
           </form>
       </div>
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
