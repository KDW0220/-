<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	#page article {
		padding:30px;
		display:flex;
		width:1200px;
		justify-content:center;
		margin:0px auto;
		border: 1px solid #aeaeae;
	}
	
	#dimage {
		width:500px; height:400px;
		padding:10px;
		border-right:1px solid #cecece;
	}
	
	.dicRead_content {
		width:600px;
		text-align:left;
		font-size:18px;
		font-family: 'SBAggroL';
	}
	
	.dicRead_content li {
		padding:10px;
	}
</style>
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
<div id="page"> 
	<p class="small_title">반려 지식백과</p>
	<p class="big_title">함께 살 반려동물들을 알아보세요 </p>
	<article>
		<div><img id="dimage" src="/display?fileName=${vo.dimage}"></div>
		<ul class="dicRead_content">
			<li><b>품  종</b> : ${vo.dtitle}</li>
			<li><b>특  징</b> : ${vo.dchar}</li>
			<li><b>수  명</b> : ${vo.dlife}</li>
			<li><b>히스토리</b><br>${vo.dcontent}</li>
		</ul>
	</article>
</div>
