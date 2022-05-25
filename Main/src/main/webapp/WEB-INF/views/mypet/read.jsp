<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="page" style="width: 900px; margin: 0px auto; margin-top: 50px;">
	<div>
		<img src="/display?fileName=${vo.mpimage}" style=width:350px;>
	</div>
	<div>
		<h2>${vo.mpwriter} <fmt:formatDate value="${vo.mpregdate}" pattern="yyyy-MM-dd HH:mmd:ss" /></h2>
	</div>
	<hr/>
	<div>
		<h2>${vo.mptitle}</h2>
		<h2>${vo.mpcontent}</h2>
	</div>
	<c:if test="${unickname eq vo.mpwriter}">
		<button onClick="location.href='/mypet/update?mpno=${vo.mpno}'">수정</button>
		<button id="mpdelete">삭제</button>
	</c:if>
	<hr><br><br>	
	<hr/>
	<div>
		<textarea rows=5 cols=115 id="mpreply" placeholder="댓글을 입력하세요"></textarea>
		<br>
		<button id="insert">댓글 입력</button>
	</div>
	<div id="mpreplies"></div>
	<script id="temp" type="text/x-handlebars-template">
	{{#each mprlist}}
		<div class="row" mprno="{{mprno}}">
			<h4>{{mpreplydate}} ${unickname}</h4>
			<textarea rows=5 cols=80 class="mpreply">{{mpreply}}</textarea>
			<div style="display:{{display mpreplyer}}">
				<button class="update">수정</button>
				<button class="delete">삭제</button>
			</div>
		</div>
	{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("display", function(mpreplyer){
			if(mpreplyer!="${uid}"){
				var btn=$("#mypet_upadte_btn");
				btn.css({
					"display" : "none"
				});
				return "none";
			}
		});
	</script>
	<div class="pagination"></div>
</div>
<script>
	var mpno = "${vo.mpno}";
	var page = 1;
	getList();
	
	$("#mpdelete").on("click", function(){
		var mpno="${param.mpno}";
		if(!confirm(mpno + "을(를) 삭제하실래요?"))
			return;
		location.href = "delete?mpno=" + mpno;
	});

	//댓글 수정
	$("#mpreplies").on("click", ".update", function(e) {
		e.preventDefault;
		var row = $(this).parent().parent();
		var mprno = row.attr("mprno");
		var mpreply = row.find(".mpreply").val();
		if(!confirm(mprno + "번 댓글을 수정하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/mypetreply/update",
			data: {mprno:mprno, mpreply:mpreply},
			success: function(){
				alert("댓글수정 성공!");
				getList();
			}
		});
	});
	
	//댓글 삭제
	$("#mpreplies").on("click", ".delete", function() {
		var row = $(this).parent().parent();
		var mprno = row.attr("mprno");
		if(!confirm(mprno + "번 댓글을 삭제하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/mypetreply/delete",
			data: {mprno:mprno},
			success: function(){
				alert("댓글삭제 성공!");
				getList();
			}
		});
	});

	//댓글 등록
	$("#insert").on("click", function() {
		var mpreplyer = "${uid}";
		var mpreply = $("#mpreply").val();
		if (mpreply == "") {
			alert("댓글을 입력하세요!");
			$("#mpreply").focus();
			return;
		}
		if (!confirm("댓글을 등록하실래요?"))
			return;
		$.ajax({
			type : "post",
			url : "/mypetreply/insert",
			data : {
				mpno : mpno,
				mpreplyer : mpreplyer,
				mpreply : mpreply
			},
			success : function() {
				alert("댓글등록 성공!");
				getList();
				$("#mpreply").val("");
			}
		});
	});

	function getList() {
		$.ajax({
			type : "get",
			url : "/mpreply/list.json",
			dataType : "json",
			data : {
				page : page,
				mpno : mpno
			},
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#mpreplies").html(template(data));
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

	$("#delete").on("click", function() {
		var mpno = "${param.mpno}";
		if (!confirm(mpno + "를(을) 삭제?"))
			return;
		location.href = "delete?mpno=" + mpno;
	});
</script>