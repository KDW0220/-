<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="/resources/join.css" rel="stylesheet" >

<style>
 .join_title {
   font-size:40px;
   font-weight:50px;
   margin:auto;
   text-align:center;
   margin : 100px 0px 10px 0px;
}

#join .title {
	display:inline-block;
	width:975px;
   	font-size:30px;
   	color:#4A4A4A;
   	right:40%;
   	margin-left : -570px;
}

#idcheck, #nick_check, #email_check, #passcheck {
   font-size:13px;
   right:10%;
   color:red;
}

#join_move_top {
	font-size:50px;
	color:#211f21;
	font-family: 'SBAggroL';
	margin-left:150px;
}

#join_move_bottom {
	font-size:25px;
	color:#211f21;
	font-family: 'SBAggroL';
}

</style>
<div style="text-align:center;position: relative;">
	<img src="/resources/join_img/join_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="join_move_top" class="slide-up">회원가입</p>
		  </div>
		  <div class="notosanskr">
		    <p id="join_move_bottom" class="slide-up">새로운 인연,포포펫에서 함께 만들어 가겠습니다</p>
		  </div>
		</div>
	</div> 
</div>
<form name="join" id="join" method="post" action="insert" enctype="multipart/form-data">
   <p class="join_title"><span style="font-size:18px;">회원가입</span><br>CREATE ACCOUNT</p>
   <div style="text-align:center;">
   		<p class=title>회원정보 입력<span style="color:red; font-size: 13px; margin: 0px 0px 0xp 5px;"> (필수)</span>
    	<span style="color:#939393; font-size: 13px;">사항을 꼭 입력해주시길 바랍니다.</span></p>
   </div>
   <table id="tbl">
      <tr>
         <td colspan=2 style="text-align:center;">
            <input type="file" name="file" id="file" style="display:none;">
            <img src="/resources/user.png" name="uimage" id="uimage" style="border-radius:100px; width:150px; height:150px; cursor:pointer;">
         </td>
      </tr>
      <tr>
         <td>
            <span class="titles">아이디</span>
            <span class="notice">(필수)</span><br>
            <input type="text" placeholder="아이디" id="uid" size=37 name="uid" required>
            <button type="button" id="btn_idCheck" class="btn">중복확인</button>
            <span id="idcheck"></span>
         </td>
         <td>
            <span class="titles">이름</span>
            <span class="notice">(필수)</span><br>
            <input type="text" placeholder="이름" id="uname" name="uname" size=50 required>
         </td>
      </tr>
      <tr>
         <td>
            <span class="titles">비밀번호</span>
            <span class="notice">(필수)</span><br>
            <input type="password" placeholder="비밀번호" id="upass" name="upass" size=50 required>
         </td>
         <td>
            <span class="titles">비밀번호 확인</span><br>
            <input type="password" placeholder="비밀번호 확인" id="upass_check" size=50><br>
            <span id="passcheck"></span>
         </td>
      </tr>
      <tr>
         <td>
            <span class="titles">닉네임</span>
            <span class="notice">(필수)</span><br>
            <input type="text" placeholder="닉네임" id="unickname" name="unickname" size=37 required>
            <button type="button" id="btn_nickCheck" class="btn">중복확인</button>
            <span id="nick_check"></span>
         </td>
         <td>
            <span class="titles">이메일</span>
            <span class="notice">(필수)</span><br>
            <input type="email" placeholder="이메일" id="uemail" size=36 name="uemail" required>
            <button type="button" id="btn_emailCheck" class="btn">중복확인</button><br>
            <span id="email_check"></span>
         </td>
      </tr>
      <tr>
         <td width=500>
            <span class="titles">주소</span>
            <span class="notice">(필수)</span><br>
            <input type="text" name="zipcode" size=5 id="zipcode" readonly>
            <button type="button" id="btn_search" class="btn">주소검색</button><br>
            <input type="text" name="uaddress1" size=30 id="uaddress1" required><label> /</label>
            <input type="text" name="uaddress2" size=10 id="uaddress2" placeholder="상세주소"><br>
         </td>
         <td>
            <span class="titles">전화번호</span>
            <span class="notice">(필수)</span><br>
            <input type="tel" id="tel" name="uphone" size="50" maxlength=13 required>
         </td>
      </tr>
      <tr>
         <td>
            <span class="titles">반려동물 종류</span><br>
            <input type="text" placeholder="견종 / 묘종 / 파충류" id="upet" name="upet" size=50>
         </td>
         <td>
            <span class="titles">반려동물 이름</span><br>
            <input type="text" placeholder="반려동물 이름" class="pet_name" size=50>
         </td>
      </tr>
      <tr>
         <td>
            <span class="titles">성별</span><br>
            <input type="radio" class="gender_check" name="ugender" value="남성"><label>남성</label>
            <input type="radio" class="gender_check" name="ugender" value="여성"><label>여성</label>
         </td>
         <td>
            <span class="titles">생년월일</span><br>
            <input type="date" class="birth" size="50" id="ubirth" name="ubirth">
         </td>
      </tr>
   </table>
   <div class="footer">
      <input class="btn" id="btnjoin" type="submit" value="회원가입">
   </div>
</form>

<script type="text/javascript">
$('#tel').keydown(
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

$("#tel").blur(
function(event){
	return telValidator($("#tel").val());
});

function telValidator(args) {
    var msg = '유효하지 않는 전화번호입니다.';
    // IE 브라우저에서는 당연히 var msg로 변경
    
    if (/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(args)) {
        return true;
    }
    alert(msg);
    return false;
}

function emailValidator(args) {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(args)) {
    	$("#email_check").html("");
        return true;
    }else {
	    $("#email_check").html("유효하지 않은 이메일입니다.");
	    return false;
    }
}

