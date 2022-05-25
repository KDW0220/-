<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
	#tbl_cart {
		display:flex;
		justify-content:center;
		margin-top:100px;
		border: 1px solid #dedede;
	}
	
	.title {
		font-size:25px;
		font-weight:400px;
	}
	
	.price {
		font-size:25px;
		font-weight:bold;
		color:#f5602a;
	}
	
	#tbl_cart a {
		font-size:17px;
		background:white;
		padding:21px 31px;
		color:black;
	}
	
	#tbl_cart a:hover {
		text-decoration:none;
	}
	
	.cartIn {
		width:150px;
		font-size:18px;
		border: 1px solid gray;
		background:white;
		padding:18px;
		background:#232323;
		color:white;
	}
	
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
	<img src="/resources/shop_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">상품구매</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">반려동물을 위한 다양한 상품들을 구매하세요</p>
		  </div>
		</div>
	</div> 
</div>
<div style="text-align:center;">
	<p class="small_title">상품 구매</p>
	<p class="big_title">Buy</p>
</div>
<div>
   <!--<span><a href="/shop/update?id=${vo.id }">정보수정</a></span>-->
   <form name="cart" id="cartIn" method="post" action="insert" enctype="multipart/form-data">
      <div id="tbl_cart">
	   		<img src="/display?fileName=${vo.image}" width=400>
		   <table width=500>
		   		<tr>
		   			<td><div class="title">${vo.title}</div><hr></td>	
		   		</tr>
		   		<tr>
		   			<td><div class="price" style="border-bottom:1px solid #aeaeae; padding: 10px;">${vo.price}</div><hr></td>
		   		</tr>
		   		<tr style="display:flex; align-items:center; justify-content:space-between;">
		   		 	<td><a href="${vo.link}" style="border: 1px solid gray;">상세정보</a></td>
		   			<td><button type="submit" class="cartIn">장바구니</button></td>
		   			<td><a id="buy_now" style="background:#f5602a; color:white;">바로 구매하기</a></td>
		   		</tr>
		   </table>
		   
	   </div>
      
      <table style="display:none;">
         <tr>
            <td><input type="text" name="id" value="${vo.id}"></td>
            <td><input type="text" name="uid" value="${uid}"></td>
            <td><input type="text" name="title" value="${vo.title}"></td>
            <td><input type="text" name="price" value="${vo.price}"></td>
            <td><input type="text" name="image" value="${vo.image}"></td>
            <td><input type="text" name="link" value="${vo.link}"></td>
         </tr>
      </table>
      
   </form>

   <div class="pagination"></div>
</div>
<script src="/resources/pagination.js"></script>

<script>
	var uid="${uid}";

   $(cart).on("submit", function(e) {
      e.preventDefault();
      if (!confirm("장바구니에 넣으실래요?")) return;
      var form = document.cart;
      
      form.submit();
   });
   
   $("#buy_now").on("click",function(e){
	   	e.preventDefault();
	   
	   	var uid = '${uid}';
		var title = '${vo.title}';
		var price = '${vo.price}';
		var image='${vo.image}';
		var link='${vo.link}';
	   
	   $.ajax({
			type: "post",
			url: "/shop/buy",
			data:{uid:uid,title:title,price:price,image:image,link:link},
			success:function(){
				location.href="/cart/buy?uid="+uid;
			} 
	   });
   });
</script>