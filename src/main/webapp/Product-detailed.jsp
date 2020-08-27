<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.flh.model.entity.Goods" %>
<%@ page import="com.flh.model.entity.Comment" %>
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
<script src="http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=402727"></script>
    <script src="js/jquery.foucs.js" type="text/javascript"></script>
    <!--[if IE 7]>
<link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
<![endif]-->
<title>商品详细介绍</title>
</head>
<script >
    $(function () {
        var goodsTypeId=$("#id").val();
        if (goodsTypeId==101) {
            $.ajax({
                method: "post",
                url: "/sales.action",
                data: {"goodsTypeId": goodsTypeId},
                dataType: "json",
                success: function (data) {
                    var result = "";
                    var tittle="<strong style=\"font-family: 楷体;font-size: 34px;position: relative;left: 58px;top: 50px;color: whitesmoke\">水果馆</strong>"
                    $(data).each(function (i) {
                        result += "<li class=\"\">\n" +
                            "     <em class=\"ranking_label\">" + (i + 1) + "</em>\n" +
                            "     <a href=\"#\" class=\"img\"> <img src='images/fruit/" + this.goodsPic + "' width=\"100px\" height=\"100px\" /></a>\n" +
                            "     <p class=\"ranking_name\">" + this.goodsName + "</p>\n" +
                            "     <p class=\"price\"><b>￥</b>" + this.goodsPrice + "</p>\n" +
                            "     <p><a href='goodsDetail.action?goodsId="+this.goodsId+"'>立即查看< </a></p>\n" +
                            "     </li>"
                    })
                    $(".ranking_list").html(result);
                    $(".title_img_p").html(tittle);
                }
            })
        }
        if (goodsTypeId==102) {
            $.ajax({
                method: "post",
                url: "/sales.action",
                data: {"goodsTypeId": goodsTypeId},
                dataType: "json",
                success: function (data) {
                    var result = "";
                    var tittle="<strong style=\"font-family: 楷体;font-size: 34px;position: relative;left: 58px;top: 50px;color: whitesmoke\">蔬菜馆</strong>"
                    $(data).each(function (i) {
                        result += "<li class=\"\">\n" +
                            "     <em class=\"ranking_label\">" + (i + 1) + "</em>\n" +
                            "     <a href=\"#\" class=\"img\"> <img src='images/vegtables/" + this.goodsPic + "' width=\"100px\" height=\"100px\" /></a>\n" +
                            "     <p class=\"ranking_name\">" + this.goodsName + "</p>\n" +
                            "     <p class=\"price\"><b>￥</b>" + this.goodsPrice + "</p>\n" +
                            "     <p><a href='goodsDetail.action?goodsId="+this.goodsId+"'>立即查看< </a></p>\n" +
                            "     </li>"
                    })
                    $(".ranking_list").html(result);
                    $(".title_img_p").html(tittle)
                }
            })
        }
        if (goodsTypeId==103) {
            $.ajax({
                method: "post",
                url: "/sales.action",
                data: {"goodsTypeId": goodsTypeId},
                dataType: "json",
                success: function (data) {
                    var result = "";
                    var tittle="<strong style=\"font-family: 楷体;font-size: 34px;position: relative;left: 58px;top: 50px;color: whitesmoke\">坚果馆</strong>"
                    $(data).each(function (i) {
                        result += "<li class=\"\">\n" +
                            "     <em class=\"ranking_label\">" + (i + 1) + "</em>\n" +
                            "     <a href=\"#\" class=\"img\"> <img src='images/Nuts/" + this.goodsPic + "' width=\"100px\" height=\"100px\" /></a>\n" +
                            "     <p class=\"ranking_name\">" + this.goodsName + "</p>\n" +
                            "     <p class=\"price\"><b>￥</b>" + this.goodsPrice + "</p>\n" +
                            "     <p><a href='goodsDetail.action?goodsId="+this.goodsId+"'>立即查看< </a></p>\n" +
                            "     </li>"
                    })
                    $(".ranking_list").html(result);
                    $(".title_img_p").html(tittle)
                }
            })
        }
    })
