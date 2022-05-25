<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="/resources/join.css" rel="stylesheet" >
<style>
.title {
	font-size:30px;
	margin : 10px 10px 10px 470px;
	color:#4A4A4A;
}

.owner{
	width: 150px; height : 150px; border-radius:50px; border: 4px solid #A0A0A0;
	margin:40px;
}

.select_box {
	margin: 0px auto;
	width:400px; 
	height: 600px;
	border:5px solid #C0C0C0;
	text-align:center;
	padding: 60px 0px 20px 0px;
	font-size:15px;
	color:#707070;
	float : left;
	margin : 20px;
	
}

input[type=button] {
	border:1px solid #343434;
	border-radius:20px;
	background:#343434;
	color:white;
	width: 200px;	
	font-weight:bold;
}

input[type=button]:hover {
	background:white;
	color:#343434;
	transition: background-color .5s;
	cursor: pointer;
}
	
.join_title {
	font-size:40px;
	font-weight:50px;
	margin:auto;
	text-align:center;
	margin : 100px 0px 10px 0px;
}

#join .title {
	width:975.5px;
	font-size:30px;
	color:#4A4A4A;
	margin-left: 470px;
}

</style>



<form name="frm" id="join">
	<p class="join_title"><span style="font-size:18px;">회원가입</span><br>CREATE ACCOUNT</p>
 	<div style="display:flex; justify-content:center;">
 		<div class="select_box">
	 		<b><p style="font-size:30px; color:#343434; font-weight:800px;">펫오너</p></b>
	 		<p> 진료비와 질병 데이터베이스 </p>
	 		<p>조회 및 무료나눔 혜택을 위해 </p>
	 		<p>지금 바로 가입하세요. </p>
	 		<img src="/resources/join_img/owner.png" class="owner"><br>
	 		<input type="button" value="펫오너로 가입" onClick="location.href='/user/join'">
	 	</div>
	</div>
</form>

<script>
	//주소 검색후 값 적용
	$("#btn_search").on("click", function(){
		new daum.Postcode({
			oncomplete: function(data){
				console.log(data);
				$(frm.uaddress2).val(data.address);
				$(frm.uaddress1).val(data.zonecode);
				$(frm.address1).focus();
			}
		}).open();	
	});
	
	$(frm.file).on("change",function(e){
	      var file=$(frm.file)[0].files[0];
	      $("#uimage").attr("src", URL.createObjectURL(file));
	   });
	   
	   $("#uimage").on("click",function(){
	      $(frm.file).click();
	   });
</script>