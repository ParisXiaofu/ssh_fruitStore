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
<title>产品</title>
</head>
<script>
    // 水果
    $(function () {
        var goodsTypeId=101;
        $.ajax({
            method:"post",
            url:"/fruit.action",
            data:{"goodsTypeId":goodsTypeId},
            dataType:"json",
            success:function (data) {
                var result=""
                $(data).each(function (i) {
                    result+="<li class=\"clearfix\">\n" +
                        "       <div class=\"product_lists clearfix\">\n" +
                        "        <a href='addCollection1.action?goodsId="+this.goodsId+"' class=\"Collect\"></a>\n" +
                        "        <a href=''><img src='images/fruit/"+this.goodsPic+"' width='207' height='219'/></a>\n" +
                        "        <p class=\"title_p_name\">"+this.goodsName+"</p>\n" +
                        "        <p class=\"title_Profile\" style='height: 45px'>"+this.goodsInfo+"</p>\n" +
                        "        <p class=\"price\"><b>￥</b>"+this.goodsPrice+"</p>\n" +
                        "        <p class=\"btn_style\"><a href='goodsDetail.action?goodsId="+this.goodsId+"' class=\"buy_btn\"></a><a href='addCar1.action?goodsId="+this.goodsId+"&goodsPrice="+this.goodsPrice+"' class=\"Join_btn\"></a></p>\n" +
                        "        </div>\n" +
                        "       </li>"
                    if (i>8){
                        return false
                    }
                })
                $("#fruit-show").html(result)
            }
        })
    })
    //蔬菜
    $(function () {
        var goodsTypeId=102;
        $.ajax({
            method:"post",
            url:"/fruit.action",
            data:{"goodsTypeId":goodsTypeId},
            dataType:"json",
            success:function (data) {
                var result=""
                $(data).each(function (i) {
                    result+="<li class=\"clearfix\">\n" +
                        "       <div class=\"product_lists clearfix\">\n" +
                        "        <a href='addCollection1.action?goodsId="+this.goodsId+"' class=\"Collect\"></a>\n" +
                        "        <a href=''><img src='images/vegtables/"+this.goodsPic+"' width='207' height='219'/></a>\n" +
                        "        <p class=\"title_p_name\">"+this.goodsName+"</p>\n" +
                        "        <p class=\"title_Profile\" style='height: 45px'>"+this.goodsInfo+"</p>\n" +
                        "        <p class=\"price\"><b>￥</b>"+this.goodsPrice+"</p>\n" +
                        "        <p class=\"btn_style\"><a href='goodsDetail.action?goodsId="+this.goodsId+"' class=\"buy_btn\"></a><a href='addCar1.action?goodsId="+this.goodsId+"&goodsPrice=?"+this.goodsPrice+"' class=\"Join_btn\"></a></p>\n" +
                        "        </div>\n" +
                        "       </li>"
                    if (i>8){
                        return false
                    }
                })
                $("#vegtables-show").html(result)
            }
        })
    })
    //坚果
    $(function () {
        var goodsTypeId=103;
        $.ajax({
            method:"post",
            url:"/fruit.action",
            data:{"goodsTypeId":goodsTypeId},
            dataType:"json",
            success:function (data) {
                var result=""
                $(data).each(function (i) {
                    result+="<li class=\"clearfix\">\n" +
                        "       <div class=\"product_lists clearfix\">\n" +
                        "        <a href='addCollection1.action?goodsId="+this.goodsId+"' class=\"Collect\"></a>\n" +
                        "        <a href=''><img src='images/Nuts/"+this.goodsPic+"' width='207' height='219'/></a>\n" +
                        "        <p class=\"title_p_name\">"+this.goodsName+"</p>\n" +
                        "        <p class=\"title_Profile\" style='height: 45px'>"+this.goodsInfo+"</p>\n" +
                        "        <p class=\"price\"><b>￥</b>"+this.goodsPrice+"</p>\n" +
                        "        <p class=\"btn_style\"><a href='goodsDetail.action?goodsId="+this.goodsId+"' class=\"buy_btn\"></a><a href='addCar1.action?goodsId="+this.goodsId+"&goodsPrice=?"+this.goodsPrice+"' class=\"Join_btn\"></a></p>\n" +
                        "        </div>\n" +
                        "       </li>"
                    if (i>8){
                        return false
                    }
                })
                $("#nuts-show").html(result)
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
<div class="AD_img"><a href="#"><img src="images/AD_page_img_02.png"  width="100%"/></a></div>
<!--位置-->
<div class="Bread_crumbs">
 <div class="Inside_pages clearfix">
   <div class="left">当前位置：<a href="#">首页</a>&gt;<a href="#">所有果蔬</a></div>
   <div class="right Search">
   <form>
    <input name="" type="text"  class="Search_Box"/>
    <input name="" type="button"  name="" class="Search_btn"/>
    </form>
   </div>
 </div>
</div>
<!--产品-->
<div class="Inside_pages">
  <!--水果馆-->
  <div class="fruits_Forum">
    <div class="title_style">
     <div class="title_name"><a href="#"><img src="images/sg_pro_img_12.png" /></a></div>
     <div class="title_info">
      <p class="title_x_name">[健康水果小知识]</p>
      <p class="x_info">水果是指多汁且大多数有甜味可直接生吃的植物果实，不但含有丰富的营养且能够帮助消化。水果是对部分可以食用的植物果实和种子的统称。水果有降血压、减缓衰老、减肥瘦身、皮肤保养、 明目、抗癌、降低胆固醇补充维生素等保健作用。</p>
     </div>
     <div class="title_img"><img src="images/sg_pro_img_17.png" /></div>
    </div>
    <div class="list_style">
      <ul class="clearfix" id="fruit-show">

      </ul>   
    </div>  
  </div> 
    <!--蔬菜馆-->
  <div class="vegetables_Forum">
    <div class="title_style">
     <div class="title_name"><a href="#"><img src="images/vegetables_img_40.png" /></a></div>
     <div class="title_info">
      <p class="title_x_name">[健康蔬菜小知识]</p>
      <p class="x_info"> 蔬菜是人类重要的食品之一，由于它们营养丰富、色彩艳丽，又可加工制成各种美味佳肴，已经成为人们每日餐桌之所需。假如仅仅用蔬菜来充饥果腹或调和口味，当然不算“会吃蔬菜”。能够通过吃不同的蔬菜得到合理的营养成分，从蔬菜中吃出健康、吃出美丽，这才真正叫做“会吃蔬菜”</p>
     </div>
     <div class="title_img"><img src="images/title_p_img_32.png" /></div>
    </div>
    <div class="list_style">
      <ul class="clearfix" id="vegtables-show">

      </ul>   
    </div>  
  </div>
  <!--坚果馆-->
   <div class="fruits_Forum">
    <div class="title_style">
     <div class="title_name"><a href="#"><strong style="font-family:楷体;font-size: 34px; position: relative;left: 25px;top: 45px;color: whitesmoke">进入坚果馆</strong></a></div>
     <div class="title_info">
      <p class="title_x_name">[健康坚果小知识]</p>
      <p class="x_info">坚果，是闭果的一个分类，果皮坚硬，内含1粒或者多粒种子。如板栗，杏仁等的果实。坚果是植物的精华部分，一般都营养丰富，含蛋白质、油脂、矿物质、维生素较高，对人体生长发育、增强体质、预防疾病有极好的功效</p>
     </div>
     <div class="title_img"><img src="images/sg_pro_img_18.png" /></div>
    </div>
    <div class="list_style">
      <ul class="clearfix" id="nuts-show">

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
