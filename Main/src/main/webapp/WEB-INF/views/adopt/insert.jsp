<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="page">
	<h1>입양&분양등록</h1>
	<form name="frma" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td width=100 class="title">제목</td>
				<td width=500><input type="text" name="title" size=50></td>
			</tr>
			<tr>
				<td width=100 class="gender">성별</td>
				<td width=500><input type="text" name="gender" size=10></td>
			</tr>	
			<tr>
				<td width=100 class="title">품종</td>
				<td width=500><input type="text" name="kinds" size=5></td>
			</tr>
			<tr>
				<td width=100 class="title">중성화</td>
				<td width=500><input type="text" name="neutering" size=5></td>
			</tr>
			<tr>
				<td width=100 class="title">나이</td>
				<td width=500><input type="text" name="age" size=5></td>
			</tr>
			<tr>
				<td width=100 class="title">이미지</td>
				<td width=500><input type="file" name="file" style="display: none" accept="image/*"> 
				<img id="imagea" src="https://via.placeholder.com/300x200" width=300></td>
			</tr>
			<tr>
				<td width=100 class="title">상세정보</td>
				<td><textarea id="editor" rows="10" cols="80" name="detail" style="margin-top:30px;"></textarea></td>
			</tr>
		</table>
		<div style="text-align: center; padding-top: 20px;">
			<input type="submit" value="상품등록"> 
			<input type="reset"	value="등록취소">
		</div>
	</form>
</div>
<script>
	
	//Submit 버튼을 클릭한 경우
	$(frma).on("submit", function(e) {
		e.preventDefault();
		var title = $(frma.title).val();
		var kinds = $(frma.kinds).val();
		var neutering = $(frma.neutering).val();
		var age = $(frma.age).val();
		var gender = $(frma.gender).val();
		var file = $(frma.file).val();
		var detail = $(frma.detail).val();
		alert(detail);
		if (title == "") {
			alert("제목을 입력하세요!");
			$(frma.title).focus();
			return;
		} else if (age == "" || age.replace(/[0-9]/g, '')) {
			alert("나이를 숫자로 입력하세요!");
			$(frma.age).focus();
			return;
		} else if (file == "") {
			alert("사진을 선택하세요!");
			return;
		} else if (detail == "") {
			alert("설명을 적으세요!");
			return;
		}
		if (!confirm("분양&입양 게시글을 등록하실래요?"))
			retun;
		frma.submit();
	});

	//이미지 미리보기
	$("#imagea").on("click", function() {
		$(frma.file).click();
	});

	$(frma.file).on("change", function(e) {
		var file = $(frma.file)[0].files[0];
		$("#imagea").attr("src", URL.createObjectURL(file));
	});
</script>
