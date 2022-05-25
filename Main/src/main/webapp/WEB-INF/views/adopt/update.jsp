<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="page">
	<h1>입양&분양 정보수정</h1>
	<form name="frm" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td width=100 class="title">제목</td>
				<td width=500><input type="text" value="${vo.title }" name="title" size=50></td>
			</tr>
			<tr>
				<td width=100 class="gender">성별</td>
				<td width=500><input type="text" value="${vo.gender }" name="gender" size=10></td>
			</tr>	
			<tr>
				<td width=100 class="title">품종</td>
				<td width=500><input type="text" value="${vo.kinds }" name="kinds" size=5></td>
			</tr>
			<tr>
				<td width=100 class="title">중성화</td>
				<td width=500><input type="text" value="${vo.neutering }" name="neutering" size=5></td>
			</tr>
			<tr>
				<td width=100 class="title">나이</td>
				<td width=500><input type="text" value="${vo.age }" name="age" size=5></td>
			</tr>
			<tr>
				<td width=100 class="title">이미지</td>
				<td width=500>
					<input type="file" name="file" style="display:none" accept="image/*">
					<img id="image" src="/display?fileName=${vo.image}" width=300>
					<input type="hidden" name="image" value="${vo.image}">
				</td>
			</tr>
			<tr>
				<td width=100 class="title">상세정보</td>
				<td>textarea id="editor" rows="10" cols="80" name="content">${vo.detail}</textarea></td>
			</tr>
		</table>
		<div style="text-align:center;margin-top:10px;">
			<input type="submit" value="정보수정">
			<input type="reset" value="수정리셋">
			<span><a href="/adopt/list">목록이동</a></span>
		</div>
	</form>
</div>
<script>
	//Submit 버튼을 클릭한 경우
	$(frm).on("submit", function(e) {
		e.preventDefault();
		
		var title = $(frm.title).val();
		var kinds = $(frm.kinds).val();
		var neutering = $(frm.neutering).val();
		var age = $(frm.age).val();
		var gender = $(frm.gender).val();
		var file = $(frm.file).val();
		var detail = $(frm.detail).val();

		if (title == "") {
			alert("제목을 입력하세요!");
			$(frm.title).focus();
			return;
		} else if (age == "" || age.replace(/[0-9]/g, '')) {
			alert("나이를 숫자로 입력하세요!");
			$(frm.price).focus();
			return;
		} else if (file == "") {
			alert("사진을 선택하세요!");
			return;
		}
		if (!confirm("분양&입양 게시글을 수정하실래요?"))
			retun;
		frm.submit();
	});

	//이미지 미리보기
	$("#image").on("click", function() {
		$(frm.file).click();
	});

	$(frm.file).on("change", function(e) {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
