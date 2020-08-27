<%@ page import="com.flh.model.entity.Customer" %>
<%@ page import="com.flh.model.entity.Customerinfo" %>
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
<title>修改密码</title>
    <style>
        #msg1,#msg2,#msg3{color: red;font-size: 13px}
    </style>
</head>
<script>
    function pwd1() {
        var pwd1=$("#custPwd").val();
        if (pwd1.length==0){
            $("#msg1").html("原密码不能为空")
            return false;
        } else {
            $("#msg1").html("√")
            return true;
        }
    }
    function pwd2() {
        var pwd2=$("#custPwd1").val();
        if (pwd2.length==0){
            $("#msg2").html("请输入要修改的密码");
            return false;
        } else {
            $("#msg2").html("√");
            return true;
        }
    }
    function pwd3() {
        var pwd3=$("#custUpPwd").val();
        var pwd2=$("#custPwd1").val();
        if (pwd3.length==0){
            $("#msg3").html("请输入确认密码");
            return false;
        }
        else if (pwd3==pwd2){
            $("#msg3").html("√")
            return true;
        }else {
            $("#msg3").html("两次密码输入不正确！")
            return false;
        }
    }
    $(function () {
        $("#custPwd").blur(function () {
            pwd1();
        })
        $("#custPwd1").blur(function () {
            pwd2();
        })
        $("#custUpPwd").blur(function () {
            pwd3();
        })
        $("form").submit(function () {
            if (pwd1()&&pwd2()&&pwd3()){
              return true;
            }
            else {
                return false;
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
   <div class="right Search">
   <form>
    <input name="" type="text"  class="Search_Box"/>
    <input name="" type="button"  name="" class="Search_btn"/>
    </form>
   </div>
 </div>
</div>
<!--修改密码样式-->
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
    <!--右侧样式-->
    <div class="user_right">
      <div class="user_Borders">     
       <div class="title_name">
        <span class="name">修改密码</span>
       </div>
       <!--修改密码样式-->
       <div class="about_user_info">
        <form id="form1" name="form1" method="post" action="updatePwd.action">
       <div class="user_layout">
         <ul >
          <li><label class="user_title_name">原密码：</label><input name="custPwd" id="custPwd" type="password"  class="add_text"/>&nbsp;<span id="msg1"></span></li>
             <li><label class="user_title_name">新密码：</label><input name="custPwd1" id="custPwd1" type="password"  class="add_text"/>&nbsp;<span id="msg2"></span></li>
             <li><label class="user_title_name">确认新密码：</label><input name="custUpPwd" id="custUpPwd" type="password"  class="add_text"/>&nbsp;<span id="msg3"></span></li>
         </ul>
         <div class="operating_btn"><input name="name" type="submit" value="确认"  class="submit—btn"/></div>
         </div>
          </form>
        
       </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
