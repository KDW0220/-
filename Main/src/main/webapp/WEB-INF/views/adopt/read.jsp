<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
	.adoptPet {
		font-family: 'SBAggroL';
		background:#eeeeee;
		width:600px;
		margin:0px auto;
		padding:10px;
		font-size:30px;
		margin-top:100px;
		margin-bottom:50px;
	}
	
	.adoptPet h1 {
		margin:30px;
	}
	
	.adoptPet p {
		padding:10px;
	}
	
	.kakao_btn:hover {
		cursor:pointer;
	}
	
	.goList {
		font-family: 'SBAggroL';
		background:#f77c54;
		padding:20px;
		color : white;
	}
	
	.goList:hover{
		text-decoration:none;
		color: white;
	}
	
	.time_box {
		border:2px solid #232323; width:600px; padding:30px; font-size:20px;
		font-family: 'SBAggroL';
		margin: 0px auto;
	}
	
	.time_box p {
		font-size:30px;
	}
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
	<img src="/resources/adopt_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">입양 & 분양</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">포포펫의 반려동물들의 분양 목록을 알려드립니다</p>
		  </div>
		</div>
	</div> 
</div>
<div id="page">
	<p class="small_title">분양중인 아이들</p>
	<p class="big_title">포포펫의 아이들을 소개해드립니다 </p>
	<img src="/display?fileName=${vo.image}" width=500>
	<div class="adoptPet">
		<h1><b>${vo.kinds} ${vo.title}</b></h1>
		<p><b>이름: </b>${vo.title}</p>
		<p><b>품종: </b>${vo.kinds}</p>
		<p><b>중성화여부: </b>${vo.neutering}</p>
		<p><b>성별 / 나이: </b> ${vo.gender} / ${vo.age}살</p>
	</div>
	<div class="time_box">
		<p><b>포포펫 학익점	<span style="color:#0f8047;">1004-1234</span></b></p>
		(AM 10:00 - PM 10:00 연중무휴)
	</div>
	<p style=" color:#ff9d7d; font-size:60px; font-weight:bold; margin-top: 100px;">SINCE 2022</p>
	<p style="font-size:20px; font-weight:600; margin:50px;">학익동에 자리잡은 포포펫은<br>신뢰와 믿음으로 여러분들과 함께합니다</p>
	<div style="width:120px; border-bottom:5px solid #ff9d7d; margin:0px auto; margin-top: 100px;"></div>
	<img src="/resources/rule.png" style="margin-top:50px;">
	<p style="font-size:50px; margin-top:300px;"><b>365일 연중무휴</b><br>언제, 어디서나</p>
	<div style="width:100px; border-bottom:1px solid black; margin:0px auto; margin-top: 50px;"></div>
	<img src="/resources/adopt_phone.jpg" style="margin-top:50px;"><br>
	<img src="/resources/kakao.png" class="kakao_btn" onClick="kakao()" style="margin:50px; border-radius:20px;"><br>
	<a class="goList" href="/adopt/list">목록으로</a>
</div>
<script src="/resources/pagination.js"></script>

<script>
	function kakao() {
		window.open("https://open.kakao.com/o/sAsBQxge");
	}

	$("#delete").on("click", function(){
		var ano = "${param.ano}";
		if(!confirm(ano+"를(을) 삭제?")) return;
		location.href="delete?ano=" + ano;
	});
</script>
