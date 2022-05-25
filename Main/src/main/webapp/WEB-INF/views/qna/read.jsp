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
          <p id="banner_top" class="slide-up">고객센터</p>
        </div>
        <div class="notosanskr">
          <p id="banner_bottom" class="slide-up">궁금한게 있으면 물어봐주세요</p>
        </div>
      </div>
   </div> 
</div>
<header style="text-align:center;">
   <p class="small_title">QnA</p>
   <p class="big_title">자유롭게 질문해주세요</p>
</header><article id="board_readUser" style="width: 900px; margin:0px auto; text-align:left;">
   <div class="boardRead_nav">
      <div style="font-size:18px;">${vo.qtitle}</div>
      <div><label>작성일 |</label>&nbsp;<fmt:formatDate value="${vo.qdate}" pattern="yyyy-MM-dd"/></div>
   </div>
   
   <div class="boardRead_nav2">
      <div>작성자: ${vo.qwriter}</div>
      <c:if test="${vo.qwriter==unickname}">
         <div>
            <a onClick="location.href='/board/update?bno=${vo.bno}'">수정</a>
            <a id="bdelete">삭제</a>
         </div>
      </c:if>
   </div>
   <p class="board_userContent">${vo.qcontent}</p>
   <c:if test="${unickname eq vo.qwriter || manager == 1}">
      <img src="/resources/edit.png" width=20>
   <label>댓글입력</label>
   <div class="comment_box">
      <textarea rows=4 cols=115 id="brreply"></textarea>
      <button id="insert">댓글 입력</button>
   </div>
   <div class="comment_title">Comments</div>
   <div id="breplies"></div>
   <script id="temp" type="text/x-handlebars-template">
      {{#each list}}
         <div class="row">
            <div style="display:flex; justify-content:space-between;">
               <label>{{awriter}} {{adate}}</label>
               <div style="display:{{display awriter}}">
                  <a class="adelete" ano={{ano}}>삭제</a>
               </div>
            </div>
            <textarea rows=3 cols=125 class="brreply" {{read awriter}}>{{acontent}}</textarea>
         </div>
      {{/each}}
      </script>
   </c:if>   
   
      <script>
         Handlebars.registerHelper("display", function(awriter){
            if(awriter!="${unickname}"){
               var btn=$("#board_upadte_btn");
               btn.css({
                  "display" : "none"
               });
               return "none";
            }
         });
         
         Handlebars.registerHelper("read", function(awriter){
            if(awriter!="${unickname}"){
               return "readonly";
            }
         });
      </script>
   <div class="pagination"></div>
</article>

<script>
	var qno = "${vo.qno}";
	
	$("#adelete").on("click", function() {
		if (!confirm(qno + "를(을) 삭제하시겠습니까?"))
			return;

		location.href = "delete?qno=" + qno;
	});

	//댓글 등록
	$("#insert").on("click", function() {

		var awriter = "${awriter}";
		var acontent = $("#brreply").val();
		if (acontent == "") {
			alert("댓글을 입력하세요!");
			return;
		}
		if (!confirm("댓글을 등록하실래요?"))
			return;
		$.ajax({
			type : "post",
			url : "/aqna/insert",
			data : {
				qno : qno,
				awriter : "관리자",
				acontent : acontent
			},
			success : function() {
				alert("댓글이 등록되었습니다");
				getList();
				$("#acontent").val("");
			}
		});
	});
	
	var page = 1;
	getList();
	function getList() {
		$.ajax({
			type : "get",
			url : "/aqna/list.json",
			data : {
				page : page,
				qno : qno
			},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#breplies").html(template(data));
			}
		});
	}
	
	$("#breplies").on("click",".adelete", function() {
		var ano = $(this).attr("ano");
		if(!confirm("댓글을 삭제하시겠습니까?"))return;
		$.ajax({
			type : "post",
			url : "/aqna/delete",
			data : {
				ano : ano
			},
			success : function(data) {
				getList();
			}
		});
	});
	
</script>