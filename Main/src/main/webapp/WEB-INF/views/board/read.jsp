<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="/resources/board.css" rel="stylesheet" >

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
<header style="text-align:center;">
	<div id="header_board">
		<a id="freeBoard" href="/board/list">자유게시판</a>
		<a id="petStar" href="/mypet/list">펫스타그램</a>
	</div>
	<p class="small_title">자유게시판</p>
	<p class="big_title">자유롭게 정보를 공유하세요</p>
</header>

<article id="board_readUser" style="width: 900px; margin:0px auto; text-align:left;">
	<a href="/board/list?page=${param.page}&keyword=${param.keyword}">목록이동</a>
	
	<div class="boardRead_nav">
		<div style="font-size:18px;">${vo.btitle}</div>
		<div><label>작성일 |</label>&nbsp;<fmt:formatDate value="${vo.bregdate}" pattern="yyyy-MM-dd"/></div>
	</div>
	
	<div class="boardRead_nav2">
		<div>작성자: ${vo.bwriter}</div>
		<c:if test="${vo.bwriter==unickname}">
			<div>
				<a onClick="location.href='/board/update?bno=${vo.bno}'">수정</a>
				<a id="bdelete">삭제</a>
			</div>
		</c:if>
	</div>
	<p class="board_userContent">${vo.bcontent}</p>
	<img src="/resources/edit.png" width=20>
	<label>댓글입력</label>
	<div class="comment_box">
		<textarea rows=4 cols=115 id="brreply"></textarea>
		<button id="insert">댓글 입력</button>
	</div>
	
	<div class="comment_title">Comments</div>
	<div id="breplies"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each brlist}}
			<div class="row" brno="{{brno}}">
				<div style="display:flex; justify-content:space-between;">
					<label>{{brreplyer}} {{brreplydate}}</label>
					<div style="display:{{display brreplyer}}">
						<a class="update">수정</a>
						<a class="delete">삭제</a>
					</div>
				</div>
				<textarea rows=3 cols=125 class="brreply" {{read brreplyer}}>{{brreply}}</textarea>
			</div>
		{{/each}}
		</script>
		<script>
			Handlebars.registerHelper("display", function(brreplyer){
				if(brreplyer!="${unickname}"){
					var btn=$("#board_upadte_btn");
					btn.css({
						"display" : "none"
					});
					return "none";
				}
			});
			
			Handlebars.registerHelper("read", function(brreplyer){
				if(brreplyer!="${unickname}"){
					return "readonly";
				}
			});
		</script>
	<div class="pagination"></div>
</article>
<script>
	var bno = "${vo.bno}";
	var page = 1;
	getList();
	
	$("#bdelete").on("click", function(){
		var bno="${param.bno}";
		if(!confirm(bno + "을(를) 삭제하실래요?"))
			return;
		location.href = "delete?bno=" + bno;
	});

	//댓글 수정
	$("#breplies").on("click", ".update", function(e) {
		e.preventDefault;
		var row = $(this).parent().parent();
		var brno = row.attr("brno");
		var brreply = row.find(".brreply").val();
		if(!confirm("댓글을 수정하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/breply/update",
			data: {brno:brno, brreply:brreply},
			success: function(){
				getList();
			}
		});
	});
	
	//댓글 삭제
	$("#breplies").on("click", ".delete", function() {
		var row = $(this).parent().parent().parent();
		var brno = row.attr("brno");
		if(!confirm("댓글을 삭제하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/breply/delete",
			data: {brno:brno},
			success: function(){
				getList();
			}
		});
	});

	//댓글 등록
	$("#insert").on("click", function() {
		var brreplyer = "${unickname}";
		var brreply = $("#brreply").val();
		if (brreply == "") {
			alert("댓글을 입력하세요!");
			$("#brreply").focus();
			return;
		}
		if (!confirm("댓글을 등록하실래요?"))
			return;
		$.ajax({
			type : "post",
			url : "/breply/insert",
			data : {
				bno : bno,
				brreplyer : brreplyer,
				brreply : brreply
			},
			success : function() {
				alert("댓글등록 성공!");
				getList();
				$("#brreply").val("");
			}
		});
	});

	function getList() {
		$.ajax({
			type : "get",
			url : "/breply/list.json",
			dataType : "json",
			data : {
				page : page,
				bno : bno
			},
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#breplies").html(template(data));
				//페이지목록출력
				$(".pagination").html(getPagination(data));
			}
		});
	}

	//페이지 번호를 클릭한 경우
	$(".pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getList();
	});
</script>