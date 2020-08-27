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
<title>用户中心</title>
</head>
<script type="text/javascript">
  $(document).ready(function(){

		  setInterval(showTime, 1000);                                
		  function timer(obj,txt){
						  obj.text(txt);
		  }        
		  function showTime(){                                
				  var today = new Date();
				  var weekday=new Array(7)
				  weekday[0]="星期日"
				  weekday[1]="星期一"
				  weekday[2]="星期二"
				  weekday[3]="星期三"
				  weekday[4]="星期四"
				  weekday[5]="星期五"
				  weekday[6]="星期六"                                        
				  var y=today.getFullYear()+"年";
				  var month=today.getMonth()+1+"月";
				  var td=today.getDate();
				  var d=weekday[today.getDay()];
				  var h=today.getHours();
				  var m=today.getMinutes();
				  var s=today.getSeconds();        
				  timer($("#y"),y+month);
				  //timer($("#MH"),month);        
				  timer($("h1"),td);        
				  timer($("#D"),d);
				  timer($("#H"),h);
				  timer($("#M"),m);
				  timer($("#S"),s);
		  }        
  })
function info() {
    if (${empty sessionScope.customerInfo}) {
        location.href="custInfoSelects.action"
    }

}
</script>
<body onload="info()">
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
              <a id="loginOut" style="color: red;cursor: pointer" href="loginOut.action"><u>退出</u></a><%}%>
          </div>
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
     <div class="user_center_style">
     <div class="user_time">
      <h1></h1>
      <h4 id="D"></h4>
      <h4 id="y"></h4>
     </div>
      <ul class="user_center_info">
          <a href="goodsPointIndex.action">
       <li>
        <img src="images/user_img_05.png" />
        <h3><strong>积分商城</strong></h3>
       </li>
          </a>
          <a href="custPoint.action">
       <li><img src="images/user_img_06.png" />
        <h3>积分<c:forEach var="custpoint" items="${sessionScope.custpointList}">
            <c:forEach var="custpointPay" items="${sessionScope.custpointListPay}">
                ${custpoint-custpointPay}
            </c:forEach>
        </c:forEach>分</h3>
       </li>
              <a href="allAddress.action">
                  <li><img src="images/user_img_04.png" />
                      <h3>收货地址</h3>
                  </li>
              </a>
          </a>
          <a href="custInfoSelect.action">
       <li><img src="images/user_img_03.png" />
        <h3>个人信息</h3>
       </li>
          </a>
      </ul>     
     </div>
     <div class="Order_form">
       <div class="user_Borders">
        <div class="title_name">
        <span class="name">我的订单</span>
       </div>
       <div class="Order_form_list">
         <table>
         <thead>
          <td class="list_name_title0">商品</td>
          <td class="list_name_title1">单价(元)</td>
          <td class="list_name_title2">数量</td>
          <td class="list_name_title4">实付款(元)</td>
          <td class="list_name_title5">订单状态</td>
          <td class="list_name_title6">操作</td>
         </thead>
<c:forEach var="orders" items="${sessionScope.ordersList}">
            <tbody>
           <tr><td colspan="6" class="Order_form_time">${orders.ordersCreateTime} 订单号：44545465465465${orders.ordersId}</td></tr>
           <tr>
           <td colspan="3">
             <table class="Order_product_style">
<c:forEach var="orderdetail" items="${orders.orderdetailSet}">
               <tr>
           <td>
            <div class="product_name clearfix">
            <a href="#">
                <c:if test="${orderdetail.goods.goodstype.goodsTypeId==101}">
                    <img src="images/fruit/${orderdetail.goods.goodsPic}"  width="80px" height="80px"/>
                </c:if>
                <c:if test="${orderdetail.goods.goodstype.goodsTypeId==102}">
                    <img src="images/vegtables/${orderdetail.goods.goodsPic}" height="80" width="80"/>
                </c:if>
                <c:if test="${orderdetail.goods.goodstype.goodsTypeId==103}">
                    <img src="images/Nuts/${orderdetail.goods.goodsPic}" height="80" width="80"/>
                </c:if>
                </a>
            <a href="3">${orderdetail.goods.goodsName}</a>
            <p class="specification">礼盒：商家自供</p>
            </div>
            </td>
             <td>${orderdetail.goods.goodsPrice}</td>
           <td>${orderdetail.orderFruitNum}</td>
            </tr>
</c:forEach>
            </table>          
           </td>
          
           <td class="split_line">${orders.ordersTotalPage}</td>
           <td class="split_line">${orders.orderstatetype.orderStateTypeName}</td>
           <td><a href="deleteOrders.action?ordersId=${orders.ordersId}">删除</a></td>
           </tr>
           </tbody>
</c:forEach>
         </table>

           <div class="pages_Collect clearfix"  >
               <a href="/ordersIndex.action?pageIndexOrder=${pageIndexOrder-1}" class="on">《</a>
               <c:forEach var="num" items="${totalPageOrderList}">
                   <a href="/ordersIndex.action?pageIndexOrder=${num}" id="num" >${num}</a>
               </c:forEach>
               <a href="/ordersIndex.action?pageIndexOrder=${pageIndexOrder+1}" style="background-color:#FF6600;color:white ">》</a>
           </div>
       </div>
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
