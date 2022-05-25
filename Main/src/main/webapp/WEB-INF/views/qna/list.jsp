<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link href="/resources/board.css" rel="stylesheet" >
<style>
	#board_footer {
		margin:0px auto;
		width:1150px;
		text-align:right;
	}

	#banner_top {
		margin-left:150px;
	}
	
	.wait {
		font-size:13px;
		width:80px;
		border:1px solid #aeaeae;
		border-radius:10px;
		color:#aeaeae;
		margin:0px auto;
	}
	
	.complete {
		font-size:13px;
		width:80px;
		border:1px solid #d69c7c;
		background:#d69c7c;
		border-radius:10px;
		color:white;
		margin:0px auto;
	}
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
   <img src="/resources/qna_banner.png" style="height:500px; width:100%;">
   <div class="body_banner"> 
      <div class="heading">
        <div>
          <p id="banner_top" class="slide-up">고객센터</p>
        </div>
        <div class="notosanskr">
          <p id="banner_bottom" class="slide-up">강아지,고양이 입양 상담 . 무엇이든 물어봐주세요</p>
        </div>
      </div>
   </div> 
</div>
<div id="board_content">
   <p class="small_title">QnA</p>
   <p class="big_title">자유롭게 질문해주세요</p>
   <table id="tbl_board"></table>
	<script id="temp" type="text/x-handlebars-template">
	<tr class="title">
		<td width=100>번호</td>
		<td width=400>제목</td>
		<td iwdth=100>작성자</td>
		<td width=250>날짜</td>
		<td width=150>상태</td>
	</tr>
   {{#each list}}
      <tr class="row_board">
        <td class="bno">{{qno}}</td>	
        <td class="btitle">{{qtitle}}</td>
		<td><p class="writer">{{qwriter}}</p></td>
		<td>{{qdate}}</td>
		<td><p class="{{style qstatus}}">{{display qstatus}}</p></td> 
      </tr>
   {{/each}}
   </script>
   <script>
		Handlebars.registerHelper("display", function(qstatus){
			if(qstatus==0){
				return "답변대기";
			}else if(qstatus==1){
				return "답변완료";
			}
		});
		
		Handlebars.registerHelper("style", function(qstatus){
			if(qstatus==0){
				return "wait";
			}else if(qstatus==1){
				return "complete";
			}
		});
	</script>   
   	<div id="board_footer">
   		<a href="/qna/insert" >게시글 작성</a>
   	</div>
   <div class="pagination"></div>
</div>
<script src="/resources/pagination.js"></script>
<script>
	var keyword="${param.keyword==null?'':param.keyword}";
	
	var page = "${param.page==null ? 1: param.page}";
	getList();
	function getList() {
		$.ajax({
			type : "get",
			url : "/qna/list.json",
			data : {
				page : page
			},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#tbl_board").html(template(data));
				$(".pagination").html(getPagination(data));
			}
		});
	}
	
	
	//row를 클릭한경우
	   $("#tbl_board").on("click", ".row_board", function(){
		  var qno=$(this).find(".bno").html();
		  location.href="read?qno=" + qno ;
	   });
	
	$(".pagination").on("click", "a", function(e){
	      e.preventDefault();
	      page=$(this).attr("href");
	      getList();
	   });
	
</script>