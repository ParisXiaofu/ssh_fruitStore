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
 <script src="js/register.js" type="text/javascript"></script>
<title>用户注册</title>
</head>
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
 function change() {
     document.getElementById("yzm").src="/YzmServlet?id="+Math.random();
 }
function tel() {
    var tel=$("#custTel").val();
    var reg=/^\w{11}$/;
    if (reg.test(tel)){
        $("#tel").html("√")
     return true;
    }else if (tel.length==0) {
        $("#tel").html("请输入电话")
        return false;
    }else {
       $("#tel").html("电话长度必须为11位")
        return false;
    }
}
function name() {
    var  names=$("#custName").val();
    if (names.length==0){
        $("#name").html("请输入名字");
        return false;
    } else {
        $("#name").html("√");
        return true;
    }
 }
    function pwd() {
        var pwd=$("#custPwdC").val();
        var reg=/^\w{6,20}$/
        if (reg.test(pwd)){
            $("#pwd1").html("√");
            return true;
        } else  if (pwd.length==0){
            $("#pwd1").html("请输入密码！");
            return false;
        } else {
            $("#pwd1").html("密码的长度为6-20位")
            return false;
        }
    }
    function pwdCheck() {
        var pwdC=$("#custPwd").val();
        var  pwd=$("#custPwdC").val();
        if (pwdC.length==0) {
            $("#pwd").html("请输入确认密码");
            return false
        }
        else  if (pwdC==pwd){
            $("#pwd").html("√");
            return true
        }else {
            $("#pwd").html("两次密码输入不正确")
            return false
        }
    }
    $(function () {
        $("#custTel").blur(function () {
            tel();
        });
        $("#custName").blur(function () {
          name();
        });
        $("#custPwd").blur(function () {
            pwd();
        });
        $("#custPwdC").blur(function () {
           pwdCheck();
        });
        $("form").submit(function () {
            if (tel() &&name()&&pwd()&&pwdCheck()){
                return true
            }else {
                return false
            }
        })
    })

</script>
<style>
 #yzm{
  width: 90px;
position: relative;
left: 10px;
 }
 #change{
position: relative;
  top: -10px;
  font-size: 18px;
 }
 span{color: #CC0000;}
</style>
<body >
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
<!--注册样式-->
<div class="Inside_pages clearfix">
 <div class="register">
     <div class="register_style">
      <div class="u_register">
       <form action="custRegister.action" method="post" >
        <ul>
         <li><label class="name">手机号码：</label><input name="custTel" id="custTel" type="text"  class="text_Add" /><span id="tel"></span></li>
         <li><label class="name">用户名称：</label><input name="custName" id="custName" type="text"  class="text_Add" /><span id="name"></span></li>
         <li><label class="name">设置密码：</label><input name="" type="password" id="custPwdC"  class="text_Add" placeholder="6-20个字符，由字母、数字和符号的两种以上组合"/><span id="pwd1"></span></li>
         <li><label class="name">确认密码：</label><input name="custPwd" type="password" id="custPwd"  class="text_Add" /><span id="pwd"></span></li>
         <li><label class="name">验&nbsp;证&nbsp;码：</label><input name="custYzm" type="text"  class="text_verification"/><img src="/YzmServlet" id="yzm"/>&nbsp;&nbsp;<span id="change" style="text-align: center;cursor:pointer;"><a onclick="change()"><u>换一张</u></a></span></li>
        </ul>
         <div class="auto-register"><label class="auto-label"><input type="checkbox" id="rememberMe"><span ><a href="#">《国际商贸城网站注册协议》</a></span></label></div>
         <div class="register-btn"><input type="submit" class="btn_register" value="注册"></div>
       </form>
      </div>
     </div>
     <div class="register_img"><img src="images/Register_img.png" /></div>
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
