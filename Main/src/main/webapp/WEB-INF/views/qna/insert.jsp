<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
   .board_page {
      text-align:center;
   }
   
   #tbl_boardInsert {
      margin: 0px auto;
   }
   
   #tbl_boardInsert .btitle {
      border-top:1px solid black;
   }
   
   #tbl_boardInsert tr {
      border-bottom:1px solid #dedede;
   }
   
   #tbl_boardInsert td {
      padding : 10px;
   }
   
   #submit_board {
      background:#a36152;
      color:white;
      border:none;
      padding:20px;
      font-weight:bold;
   }
   
   #cancel_board {
      background:#232323;
      color:white;
      border:none;
      padding:22px;
      font-weight:bold;
   }
   
   #cancel_board:hover {
      text-decoration:none;
   }
   
   .title {
      font-weight:bold;
   }
   
   #qcontent {
   		resize:none;
   }
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
   <img src="/resources/board_banner.png" style="height:500px; width:100%;">
   <div class="body_banner"> 
      <div class="heading">
        <div>
          <p id="banner_top" class="slide-up">QnA</p>
        </div>
        <div class="notosanskr">
          <p id="banner_bottom" class="slide-up">궁금한게 있으면 물어봐주세요</p>
        </div>
      </div>
   </div> 
</div>
<div class="board_page">
   <p class="small_title">QnA</p>
   <p class="big_title">자유롭게 질문해주세요</p>
   <form name="frmb" method="post" action="insert">
      <table id="tbl_boardInsert">
         <tr class="btitle"   >
            <td class="title" width=100>제목</td>
            <td width=300><input type="text" id="qtitle" name="btitle" size=30></td>
         </tr>
         <tr>
            <td class="title" width=100>작성자</td>
            <td width=300><input type="text" name="qwriter" value="${unickname}" size=10 style="border:none;" readonly></td>
         </tr>
         <tr>
            <td class="title" width=100>내용</td>
            <td width=1000><textarea rows="10" cols="80" id="qcontent" name="qcontent"></textarea></td>
         </tr>
      </table>
      <div style="text-align:center;margin-top:10px;">
			<input type="submit" value="게시물등록"> 
			<input type="button" value="등록취소" onClick="location.href='/qna/list'">
         </div>
   </form>
</div>

<script>
	$(frmb).on("submit", function(e) {
		e.preventDefault();
		var form = document.frmb;
		var qtitle = $(frmb.qtitle).val();
		var qcontent = $(frmb.qcontent).val();
		var qwriter = $("#qwriter").html();
		
		
		if (qtitle == "") {
			alert("제목을 입력해주세요");
			$(frmb.qtitle).focus();
			return;
		
		} else if (qcontent == "") {
			alert("내용을 입력해주세요");
			$(frmb.qcontent).focus();
			return;
		
		}if (!confirm("게시글을 등록하시겠습니까?"))
			return;
		
		form.submit();
		
	});
</script>