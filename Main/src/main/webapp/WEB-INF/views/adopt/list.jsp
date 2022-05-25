
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.subject {
	width: 300px;
	color: gray;
}

.row {
	float:left;
	margin:10px;
}

.row:hover {
	cursor:pointer;
}

.row:hover > .adopt_title {
	transition: display .5s;
	display:block;
}

.adopt_img {
	width : 300px;
	height : 330px;
	z-index:-1;
}

#tbl_adopt {
	width:1400px;
	margin:0px auto;
	padding-left:50px;
}

.adopt_title {
	display:none;
	width:300px;
	background:black;
	opacity: 0.5;
	position: absolute;
	color:white;
	text-align:center;
	padding:10px;
	transform: translateY(-40px);
}
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
	<img src="/resources/adopt_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">입양 & 분양</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">포포펫의 반려동물들의 분양 목록을 알려드립니다</p>
		  </div>
		</div>
	</div> 
</div>

<div id="page">
	<p class="small_title">분양중인 아이들</p>
	<p class="big_title">포포펫의 아이들을 소개해드립니다 </p>
	<div id="tbl_adopt"></div>
	<script id="temp" type="text/x-handlebars-template"> 
      {{#each list}}
      <div class="row" onClick="location.href='/adopt/read?ano={{ano}}'">
		 <img src="/display?fileName={{image}}" class="adopt_img">
		 <div class="adopt_title">{{kinds}} - {{title}}</div>
      </div>
      {{/each}}
   </script>
	<script>
		Handlebars.registerHelper("display", function(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		});
	</script>
	<div class="pagination"></div>
	<div>
		<input type="text" id="keyword" value="${param.keyword }">
		<input type="button" value="검색" id="search">
	</div>
</div>
<script>
   var page="${param.page==null?1:param.page}";
   var keyword="${param.keyword==null?'':param.keyword}";
   getList();
   
   //인서트이동
   $("#insert").on("click",function(){
		location.href = "insert";
	});
   
   function getList(){
      keyword= $("#keyword").val();
      $.ajax({
         type: "get",
         url: "/adopt/list.json",
         data: {page:page, keyword:keyword},
         dataType: "json",
         success:function(data){
            var temp = Handlebars.compile($("#temp").html());
            $("#tbl_adopt").html(temp(data));
            //페이지목록출력
             $(".pagination").html(getPagination(data));     
         }
      });
   }
   
   //페이지 번호를 클릭한 경우
   $(".pagination").on("click", "a", function(e){
      e.preventDefault();
      page=$(this).attr("href");
      getList();
   });
</script>