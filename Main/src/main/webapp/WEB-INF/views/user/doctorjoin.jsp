<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/doctorlogin.css" rel="stylesheet" >

<div id="page">
	<div id="box">
		<h1>병원회원가입</h1>
		<form name="frm" method="get">
			<table>
				<tr>
					<td width=200 style="font-weight: bold;">휴대폰</td>
					<td width=320 class="input-box">
						<input name="tel" type="text" class="tel" maxlength="13" placeholder="핸드폰번호"></td>
						
					<td style="font-weight: bold;" width=200>병원명</td>
					<td width=320 style="display: flex; margin-right: 10px;" class="input-box">
						<input style="margin-left:10px;" id="hname" name="hname" type="text" class="hospital" placeholder="병원명"></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">아이디</td>
					
					<td style="display: flex;" class="input-box">
					<input type="text" id = "did" name="did" style="width:200px;" placeholder="아이디" autocomplete="username" required oninput = "checkId()" /> 
						<button id="btnCheck">중복체크</button>
					<td style="font-weight: bold;">대표연락처</td>
					<td><input type="text" class="htel" maxlength="13"  placeholder="대표연락처"></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">비밀번호</td>
					<td><input type="password" class="pass" id="pass1" placeholder="비밀번호"></td>
					<td style="font-weight: bold; height:150px;">비밀번호확인</td>
					<td><input type="password" class="passchk" id="pass2"
						placeholder="비밀번호확인">
						<div class="alert alert-success" style="color:blue" id="alert-success">비밀번호가 일치합니다.</div> 
						<div class="alert alert-danger"style="color:red" id="alert-danger">비밀번호가 일치하지 않습니다.</div></td>

				</tr>
				<tr>
					<td style="font-weight: bold;">이름</td>
					<td><input type="text" class="name" placeholder="이름"></td>
					<td style="font-weight: bold;">이메일</td>
					<td><input type="text" class="email" placeholder="이메일"></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">주소</td>
					<td>
						<div class="form-group">
							<input class="form-control" style="width: 55%; display: inline;"
								placeholder="우편번호" name="addr1" id="addr1" type="text"
								readonly="readonly">
							<button type="button" id="btnaddress" class="btn btn-default"
								onclick="execPostCode();">
								<i class="fa fa-search"></i> 검색
							</button>
						</div>
						<div class="form-group">
							<input class="form-control" style="top: 5px;"
								placeholder="도로명 주소" name="addr2" id="addr2" type="text"
								readonly="readonly" />
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="상세주소" name="addr3"
								id="addr3" type="text" />
						</div>

					</td>
					<td style="font-weight: bold;">이미지</td>
					<td><input type="file" name="file" style="display: none;">
						<div id="imgbox">
							<img id="image"style="float: left; "
							src="/resources/person.png" id="image" width=150>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<div id="btns">
			<button id="reset">취소</button>
			<button id="insert">회원가입</button>
			
		</div>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//전화번호 자동 - 
	$('.tel')
			.keydown(
					function(event) {
						var key = event.charCode || event.keyCode || 0;
						$text = $(this);
						if (key !== 8 && key !== 9) {
							if ($text.val().length === 3) {
								$text.val($text.val() + '-');
							}
							if ($text.val().length === 8) {
								$text.val($text.val() + '-');
							}
						}

						return (key == 8 || key == 9 || key == 46
								|| (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
					});
	$('.htel')
	.keydown(
			function(event) {
				var key = event.charCode || event.keyCode || 0;
				$text = $(this);
				if (key !== 8 && key !== 9) {
					if ($text.val().length === 3) {
						$text.val($text.val() + '-');
					}
					if ($text.val().length === 8) {
						$text.val($text.val() + '-');
					}
				}

				return (key == 8 || key == 9 || key == 46
						|| (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
			});
</script>
<script>
//이미지클릭시에
	$(frm.file).on("change", function(e) {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	$("#image").on("click", function() {
		$(frm.file).click();
	});
</script>
<script>
//주소검색
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

//아이디 중복체크
$(document).ready(function (){   
	   $("#btnCheck").on("click", function(event) {
	   var params = $("form").serialize(); // 자동으로 폼태그 안에있는애들 주르륵
	   
	   		$.ajax({
	   			url:"ex01_idcheck.jsp" //MVC패턴이라면 .do가 될 것  (C->H-> S->D)
	   			,dataType:"json"
	   			,type:"get"
	   			//,data:"empno="+$("#empno").val(); //id값이 주어졌다면 이렇게 해도되나 지저분
	   			,data:params //바로 이렇게 줘도 됨 
	   			,cache:false //같은 요청이 있으면 db에 있는 것 바로 뿌리겠다
	   			,success:function(data){ //성공했으면 가져오는 데이터가 있을 것
	   				//alert(data.count); //data는 JSON 값을 받을 것 {"count":0} data.count하면 0아니면 1
	   				if(data.count==1){ //사용중
	   					$("#notice").css("color","red").text("이미 사용 중인 empno(ID)입니다.");
	   				}else{//사용가능
	   					$("#notice").css("color","blue").text("사용 가능한 empno(ID)입니다.");
	   				}
	   			}
	   		});//ajax
	   });//click
   });//ready

   
	//비밀번호 값 비교
	$(function(){ 
		$("#alert-success").hide(); 
		$("#alert-danger").hide(); 
		$("input").keyup(function(){ 
			var pass1=$("#pass1").val(); 
			var pass2=$("#pass2").val(); 
			if(pass1 != "" || pass2 != ""){ 
				if(pass1 == pass2){ 
					$("#alert-success").show();
					$("#alert-danger").hide(); 
					$("#submit").removeAttr("disabled"); 
				}else{ 
					$("#alert-success").hide();
					$("#alert-danger").show(); 
					$("#submit").attr("disabled", "disabled"); 
					} 
				} 
			}); 
		});

</script>