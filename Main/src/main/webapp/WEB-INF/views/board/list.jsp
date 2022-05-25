<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/board.css" rel="stylesheet" >
<style>
	#board_footer {
		margin:0px auto;
		width:1150px;
		text-align:right;
	}
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
	<img src="/resources/board_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">게시판</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">다양한 이야기들을 적어 함께 공유해주세요</p>
		  </div>
		</div>
	</div> 
</div>
<div id="board_content">
	<div id="header_board">
		<a id="freeBoard" href="/board/list">자유게시판</a>
		<a id="petStar" href="/mypet/list">펫스타그램</a>
	</div>
	<p class="small_title">자유게시판</p>
	<p class="big_title">자유롭게 정보를 공유하세요</p>
	<div>
		<form method="get" id="searchForm">
			<select name="searchType">
				<option value='' selected>-- 선택 --</option>
				<option value="bcontent">제목+내용</option>
				<option value="bwriter">작성자</option>
			</select> 
			<input type="text" id="keyword" value="${param.keyword}" size=40> 
			<input type="text" name="aaa" style="display: none;"> 
			<input type="button" id="search" value="검색">
		</form>
	</div>
	<table id="tbl_board"></table>
	<script id="temp" type="text/x-handlebars-template">
      <tr class="title">
         <td width=100>번호</td>
         <td width=600>제목</td>
         <td width=100>작성자</td>
         <td width=250>날짜</td>
		 <td width=100>조회수</td>
      </tr>   
      {{#each list}}
      <tr class="row_board">
         <td class="bno">{{bno}}</td>
         <td class="btitle">{{btitle}}</td>
         <td>{{bwriter}}</td>
         <td>{{bregdate}}</td>
		 <td>{{bcount}}</td>
      </tr>
      {{/each}}
   </script>
	<div id="board_footer">
		<input type="button" id="submit_board" value="글쓰기">
	</div>
	<div class="pagination"></div>
</div>
<script src="/resources/pagination.js"></script>
<script>
	var searchType = '';
	var searchform = $("#searchForm");
	var page = "${param.page==null ? 1: param.page}";
	var keyword = "${param.keyword==null ? '': param.keyword}";
	getList();

	function getList() {
		keyword = $("#keyword").val();
		searchType = searchform.find("option:selected").val();
		$.ajax({
			type : "get",
			url : "/board/list.json",
			data : {
				page : page,
				keyword : keyword,
				searchType : searchType
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

	//인서트로 ㄱ
	$("#submit_board").on("click", function() {
		location.href = "insert";
	});

	//row를 클릭한경우
	$("#tbl_board").on(
			"click",
			".row_board",
			function() {
				var bno = $(this).find(".bno").html();
				location.href = "read?bno=" + bno + "&page=" + page
						+ "&keyword=" + keyword;
			});

	//검색버튼을 클릭한 경우
	$("#search").on("click", function() {
		if(searchform.find("option:selected").val()==''){
			alert("검색조건을 선택해주세요.");
			return;
		}
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