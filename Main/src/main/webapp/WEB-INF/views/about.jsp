
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#about {
	}
	.box {
		width:450px;
		float:left;
	}
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
#tbl_board {
		margin:0px auto;
	}	

	#tbl_board td {
		padding:15px;
	}
	
	#tbl_board .title {
		text-align:center;
		background:#EEEEEE;
		font-weight:bold;
		border-top:1px solid black;
	}
	
	#board_content {
		text-align:center;
	}
	
	#tbl_board .row_board {
		border-top:1px solid #dedede;
		border-bottom:1px solid #dedede;
		text-align:center;
	}
</style>    
<style>
#mypet {
   width: 900px;
   margin: 0px auto;
   overflow: hidden;
}

#pet_box {
   width: 250px;
   margin: 1px;
   float: left;
   border: 1px solid gray;
   padding: 10px;
   cursor: pointer;
}

.title {
   width: 150px;
}

.modal2 
{ 
	position: absolute; top: 0; left: 0; width: 100%; height:1700px; 
	display: none; background-color: rgba(0, 0, 0, 0.4); 
	z-index:20;
} 

.modal_body2
{ 
	position: absolute; top: 50%; left: 50%; width: 1000px; 
	height: 400px; text-align: center; background-color: rgb(255, 255, 255); border-radius: 10px; 
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 
	transform: translateX(-50%) translateY(-50%); 
	margin:0px auto;
	padding : 50px;
	float:left;
}

.btn-close2 {
   width: 20px;
   height: 20px;
   float: right;
   cursor: pointer;
}
</style>
<div id="about">
	<jsp:include page="slick.jsp"/>
	
	<div><h2 style="margin-left: 45%; font-weight: bold;">새로운상품</h2></div>
	
   	<table id="shop"></table>
	<script id="temp2" type="text/x-handlebars-template">
   {{#each .}}
      <tr class="row" id="{{id}}">
         <td><img src="/display?fileName={{image}}" class="shop_image"></td><br>
         <td class="title">{{title}}</td><br>
		 <td class="price">{{price}}</td>
      </tr>
   {{/each}}
   </script>
   
   <div><h2 style="margin-left: 45%; font-weight: bold;">새로운 글</h2></div>
   
   <table id="tbl_board"></table>
	<script id="temp1" type="text/x-handlebars-template">
      {{#each .}}
       <tr class="row_board">
         <td class="bno">{{bno}}</td>
         <td class="btitle">{{btitle}}</td>
         <td>{{bwriter}}</td>
         <td>{{bregdate}}</td>
		 <td>{{bcount}}</td>
      </tr>
      {{/each}}
   </script>
   &nbsp;
	&nbsp;
	&nbsp;
   
   
	   <table id="mypet"></table>
	   <script id="temp3" type="text/x-handlebars-template">
   {{#each .}}
      <div id="pet_box" class="btn-open-popup2">   
         <p class="mpno" style=display:none;>{{mpno}}</p>
         <p class="mpimage" style=display:none;>{{mpimage}}</p>      
         <img src="/display?fileName={{mpimage}}" style=width:150px;>
         <p class="mptitle">{{mptitle}}</p><hr/>
         <p class="mpwriter">{{mpwriter}}</p><span class="mpregdate">{{mpregdate}}</span>
      </div>
   {{/each}}
   </script>
   
</div>

<script>
	getList();
	
	function getList() {
		$.ajax({
			type : "get",
			url : "/board.json",
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp1").html());
				$("#tbl_board").html(temp(data));
			}
		});
		
		$.ajax({
			type : "get",
			url : "/shop.json",
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp2").html());
				$("#shop").html(template(data));
			}
		});
		
		$.ajax({
			type : "get",
			url : "/mypet.json",
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp3").html());
				$("#mypet").html(template(data));
			}
		});
	}
	
	//board row를 클릭한경우
	$("#tbl_board").on(
			"click",
			".row_board",
			function() {
				var bno = $(this).find(".bno").html();
				location.href = "board/read?bno=" + bno + "&page=" + 1
						+ "&keyword=" + "";
	});
	
	//shop row를 클릭한경우
	   $("#shop").on("click", ".row", function(){
	     var id=$(this).attr("id");
	     location.href="shop/read?id=" + id + "&page=" + 1;
	   });
	
	//mypet row를 클릭한경우
	$("#mypet").on("click", function(){
		location.href="mypet/list";
	});
</script>