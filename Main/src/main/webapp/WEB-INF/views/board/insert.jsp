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
<div id="header_board">
	<a href="/board/list">자유게시판</a>
	<a href="/mypet/list">펫스타그램</a>
</div>
<div class="board_page">
   <p class="small_title">글쓰기</p>
   <p class="big_title">자신의 이야기를 적어주세요</p>
   <form name="frm1" method="post" >
      <table id="tbl_boardInsert">
         <tr class="btitle"	>
            <td class="title" width=100>제목</td>
            <td width=300><input type="text" id="btitle" name="btitle" size=30></td>
         </tr>
         <tr>
            <td class="title" width=100>작성자</td>
            <td width=300><input type="text" name="bwriter" value="${unickname}" size=10 style="border:none;" readonly></td>
         </tr>
         <tr>
            <td class="title" width=100>내용</td>
            <td width=1000><textarea rows="10" cols="80" id="bcontent" name="bcontent"></textarea></td>
         </tr>
      </table>
      <div style="text-align:center;margin-top:10px;">
      	<button id="submit_board">게시글등록</button>
      	<a id="cancel_board" href="/board/list">등록취소</a>
      	</div>
   </form>
</div>

<script>
//ckEditor출력
var ckeditor_config = {
    resize_enable : true, //editor 사이즈를 변경하지 못한다. 
    enterMode : CKEDITOR.ENTER_BR, 
    shiftEnterMode : CKEDITOR.ENTER_P, 
    filebrowserUploadUrl : "/ckupload", 
    height: 300
 };
   CKEDITOR.replace('bcontent', ckeditor_config)

   $("#submit_board").on("click", function(e){
      e.preventDefault();
      var btitle=$("#btitle").val();
      
      if(btitle==""){
         alert("제목을 입력하세요");
         $(frm1.btitle).focus();
         return;
      }else if(CKEDITOR.instances.bcontent.getData()==""){
         alert("내용을 입력하세요");
         $(frm1.bcontent).focus();
         return;
      }
      if(!confirm("게시글을 등록하시겠습니까?"))return;
      frm1.submit();
   });
   
   function goBack() { 
	   window.history.back(); 
	}

   /*
   //이미지 미리보기
   $(frm.file).on("change", function(){
      var file=$(frm.file)[0].files[0];
      $("#image").attr("src", URL.createObjectURL(file));
   });
   */
</script>