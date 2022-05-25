<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.row {
	display:flex;
	flex-direction:column;
	float:left;
	margin:5px;
	width:320px;
	text-align:center;
	border: 1px solid #dedede;
	height: 400px;
	justify-content:center;
}

.row:hover {
	cursor:pointer;
}

.shop_image {
	width:300px;
	height:300px;
}

#shop {
	margin : 0px auto;
	width:1350px;
	padding-right:-10px;
}

.price {
	font-size:22px;
	font-weight:bold;
}

#banner_top {
	margin-left:130px;
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
	<p class="small_title">포포펫의 상품을 소개합니다</p>
	<p class="big_title">Shop</p>
</div>
<div id="page">
	<table id="shop"></table>
	<script id="temp" type="text/x-handlebars-template">
   {{#each list}}
      <tr class="row" id="{{id}}">
         <td><img src="/display?fileName={{image}}" class="shop_image"></td><br>
         <td class="title">{{title}}</td><br>
		 <td class="price">{{price}}</td>
      </tr>
   {{/each}}
   </script>
	<div class="pagination"></div>
</div>

<script>
	var page = 1;
	getList();

	
	function getList() {
		$.ajax({
			type : "get",
			url : "/shop/list.json",
			data : {page : page},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#shop").html(template(data));
				$(".pagination").html(getPagination(data));
			}
		});
	}
	
	//row를 클릭한경우
	   $("#shop").on("click", ".row", function(){
	     var id=$(this).attr("id");
	     location.href="read?id=" + id + "&page=" + page;
	   });

	$(".pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getList();
	});
</script>