function passwordValidator(args, opt) {
    // v1.0
    var obj = opt || {   // options의 기본 값들입니다. 
        min: 7, max: 14, conseq: 5, special: true,
        msg: '숫자와 영문자,특수문자 조합으로 9~16자리를 사용해야 합니다.',
    }

    var specialChar = opt.special ? '(?=.*[!@#$%^*+=-])' : '';
    var rules = new RegExp("^(?=.*[a-zA-Z])"+specialChar+
    "(?=.*[0-9]).{" + obj.min + "," + obj.max + "}$");
    if (!rules.test(args)) {
        console.log(opt.msg);
        return false;
    }
    return true;
}
</script>



<script>
	var idcheck=false;
	var passcheck=false;
	var nickcheck=false;
	var emailcheck=false;
	
	var options = {
		min:7, max:14,
	    special: true, // 특수문자 포함여부 (true일경우 반드시 포함하여야 함)
	}
	
	$("#upass_check").on("blur", function(){
	    var upass =$("#upass").val();
	    var upass_check =$("#upass_check").val();
	    
	    if(upass!=upass_check){
	       $("#passcheck").html("비밀번호가 일치하지 않습니다.");
	       return;
	    }else if(upass.length<7||upass.length>15){
	    	$("#passcheck").html("비밀번호는 7자 이상 14자 이하로 입력해주세요.");
	    	return
	    }else if(passwordValidator(upass,options)==false) {
	    	$("#passcheck").html("숫자와 영문자,특수문자 조합으로 입력해야 합니다");
	    	return;
	    }
	    else {
	       $("#passcheck").html("");
	      passcheck=true;
	    }
	});
	//주소 검색후 값 적용
	$("#btn_search").on("click", function(){
	   new daum.Postcode({
	      oncomplete: function(data){
	         $("#uaddress1").val(data.address);
	         $("#zipcode").val(data.zonecode);
	         $("#uaddress1").focus();
	      }
	   }).open();   
	});
	
	 $("#file").on("change",function(e){
	   var file=$("#file")[0].files[0];
	   $("#uimage").attr("src", URL.createObjectURL(file));
	});
	   
	$("#uimage").on("click",function(){
	   $("#file").click();
	});
	
	$("#btn_idCheck").on("click",function(){
	   var uid=$("#uid").val();
	   if(uid==""){
	      $("#idcheck").html("아이디를 입력하세요.");
	      $("#uid").focus();
	      return;
	   }
	   $.ajax({
	      type: "post",
	      url: "/user/idcheck",
	      data: {uid:uid},
	      success:function(data){
	         if(data==0){
	            $("#idcheck").html("사용가능한 아이디입니다.");
	            idcheck=true;
	         }else {
	            $("#idcheck").html("중복된 아이디입니다.");
	            idcheck=false;
	            return;
	         }
	      }
	   });
	});
	
	$("#btn_nickCheck").on("click",function(){
	   var unickname=$("#unickname").val();
	   if(unickname==""){
	      $("#nick_check").html("닉네임을 입력하세요.");
	      $("#unickname").focus();
	      return;
	   }
	   $.ajax({
	      type: "post",
	      url: "/user/nickcheck",
	      data: {unickname:unickname},
	      success:function(data){
	         if(data==0){
	            $("#nick_check").html("사용가능한 닉네임입니다.");
	            nickcheck=true;
	         }else {
	            $("#nick_check").html("중복된 닉네임입니다.");
	            nickcheck=false;
	            return;
	         }
	      }
	   });
	});
	
	$("#btn_emailCheck").on("click",function(){
	   var uemail=$("#uemail").val();
	   if(uemail==""){
	      $("#email_check").html("이메일을 입력하세요.");
	      $("#uemail").focus();
	      return;
	   }
	   $.ajax({
	      type: "post",
	      url: "/user/mailcheck",
	      data: {uemail:uemail},
	      success:function(data){
	         if(data==0){
        	 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(uemail)) {
        	    	$("#email_check").html("사용가능한 이메일입니다.");
		            emailcheck=true;
        	    }else {
        		    $("#email_check").html("유효하지 않은 이메일입니다.");
        		    return;
        	    }
	         }else {
	            $("#email_check").html("중복된 이메일입니다.");
	            return;
	         }
	      }
	   });
	});
	
	$("#btn_idCheck").on("blur",function(){
	   if(idcheck==true){
	      $("#idcheck").html("");
	   }
	});
	
	$("#btn_nickCheck").on("blur",function(){
	   if(nickcheck==true){
	      $("#nick_check").html("");
	   }
	});
	
	$("#btn_emailCheck").on("blur",function(){
	   if(emailcheck==true){
	      $("#email_check").html("");
	   }
	});
	
	$(join).on("submit", function(e){
	     e.preventDefault();
	     var form = document.join;
	      if (idcheck ==true&&nickcheck==true&&emailcheck==true){
	         if(idcheck=false){
	            alert("아이디 중복체크를 완료해주세요.");
	            return;
	         }else if(nickcheck=false){
	            alert("닉네임 중복체크를 완료해주세요.");
	            return;
	         }else if(emailcheck=false){
	            alert("이메일 중복체크를 완료해주세요.");
	            return;
	         }else if(passcheck=false){
	            alert("비밀번호가 일치하지 않습니다.");
	            return;
	         }
	         else{
	          if(!confirm("회원을 등록하실래요?")) return;
	          form.submit();
	       }
	      }  
	   });
</script>