</script>
<script>
    function number() {
        var goodsNum=$("#goodsNum").val()
        var result="<a href='' class=\"buy_btn\"></a>\n" +
            "       <a href='addCarS.action?goodsId=${goods.goodsId}&goodsPrice=${goods.goodsPrice}&goodsNum="+goodsNum+"' class=\"Join_btn\"></a>\n" +
            "       <a href='addCollection5.action?goodsId=${goods.goodsId}' class=\"Collect_btn\"></a>"
        $(".operating").html(result);
    }
    $(function () {
        $("#add").click(function () {
            var num=parseInt($("#goodsNum").val());
            var kc=document.getElementById("kc").innerText;
            if (num>=kc){
                alert("当前库存不足")
                num=kc
            }else {
                num+=1
            }
            $("#goodsNum").val(num)
            number();
        })
        $("#substract").click(function () {
            var num=parseInt($("#goodsNum").val());
            if (num<=1){
                alert("再减就没有啦！")
                num=1
            }else {
                num-=1
            }
            $("#goodsNum").val(num)
            number()
        })
    })
</script>

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
   <div class="left">当前位置：<a href="#">首页</a>&gt;<a href="#">商品详情</a></div>
   <div class="right Search">
   <form>
    <input name="" type="text"  class="Search_Box"/>
    <input name="" type="button"  name="" class="Search_btn"/>
    </form>
   </div>
 </div>
</div>
<!--商品详细介绍-->
<div class="Inside_pages clearfix">
 <div class="left_style">
    <div class="title_img_p"></div>
   <div class="ranking">
    <div class="ranking_title"><span>销量</span>排行</div>
    <ul class="ranking_list">

    </ul>
   </div>
 </div>
 <!--详细介绍样式-->
 <div class="right_style">
  <div class="pro_detailed">
   <div class="Details_style clearfix" id="goodsInfo">
     <div class="mod_picfold clearfix">
    <div class="clearfix" id="detail_main_img">
        <%Goods goods=(Goods) session.getAttribute("goods");%>
	 <div class="layout_wrap">
         <%if (goods.getGoodstype().getGoodsTypeId()==101){%>
         <img src="images/fruit/<%=goods.getGoodsPic()%>" width="425px" height="465px" style="border: #999999 double 5px"/>
         <%}else if (goods.getGoodstype().getGoodsTypeId()==102){%>
         <img src="images/vegtables/<%=goods.getGoodsPic()%>"  width="425px" height="465px" style="border: #999999 double 5px"/>
         <%}else {%>
         <img src="images/Nuts/<%=goods.getGoodsPic()%>"  width="425px" height="465px" style="border: #999999 double 5px"/>
         <%}%>
	 </div>
	</div>
    <div class="Sharing">
     <div class="bdsharebuttonbox right">
         <a href="#" class="bds_more" data-cmd="more"></a>
         <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
         <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
         <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
         <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
         <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
         </div>
