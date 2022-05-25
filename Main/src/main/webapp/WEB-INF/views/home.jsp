<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	footer {
		width:100%;
		height:140px;
		background:#fc8c53;
		transform: translateY(100%);
		padding:15px 0px; 
	}
	
	.footer_content {
		text-align:center;
		display:flex;
		justify-content:center;
		align-items:center;
	}
</style>
<html>
<head>
	<title>게시판관리</title>
	<link href="/resources/main.css" rel="stylesheet" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/pagination.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>
	<div id="page">
		<div id="header">
			<c:if test="${uid==null}">
				<span class="user_login">
					<a class="btn-open-popup">LOGIN</a>
					&nbsp;&nbsp;&nbsp;
					<a href="/user/join_sel">JOIN</a>
				</span>
			</c:if>
			<c:if test="${uid!=null}">
				<c:if test="${manager == 1}">
						<span>
							<a href="/admin/index">관리자화면</a>
						</span>
					</c:if>
				<span class="user_login">
					<span><a href="/user/update?uid=${uid}">${unickname}님</a></span>
					<a href="/user/logout">LOGOUT</a>
					<a href="/cart/list?uid=${uid}" style="margin-left:20px; color:#a84e32;">장바구니</a>
				</span>
			</c:if>	
			<a href="/"><img src="/resources/Logo.png" style="width:250px; height :150px; margin-top:-20px;"></a>
		</div>
		
		
		<div class="nav">
			<div id="menu" style="position: sticky;">
				<span><a href="/pet/list" id="pet_list">포포펫 지식백과</a></span>
				<span><a href="/hospital/list">펫병원 찾기</a></span>
				<span><a href="/shop/list">상품구매</a></span>
				<span><a href="/board/list">포포펫 꿀팁</a></span>
				<span><a href="/adopt/list">입양 & 분양	</a></span>
				<span><a href="/qna/list">고객센터</a></span>
				
			</div>
			<div id="aside" style="position: absolute;">
				<span>
					<img src="/resources/menu.png" width=50><br>
					<a href="/pet/list" id="pet_list">퀵메뉴</a>
				</span>
				<span>
					<img src="/resources/chat_kakao.png" width=40><br>
					<a href="/pet/list" id="pet_list">카톡<br>상담</a>
				</span>
				<span>
					<img src="/resources/up-arrow.png" width=25><br><br>
					<img src="/resources/down-arrow.png" width=25>
				</span>
			</div>
		</div>
		
		
		<div id="content">
			<jsp:include page="${pageName}"/>
		</div>
		<footer>
			<div class="footer_content">
				<img src="/resources/Logo.png" style="width:200px;">
				<div>
					<p>(주)미니펫 | 대표 : 박선우 | 엔지니어 : 권도일,김동우,이상현,장요한,정인호,황현진</p>
					<p>디자인 : 김동우,권도일 | 게시판 제작자 : 이상현,정인호 | 맵 제공자 : 장요한 | 홈페이지 관리자 : 황현진</p>
					<p>COPYRIGHT ⓒ 2022 FOURFORPETMALL, ALL RIGHTS RESERVED.</p>
				</div>
				
			</div>
		</footer>
	</div>
</body>

<div class="modal"> 
	<div class="modal_body">
		<img src="/resources/cancel.png" class="btn-close" >
		<jsp:include page="/WEB-INF/views/user/login.jsp"/>
	</div>
</div> 

<script> 
	const modal = document.querySelector('.modal'); 
	const btnclose = document.querySelector('.btn-close'); 
	const btnOpenPopup = document.querySelector('.btn-open-popup'); 
	btnOpenPopup.addEventListener('click', function(){
		modal.style.display = 'block'; 
	}); 
	
	btnclose.addEventListener('click', function(){
		modal.style.display = 'none'; 
	}); 	
</script>

</html>
<script>
	//$("#pet_list").on("click",function(){
		//const modal = document.querySelector('.modal'); 
		//var uid=$(frm.uid).val();
		//if(uid==""){
		//	alert("로그인후 이용해주세요.");
		//}
	//});
</script>
