<link href="/resources/board.css" rel="stylesheet" >
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.subject {
	width: 300px;
	color: gray;
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
	<p class="small_title">증상 지식백과</p>
	<p class="big_title">반려동물들의 안전을 지켜주세요 </p>
	<div style="border-bottom: 1px dotted gray; padding-bottom: 10px;">
		<div>
			<input type="text" id="keyword" value="${param.keyword}" size=40> 
			<input type="text" name="aaa" style="display: none;"> 
			<input type="button" id="search" value="검색">
		</div>
	</div>
	<table id="tbl_board"></table>
	<script id="temp" type="text/x-handlebars-template">
      <tr class="title">
         <td width=100>No.</td>
		 <td width=200>분류</td>
         <td width=500>제목</td>
		 <td width=100>작성자</td>
      </tr>   
      {{#each list}}
      <tr class="row_board" sno="{{sno}}">
         <td class="sno">{{sno}}</td>
		 <td>{{stype}}</td>
		 <td>{{stitle}}</td>
		 <td>포포펫</td>
      </tr>
      {{/each}}
   </script>
	<div class="pagination"></div>
</div>
<script>
	var page = "${param.page==null?1:param.page}";
	var keyword = "${param.keyword==null?'':param.keyword}";
	getList();

	
	$("#insert").on("click", function() {
		location.href = "insert";
	});

	function getList() {
		keyword = $("#keyword").val();
		$.ajax({
			type : "get",
			url : "/symptom/list.json",
			data : {
				page : page,
				keyword : keyword
			},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl_board").html(temp(data));

				//페이지목록출력
				$(".pagination").html(getPagination(data));

			}
		});
	}
	//row를 클릭한경우
	$("#tbl_board").on(
			"click",
			".row_board",
			function() {
				var sno = $(this).find(".sno").html();
				location.href = "read?sno=" + sno + "&page=" + page
						+ "&keyword=" + keyword;
			});

	//검색버튼을 클릭한 경우
	$("#search").on("click", function() {
		page = 1;
		getList();
	});

	//검색어상자에서 엔터를 친경우
	$("#keyword").on("keypress", function(e) {
		if (e.keyCode == 13)
			$("#search").click();
	});
	//페이지 번호를 클릭한 경우
	$(".pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getList();
	});
</script>