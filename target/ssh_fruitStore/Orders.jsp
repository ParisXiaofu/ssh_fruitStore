<%@ page import="com.flh.model.entity.Address" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" tyle="text/css" />
<link href="css/Orders.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.reveal.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/jquery.sumoselect.min.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="js/jquery.jumpto.js" type="text/javascript"></script>
<title>确认订单界面</title>
</head>
 <script type="text/javascript">
        $(document).ready(function () {
            window.asd = $('.SlectBox').SumoSelect({ csvDispCount: 3 });
            window.test = $('.testsel').SumoSelect({okCancelInMulti:true });
        });
        $(function () {
            if (${empty payTypeList}){
                location.href="payType.action"
            }
        })
     function address() {
         if (${empty sessionScope.addressOrder}){
             alert("请选择你的收货地址！！")
         }
     }
     $(function () {
         if (${empty addressOrder}) {
             location.href="getAddressOrder.action?addressId=1001"
         }
     })
    </script>

<body>
<form class="form" method="post" action="addOrders.action">
<div id="Orders" class="Inside_pages  clearfix">
  <div class="Orders_style clearfix">
     <div class="address clearfix">
       <div class="title">收货人信息</div>
          <div class="adderss_list clearfix">
            <div class="title_name">选择收货地址 <a href="/user_address.jsp">+添加地址</a></div>
             <div class="list" id="select">
                 <c:forEach var="address" items="${sessionScope.addressList}">
            <ul class="confirm active">
            <div class="adderss_operating">
             <div class="Operate"><a href="deletesAddress.action?addressId=${address.addressId}" class="delete_btn"></a> <a href="getAddressOrder.action?addressId=${address.addressId}" class="modify_btn"></a></div>
            </div>
             <div class="user_address">
            <li>${address.addressRecName}</li>
            <li>${address.addressArea}${address.addressCity}</li>
            <li class="Postcode">${address.addressEmail}</li>
            <li>${address.addressPhone}</li>
            </div>
            </ul>
                 </c:forEach>

             </div>
          </div>
         <div  align="center">
             <a href="/allAddressOrder.action?pageIndexOrder=1">首页</a>
             <a href="/allAddressOrder.action?pageIndexOrder=${pageIndexOrder-1}">上一页</a>
             <u>${pageIndexOrder}/${totalPageOrder}</u>
             <a href="/allAddressOrder.action?pageIndexOrder=${pageIndexOrder+1}">下一页</a>
             <a href="/allAddressOrder.action?pageIndexOrder=${totalPageOrder}">尾页</a>
         </div>
        <!--收货地址样式-->
     <div class="Shipping_address">
         <% Address address=(Address) session.getAttribute("addressOrder");%>
         <%if (address==null){%>
       <ul class="detailed">
        <li><label>收货人姓名</label><span></span></li>
        <li><label>地区</label><span></span></li>
           <li><label>收货地址</label><span></span></li>
        <li><label>邮政编码</label><span></span></li>
        <li><label>移动电话</label><span></span></li> 
         <li><label>固定电话</label><span></span></li>        
       </ul>
         <%}else {%>
         <ul class="detailed">
             <li><label>收货人姓名</label><span><%=address.getAddressRecName()%></span></li>
             <li><label>地区</label><span><%=address.getAddressArea()%></span></li>
             <li><label>收货地址</label><span><%=address.getAddressCity()%></span></li>
             <li><label>邮政编码</label><span><%=address.getAddressEmail()%></span></li>
             <li><label>移动电话</label><span><%=address.getAddressPhone()%></span></li>
             <li><label>固定电话</label><span><%=address.getAddressTel()%></span></li>
         </ul>
         <%}%>
     </div>
     </div>

		<fieldset>
     <!--快递选择-->

    
     <!--付款方式-->
     <div class="payment">
      <div class="title_name">支付方式</div>
       <ul id="payType">
           <c:forEach var="payType" items="${sessionScope.payTypeList}">
        <li><input type="radio" name="payTypeId" value="${payType.payTypeId}" data-labelauty="${payType.payTypeName}" checked></li>
           </c:forEach>
       </ul>
     </div>
      <!--发票样式-->
     <div class="invoice_style">
       <ul>
         <li class="invoice_left"><h1 align="center" style="color: black">是否开发票：</h1> </li>
           <li class="invoice_left"><input type="radio" name="invoice" value="1" data-labelauty="是" ></li>
           <li class="invoice_left"><input type="radio" name="invoice" value="0" data-labelauty="否" checked></li>
        </ul>
     </div>
     <!--产品列表-->
     <div class="Product_List">

      <table>
       <thead><tr class="title"><td class="name">商品名称</td><td class="price">商品价格</td><td class="Preferential">优惠价</td><td class="Quantity">购买数量</td><td class="Money">金额</td></tr></thead>
       <tbody>
       <c:forEach items="${sessionScope.OrderGoodsList}" var="car">
       <tr>
        <td class="Product_info">
         <a href="#">
             <c:if test="${car.goods.goodstype.goodsTypeId==101}">
                 <img src="images/fruit/${car.goods.goodsPic}"  width="100px" height="100px"/>
             </c:if>
             <c:if test="${car.goods.goodstype.goodsTypeId==102}">
                 <img src="images/vegtables/${car.goods.goodsPic}"  width="100px" height="100px"/>
             </c:if>
             <c:if test="${car.goods.goodstype.goodsTypeId==103}">
                <img src="images/Nuts/${car.goods.goodsPic}"  width="100px" height="100px"/>
             </c:if>
         </a>
            <a href="#" class="product_name"><strong>${car.goods.goodsName}</strong></a><br>
           ${car.goods.goodsInfo}
         </td>
        <td><i>￥</i>${car.goods.goodsPrice}</td>
        <td><i>￥</i><c:if test="${empty car.goods.teamBuyPrice}">
            无优惠
        </c:if>
            ${car.goods.teamBuyPrice}
        </td>
        <td>${car.goodsNum}</td>
        <td class="Moneys"><i>￥</i>${car.totalPrice}</td>
       </tr>
       </c:forEach>
       </tbody>
      </table>
      <div class="Pay_info">
       <label>订单留言</label><input name="ordersMessage" type="text"  onkeyup="checkLength(this);" class="text_name " />  <span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span></span>
      </div>
      <!--价格-->
      <div class="price_style">
      <div class="right_direction">
        <ul>
         <li><label>商品总价</label><i>￥</i><span><c:forEach var="car" items="${sessionScope.totalMoney}">${car}</span></li>
         <li><label>优惠金额</label><i></i><span>系统原因，暂时无法优惠。。</span></li>
         <li><label>配&nbsp;&nbsp;送&nbsp;&nbsp;费</label><i>￥</i><span>0</span></li>
            <li class="shiji_price"><label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label><i>￥</i><span ><div name="ordersTotalPage">
                    <input type="hidden" name="ordersTotalPage" value="${car}">
                    ${car}</div></span></li>
        </ul>   
        <div class="btn"><input name="submit" type="submit" value="提交订单" class="submit_btn" onclick="address()"/> <input name="" type="button" value="返回购物车"  class="return_btn"/></div>
          <div class="integral right">待订单确认后，你将获得<span ><div name="pointGet"> <input type="hidden" name="pointGet" value=" ${Integer(car*10)}"> ${Integer(car*10)}</div></c:forEach></span>积分</div>
      </div>
      </div>
     </div>  
     </fieldset>
  </div>
</div>
        </form>
  </div>
</div>
<script type="text/javascript">
function checkLength(which) {
	var maxChars = 50; //
	if(which.value.length > maxChars){
		alert("您出入的字数超多限制!");
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
}
</script>
<script>
$(function(){
	$(':input').labelauty();
});
</script>
</body>
</html>
