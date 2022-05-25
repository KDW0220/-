<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
	.modal2 
	{ 
		position: absolute; top: 0; left: 0; width: 100%; height: 100%; 
		display: none; background-color: rgba(0, 0, 0, 0.4); 
		z-index:10;
	} 
	
	.modal_body2 
	{ 
		position: absolute; top: 50%; left: 50%; width: 1000px; 
		height: 400px; text-align: center; background-color: 
		rgb(255, 255, 255); border-radius: 10px; box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 
		transform: translateX(-50%) translateY(-50%); 
		z-index:10;
		margin:0px auto;
		padding : 50px;
	}
	
	.btn-close2 {
		width:20px;
		height:20px;
		float : right;
		cursor:pointer;
	}
</style>



<button class="btn-open-popup2">열기</button>

<div class="modal2"> 
	<div class="modal_body2">
		<img src="/resources/cancel.png" class="btn-close2" >
	</div>
</div> 

<script> 
	const modal2 = document.querySelector('.modal2'); 
	const btnclose2 = document.querySelector('.btn-close2'); 
	const btnOpenPopup2 = document.querySelector('.btn-open-popup2'); 
	btnOpenPopup2.addEventListener('click', function(){
		modal2.style.display = 'block'; 
	}); 
	
	btnclose2.addEventListener('click', function(){
		modal2.style.display = 'none'; 
	}); 	
</script>