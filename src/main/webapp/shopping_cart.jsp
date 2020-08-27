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
 <script src="js/jquery.js" type="text/javascript"></script>
<title>购物车</title>
</head>
<script>
        function jia(jia,price) {
            var num = parseInt($("#goodsNum"+jia+"").val());
            var carId=parseInt(jia);
            var goodsPrice=parseFloat(price);
            var kc = $("#kc").val();
            if (num >= kc) {
                alert("当前库存不足")
                num = kc
                location.href="updateCar.action?carId="+carId+"&goodsNum="+num+"&goodsPrice="+goodsPrice+"";
            } else {
                num += 1
                location.href="updateCar.action?carId="+carId+"&goodsNum="+num+"&goodsPrice="+goodsPrice+"";
            }

            $("#goodsNum"+jia+"").val(num)
        }
        function jian(jian,price) {
            var num = parseInt($("#goodsNum"+jian+"").val());
            var carId=parseInt(jian);
            var goodsPrice=parseFloat(price);
            if (num <= 1) {
                alert("再减就没有啦！")
                num = 1
                location.href="updateCar.action?carId="+jian+"&goodsNum="+num+"&goodsPrice="+goodsPrice+"";
            } else {
                num -= 1
                location.href="updateCar.action?carId="+jian+"&goodsNum="+num+"&goodsPrice="+goodsPrice+"";
            }

            $("#goodsNum"+jian+"").val(num)
        }

function goods() {
    if (${empty carList}&&${empty carList1}&&${empty carList2}){
        alert("购物车为空！！");
    }
    if (${!empty carList}||${!empty carList1}||${!empty carList2}) {
        location.href="allGoods.action"
    }
}
</script>
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
<!--购物车样式-->
<div class="Narrow">
  <div class="shop_cart">
     <div class="schedule"></div>
     <div class="cart_style">
       <div class="title_name">
        <ul>
         <li class="title_width"><label class="auto-label"><input type="checkbox" id="rememberMe"><span>全选</span></label></li>
         <li class="title_width1">商品信息</li>
         <li class="title_width2">单价</li>
         <li class="title_width3">数量</li>
         <li class="title_width4">小计</li>
         <li class="title_width5">操作</li>
        </ul>
       </div>
       <div class="list_style">
        <div class="class_title" id="fruit">水果馆</div>
        <c:forEach var="car" items="${sessionScope.carList}">
        <ul class="product_cart">
         <li class="title_width"><input type="checkbox" ></li>
         <li class="title_width1">
          <a href="#" class="product_img left"><img src="images/fruit/${car.goods.goodsPic}" /></a>
          <p class="cart_content">
           <a href="#" class="title_name">${car.goods.goodsName}</a>
           <span> 包装：商家自供</span>
          </p>
         </li>
         <li class="title_width2">￥${car.goods.goodsPrice}</li>
         <li class="title_width3">
          <input type="hidden" id="kc" value="${car.goods.goodsInventory}">
          <div class="Numbers">
           <input type="button" value="-" class="jian"  id="substract" style="background-color:white;width: 30px;height: 30px;font-size: 15px;" onclick="jian(${car.carId},${car.goods.goodsPrice})">
           <input id="goodsNum${car.carId}" name="goodsNum" class="goodsNum" size="6" value="${car.goodsNum}" style="width: 30px;height: 23px;text-align: center" />
           <input type="button" value="+" class="jia" id="add"style="background-color:white;width: 30px;height: 30px;font-size: 15px" onclick="jia(${car.carId},${car.goods.goodsPrice})">
          </div>
         </li>
         <li class="title_width4">￥${car.totalPrice}</li>
         <li class="title_width5"><a href="deleteCar1.action?carId=${car.carId}">删除</a></li>
        </ul>
        </c:forEach>
       </div>
      <div class="list_style">
        <div class="class_title" id="vegetables">蔬菜馆</div>
       <c:forEach var="car" items="${sessionScope.carList1}">
        <ul class="product_cart">
         <li class="title_width"><input type="checkbox" ></li>
         <li class="title_width1">
          <a href="#" class="product_img left"><img src="images/vegtables/${car.goods.goodsPic}" /></a>
          <p class="cart_content">
           <a href="#" class="title_name">${car.goods.goodsName}</a>
           <span> 包装：商家自供</span>
          </p>
         </li>
         <li class="title_width2">￥${car.goods.goodsPrice}</li>
         <li class="title_width3">
          <input type="hidden" id="kc" value="${car.goods.goodsInventory}">
          <div class="Numbers">
           <input type="button" value="-" class="jian"  id="substract" style="background-color:white;width: 30px;height: 30px;font-size: 15px;" onclick="jian(${car.carId},${car.goods.goodsPrice})">
           <input id="goodsNum${car.carId}" name="goodsNum" class="goodsNum" size="6" value="${car.goodsNum}" style="width: 30px;height: 23px;text-align: center" />
           <input type="button" value="+" class="jia" id="add"style="background-color:white;width: 30px;height: 30px;font-size: 15px" onclick="jia(${car.carId},${car.goods.goodsPrice})">
          </div>
         </li>
         <li class="title_width4">￥${car.totalPrice}</li>
         <li class="title_width5"><a href="deleteCar2.action?carId=${car.carId}">删除</a></li>
        </ul>
       </c:forEach>
       </div>
      <div class="list_style">
       <div class="class_title" id="nuts">坚果馆</div>
       <c:forEach var="car" items="${sessionScope.carList2}">
        <ul class="product_cart">
         <li class="title_width"><input type="checkbox" ></li>
         <li class="title_width1">
          <a href="#" class="product_img left"><img src="images/Nuts/${car.goods.goodsPic}" /></a>
          <p class="cart_content">
           <a href="#" class="title_name">${car.goods.goodsName}</a>
           <span> 包装：商家自供</span>
          </p>
         </li>
         <li class="title_width2">￥${car.goods.goodsPrice}</li>
         <li class="title_width3">
          <input type="hidden" id="kc" value="${car.goods.goodsInventory}">
          <div class="Numbers">
           <input type="button" value="-" class="jian"  id="substract" style="background-color:white;width: 30px;height: 30px;font-size: 15px;" onclick="jian(${car.carId},${car.goods.goodsPrice})">
           <input id="goodsNum${car.carId}" name="goodsNum" class="goodsNum" size="6" value="${car.goodsNum}" style="width: 30px;height: 23px;text-align: center" />
           <input type="button" value="+" class="jia" id="add"style="background-color:white;width: 30px;height: 30px;font-size: 15px" onclick="jia(${car.carId},${car.goods.goodsPrice})">
          </div>
         </li>
         <li class="title_width4">￥${car.totalPrice}</li>
         <li class="title_width5"><a href="deleteCar3.action?carId=${car.carId}">删除</a></li>
        </ul>
       </c:forEach>
      </div>
     </div>
     <!--操作-->
     <div class="cart_operating clearfix">
        <div class="cart_operating_style">
           <div class="cart_price">商品总价：（不含运费）<b>￥<c:forEach var="car" items="${sessionScope.totalMoney}">
            ${car}
           </c:forEach> </b></div>
           <div class="cart_btn"><a href="#" class="payment_btn" onclick="goods()"></a><a href="Products.jsp" class="continue_btn"></a></div>
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
