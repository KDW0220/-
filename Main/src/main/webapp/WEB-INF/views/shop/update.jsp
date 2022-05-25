<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="page">
	<h1>상품 정보수정</h1>
	<form name="update" id="update" method="post" action="update" enctype="multipart/form-data">
		<table>
			<tr>
				<td width=100 class="title">제목</td>
				<td width=500><input type="text" value="${vo.title }" name="title" id="title" size=50></td>
				<td><input type="hidden" value="${vo.id}" name="id" id="id"></td>
			</tr>
			<tr>
				<td width=100 class="title">가격</td>
				<td width=500><input type="text" value="${vo.price }" name="price" id="price" size=5> 원</td>
			</tr>
			<tr>
				<td width=100 class="title">링크</td>
				<td width=500><input type="text" value="${vo.link }" name="link" id="link" size=70></td>
			</tr>
			<tr>
				<td width=100 class="title">이미지</td>
				<td width=500>
					<input type="file" name="file" style="display:none;" accept="image/*">
					<img id="image" src="/display?fileName=${vo.image}" width=300>
					<input type="hidden" name="image" value="${vo.image}" id="file">
				</td>
			</tr>
		</table>
		<div style="text-align:center;margin-top:10px;">
			<input type="submit" value="정보수정">
			<input type="reset" value="수정리셋">
			<span><a href="/shop/list">목록이동</a></span>
		</div>
	</form>
</div>
<script>
	//Submit 버튼을 클릭한 경우
	$(update).on("submit", function(e) {
		e.preventDefault();
		var form=document.update;
		var title = $("#title").val();
		var file = $("#file").val();
		var price= $("#price").val();
		var link = $("#link").val();
		var id="${param.id}";
			
		if (title == "") {
			alert("제목을 입력하세요!");
			$(update.title).focus();
			return;
		} else if (price == "") {
			alert("가격을 숫자로 입력하세요!");
			$(update.price).focus();
			return;
		} else if (file == "") {
			alert("사진을 선택하세요!");
			return;
		}
		price = price + "원";
		if (!confirm("상품 게시글을 수정하실래요?")) return;
		form.submit();
	});

	//이미지 미리보기
	$("#image").on("click", function() {
		$(update.file).click();
	});

	$(update.file).on("change", function(e) {
		var file = $(update.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
