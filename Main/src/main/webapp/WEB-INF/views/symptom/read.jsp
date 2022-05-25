<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="/resources/board.css" rel="stylesheet" >
<div style="text-align:center;position: relative; margin-bottom:70px;">
	<img src="/resources/dog_img/dictionary_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">All PET</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">반려동물의 정보들을 신속하게 알려드립니다</p>
		  </div>
		</div>
	</div> 
</div>

<div id="header_board">
	<a id="freeBoard" href="/pet/list">반려 지식백과</a>
	<a id="petStar" href="/symptom/list">증상 지식백과</a>
</div>
<header style="text-align:center;">
	<p class="small_title">증상 지식백과</p>
	<p class="big_title">반려동물들의 안전을 지켜주세요 </p>
</header>

<article id="board_readUser" style="width: 900px; margin:0px auto; text-align:left;">
	<a href="/board/list?page=${param.page}&keyword=${param.keyword}">목록이동</a>
	
	<div class="boardRead_nav">
		<div style="font-size:18px;">${vo.stitle}</div>
		<div>${vo.stype}</div>
	</div>
	
	<div class="boardRead_nav2">
		<div>작성자 : 포포펫</div>
	</div>
	<p class="board_userContent">${vo.scontent}</p>
	<div class="pagination"></div>
</article>
<script>
	$("#go").on("click", function(e) {
		e.preventDefault();
		frm.action = "/symptom/list";
		frm.submit();
	})
</script>