<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#page {
		width:100%;
	}
	
	.pet_img {
		width : 300px;
		height : 330px;
	}
	
	.pet_img:hover {
		cursor:pointer;
	}
	
	.pet:hover > .pet_title {
		transition: display .5s;
		display:block;
	}
	
	#list {
		width:1500px; 
		overflow:hidden; 
		margin:0px auto;
	}
	.pet {
		width: 300px; 
		float:left; 
		margin:30px;
		position: relative;
		overflow:hidden;
	}

	.pet_title {
		display:none;
		width:300px;
		background:black;
		opacity: 0.5;
		position: absolute;
		color:white;
		text-align:center;
		padding:10px;
		top:88%;
	}
	
	#category_select {
		border: 1px solid #aeaeae;
		padding :7px 20px 7px 0px;
	}
	
	option {
		font-size:17px;
	}
	
	#search_box{
		border: 1px solid #aeaeae;
		padding :7px;
	}
	
	#search_box:focus{
		outline:none;
	}
	
	#search_pet_btn {
		border: 1px solid #aeaeae;
		background: white;
		padding:7px 30px;
	}
	
	.header_dictionary {
		width:500px;
		margin :0px auto;
		display:flex;
		justify-content: center;
		justify-content: space-between;
	}
	
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
	<img src="/resources/dog_img/dictionary_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">All PET</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">반려동물의 정보들을 신속하게 알려드립니다</p>
		  </div>
		</div>
	</div> 
</div>

<div id="header_board">
	<a id="freeBoard" href="/pet/list">반려 지식백과</a>
	<a id="petStar" href="/symptom/list">증상 지식백과</a>
</div>
<div id="page" style="text-align:center;">
	<p class="small_title">반려 지식백과</p>
	<p class="big_title">함께 살 반려동물들을 알아보세요 </p>
	<!--헤더 -->
	<div class="header_dictionary">
		<select id="category_select">
			<option value="all">전체</option>
			<option value="dog">견종</option>
			<option value="cat">묘종</option>
		</select>
		<input type="text" size=40 id="keyword">
		<input type="text" style="display:none">
		<input type="button" id="search_pet_btn" value="검색">
	</div>
	<!-- 메인 페이지 -->
	<div id="list"></div>
	<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<div class="pet" onClick="location.href='/pet/read?dno={{dno}}'">
			<img src="/display?fileName={{dimage}}" class="pet_img">
			<p class="pet_title">{{dtitle}}</p>
		</div>
	{{/each}}
	</script>
	
	<div class="pagination"></div>
</div>

<script>
	var searchform = $("#category_select");
	var searchType = searchform.find("option:selected").val();
	var page="${param.page==null?1:param.page}";
	var keyword="${param.keyword==null?'':param.keyword}"
	getList();
	
	function getList(){
		searchType = searchform.find("option:selected").val();
		keyword= $("#keyword").val();
		$.ajax({
			type: "get",
			url: "/pet/list.json",
			data: {page:page, keyword:keyword,searchType : searchType},
			dataType: "json",
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#list").html(template(data));
				$(".pagination").html(getPagination(data));
			}
		});
	}
	
	//검색버튼을 클릭한 경우
   $("#search_pet_btn").on("click", function(){
	  alert("검색"+keyword);
      page=1;
      getList();
   });
   
   
   //검색어상자에서 엔터를 친경우
   $("#keyword").on("keypress", function(e){
	   if(e.keyCode==13) $("#search_pet_btn").click();
   });
	
	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
</script>