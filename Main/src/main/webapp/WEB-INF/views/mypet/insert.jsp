<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.tbl{
	margin-left:500px;
}

</style>    
<div class="page">
	<h1>사진 등록</h1>
	<form name="mpfrm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="uimage" value="${image}" size=80>
		<table class="tbl">
			<tr>
				<td class="title" width=100>사진</td>
				<td width=700>
					<img id="mpimage" name="mpimage" src="https://via.placeholder.com//300x200" width=250/>
					<input type="file" id="file" name="file" accept="image/* "style=display:none;>
				</td>
			</tr>
			<tr>
				<td class="title" width=100>제목 :</td>
				<td width=600><input type="text" id="mptitle" name="mptitle" size=80></td>
			</tr>
			<tr>
            <td class="mpwriter" width=100>작성자</td>
            <td width=300><input type="text" name="mpwriter" value="${unickname}" size=10 readonly></td>
         </tr>
			<tr>
				<td class="title" width=100>내용</td>
				<td width=700>
					<textarea rows="10" cols="80" id="mpcontent" name="mpcontent"></textarea>
				</td>
			</tr>		
		</table>
		<div style="text-align:center;margin-top:20px;">
			<input type="submit" value="사진 올리기">
			<input type="reset" value="등록취소">
		</div>
	</form>
</div>

<script>
	$(mpfrm).on("submit", function(e){
		e.preventDefault();
		var mptitle=$("#mptitle").val();
		var mpcontent=$("#mpcontent").val();
		var mpimage=$("#file").val();
		
		if(mpimage==""){
			alert("사진을 등록하세요!");
			return;
		}else if(mptitle==""){
			alert("제목을 입력하세요!");
			$("#mptitle").focus();
			return;
		}else if(mpcontent==""){
			alert("내용을 입력하세요!");
			$("#mpcontent").focus();
			return;
		}
		
		if(!confirm("사진을 등록하실래요?")) return;
		mpfrm.submit();
	});

	$("#mpimage").on("click", function(){
		$("#file").click();
	});

	//이미지 미리보기
	$("#file").on("change", function(e){
		var file=$("#file")[0].files[0];
		$("#mpimage").attr("src", URL.createObjectURL(file));
	});
</script>