<script>
window._bd_share_config = {
    "common": {
        "bdSnsKey": {},
        "bdText": "",
        "bdMini": "2",
        "bdMiniList": false,
        "bdPic": "",
        "bdStyle": "1",
        "bdSize": "16"
    },
    "share": {},
    "image": {
        "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"],
        "viewText": "分享到：",
        "viewSize": "16"
    },
    "selectShare": {
        "bdContainerClass": null,
        "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]
    }
};
with(document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
  <!--收藏-->
	  <div class="coding">商品编码：34345345345<%=goods.getGoodsId()%></div>
	 </div>
   </div>
   <!--购买信息-->
    <div class="Buying_info">
        <input type="hidden" value="<%=goods.getGoodstype().getGoodsTypeId()%>" id="id">
      <div class="product_name"><h2><%=goods.getGoodsName()%></h2><span><%=goods.getGoodsName()%></span></div>
      <div class="product_price">
       <div class="price"><label>商城价：</label>
           <%=goods.getGoodsPrice()%>
           <b>元</b></div>
       <div class="jyScore-fra"><span><em style="width:60px;"></em></span><b>4.5</b><a href="#">共有<%=goods.getCommentSet().size()%>条评论</a></div>
      </div>

      <div class="productDL">
        <dl><dt>类型：</dt><dd class="left"><div class="item  selected"><b></b><a href="#none" title="金晕"><%=goods.getGoodstype().getTypeName()%></a></div></dd></dl>
        <dl><dt>包装：</dt><dd class="left">
        <div class="item  selected"><b></b><a href="#none" title="小礼盒">商家自供</a></div>
        </dd></dl>
          <dl><dt>数量：</dt><dd class="left">
              <div class="Numbers">
                  <input type="button" value="-" class="jian"  id="substract" style="border: #CC0000 solid 2px;background-color:white;width: 40px;height: 30px;font-size: 15px;">
                  <input id="goodsNum" name="goodsNum" size="6" value="1" style="border: #CC0000 solid 2px;width: 40px;height: 23px;text-align: center" />
                  <input type="button" value="+" class="jia" id="add"style="border: #CC0000 solid 2px;background-color:white;width: 40px;height: 30px;font-size: 15px">
              </div>
          </dd><dd class="left Quantity">(库存：<span id="kc" ><%=goods.getGoodsInventory()%></span>)</dd></dl>
      </div>
      <div class="product_Quantity">销量：<%=goods.getGoodsSales()%></div>
      <div class="operating">

      </div>
    </div>
   </div>
   <!--信息展示-->
      <script>
          visit()
          number();
          function visit() {
              $(function () {
                  $("#visit").css("visibility","visible");
                  $("#span").css("visibility","hidden");
                  $("#lianxi").css("visibility","hidden");
                  $("#index").css("visibility","hidden");
              })
          }
          function visit_2() {
              $(function () {
                  $("#span").css("visibility", "visible");
                  $("#visit").css("visibility", "hidden");
                  $("#lianxi").css("visibility", "hidden");
                  $("#index").css("visibility","visible");
              })
          }
              function visit_3() {
                  $(function () {
                      $("#lianxi").css("visibility","visible");
                      $("#span").css("visibility","hidden");
                      $("#visit").css("visibility","hidden");
                      $("#index").css("visibility","hidden");
                  })
          }

      </script>

   <ul class="fixed_bar" style="">
      <li class="status_on active" onclick="visit()">
          <a href="#status1 ">产品介绍</a>
          <div style="font-size: 20px;width: 600px" id="visit"><%=goods.getGoodsInfo()%></div>
      </li>
      <li class="status_on "><a href="#" onclick="visit_2()" >商品评价<span>(<%=goods.getCommentSet().size()%>)</span></a>
      </li>
      <li class="status_on"><a href="#shbz" onclick="visit_3()">售后服务</a>
          <div style="position:relative;left:0px;font-size: 20px;background-image:url(images/price_img_03.jpg);width: 200px" id="lianxi">
              <p>QQ:2514770624</p>
              <p>电话17671348540</p>
          </div>
      </li>
    </ul>
      <div style="height:670px" id="span">
       <table style="width: 945px;background:url(images/price_img_03.jpg) "  class="c_div_2">

           <th align="center" style="height: 50px;font-size: 20px;background:url(images/price_img_03.jpg) no-repeat;border: #CC0000 solid 3px">
               <div style="display: inline;padding-left: 60px;margin-right: 100px;">评论人/时间</div>
               &nbsp;&nbsp;<span style="color: #CC0000">丨</span>

               <div style="display: inline;padding-left: 60px;margin-right: 130px; text-align: center">
                  <span style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品评论</span></div>
               <span style="color: #CC0000">丨</span>&nbsp;&nbsp;
               <div style="display: inline;margin-left: 60px;margin-right: 13px;padding-right: 10px">宝贝信息</div></th>
           <tr style="height: 30px"><td>   </td></tr>
           <c:forEach var="comment" items="${sessionScope.commentList}">
               <tr class="c_tr" align="center" style="font-size: 16px;height: 70px;color: #BDBDBD">
                   <td><div style="margin-left: -750px;font-weight:normal">
                       <span> <strong>${comment.customer.custName}<br>${comment.commentTime}</strong></span>
                          </div></td>
                   <td><div style="margin-left: -950px;width:300px;padding-left: -30px"><strong>${comment.commentContext}</strong></div></td>
                   <td><div style="margin-left: -230px;"><strong>${comment.goods.goodsName}</strong></div></td>
               </tr>
               <tr style="height: 20px"><td><hr></td></tr>
           </c:forEach>
       </table>
          <div align="center" style=";margin-left:2px;width: 943px;height:40px;background-image:url(images/price_img_03.jpg);font-size: 20px;" id="index">
              <a href="/commentIndex.action?pageIndexc=1"  style="color: #ff8800;">首页</a>
              <a href="/commentIndex.action?pageIndexc=${pageIndexc-1}"style="color: #ff8800">上一页</a>
              <strong style="color: #CC0000"><u class="">${pageIndexc}/${totalPagec}</u></strong>
              <a href="/commentIndex.action?pageIndexc=${pageIndexc+1}"style="color: #ff8800">下一页</a>
              <a href="/commentIndex.action?pageIndexc=${totalPagec}"style="color: #ff8800">尾页</a>
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
