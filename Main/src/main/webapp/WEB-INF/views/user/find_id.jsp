<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>
	#banner_top {
		margin-left:120px;
	}

   .modal3 {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 1600px;
      display: none;
      background-color: rgba(0, 0, 0, 0.4);
      z-index: 10;
   }
   
   .modal_body3 {
      position: absolute;
      top: 50%;
      left: 50%;
      width: 800px;
      height: 300px;
      text-align: center;
      background-color: rgb(255, 255, 255);
      border-radius: 10px;
      box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
      transform: translateX(-50%) translateY(-20%);
      z-index: 10;
      margin: 0px auto;
      padding: 40px;
   }
   
   .btn-close3 {
      width: 20px;
      height: 20px;
      float: right;
      cursor: pointer;
   }
   .searchSelect_box {
   	  font-size:20px;
   	  font-family: 'SBAggroL';
   }
   
   #searchId {
   	  border:1px solid #aeaeae;
   	  width:600px;
   	  padding:40px;
   	  margin:0px auto;
   }
   
   #searchId input {
   	  border:none;
   	  border-bottom:1px solid #aeaeae;
   	  font-size:17px;
   }
   
   #searchBtn {
   	  border:none;
   	  background:#232323;
   	  color:white;
   	  width:400px;
   	  font-size:18px;
   	  padding : 20px;
   }
   
   .form-group label {
   	  transform: translateX(-160px);
   }
</style>
<div style="text-align:center;position: relative;">
	<img src="/resources/join_img/join_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">ID/PW 찾기</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">새로운 인연,포포펫에서 함께 만들어 가겠습니다</p>
		  </div>
		</div>
	</div> 
</div>
<div class="full">
   <div class="container">
         <p class="small_title">아이디/비밀번호 찾기</p>	
		 <p class="big_title">ID/PW 찾기</p>
         <div class="searchSelect_box">
            <input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
            <label style="margin-right:50px;">아이디&nbsp;찾기</label>
            <input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> 
            <label>비밀번호 찾기</label>
         </div>
         
         <div id="searchId">
         	<h1>아이디 찾기</h1>
            <div class="form-group">
               	<label>가입 이메일</label>
               <div>
                  <input type="text" id="uemail" name="uemail" placeholder="ex) E-mail@gmail.com" size=40>
               </div>
               <span id="email_check"></span>
            </div>
            <div class="form-group">
               <button id="searchBtn" type="button" onClick="findId();">아이디찾기</button>
            </div>
         </div>
         
         <div id="searchPass" style="display: none;">
            <div class="form-group">
               <label >아이디</label>
               <div>
                  <input type="text" id="userid" name="userid" placeholder="ex) red">
               </div>
            </div>
            <div class="form-group">
               <label>이메일</label>
               <div>
                  <input type="email" id="uemail2" name="uemail2" placeholder="ex) E-mail@gmail.com">
               </div>
            </div>
            <div class="form-group">
               <button id="searchBtn2" type="button">확인</button>
               <button onclick="location.href='/'">취소</button>
            </div>
         </div>
   </div>
</div>
<button class="btn-open-popup3" style="display:none;">열기</button>
<div class="modal3">
   <div class="modal_body3">
   <img src="/resources/cancel.png" class="btn-close3">
      <h1>회원님의 ID는</h1>
      <div style="font-size:30px;" id="find_id"></div>
      <h1>입니다.</h1>
            
</div>
</div>
<script>
   function search_check(num) {
      if (num == '1') {
         document.getElementById("searchPass").style.display = "none";
         document.getElementById("searchId").style.display = "";   
      } else {
         document.getElementById("searchId").style.display = "none";
         document.getElementById("searchPass").style.display = "";
      }
   }
   
   function findId() {
      var uemail=$("#uemail").val();
         if(uemail==""){
         alert("E-MAIL을 입력하세요!")
          $("#uemail_check").html();
          $("#uemail").focus();
          return;
         }
      $.ajax({
         type: "post",
         url: "/user/idsearch",
         data: {uemail:uemail},
         success:function(data){
            if(data==""){
               alert("이메일 없음");
               return;
            }else {
               $("#find_id").html(data);
               modal3.style.display = 'block';
            }
         }
      });
   }
   //검색어상자에서 엔터를 친경우
   $("#uemail").on("keypress", function(e) {
      if (e.keyCode == 13)
      $("#searchBtn").click();
   });

</script>
<script>
   $("#searchBtn2").on("click", function() {
      var userid=$("#userid").val();
      var uemail2=$("#uemail2").val();
      $.ajax({
         type: "post",
         url: "/user/newpass",
         data: {uid:userid, uemail:uemail2},
         success: function(data){
            if(userid==""){
               alert("ID를 입력해주세요!");
               $("#userid").focus();
            }else if(uemail2==""){
               alert("E-MAIL을 입력해주세요!");
               $("#uemail2").focus();
            }else{
               if(data==1){
                  alert("해당 아이디의 가입 정보가 없습니다.");
               }else if(data==2){
                  alert("해당 이메일의 가입 정보가 없습니다.");
               }else{
                  location.href="/user/newpass?uid=" + userid;
               }               
            }            
         }
      });
   });
</script>
<script>
   const
   modal3 = document.querySelector('.modal3');
   const
   btnclose3 = document.querySelector('.btn-close3');
   const
   btnOpenPopup3 = document.querySelector('.btn-open-popup3');
   btnOpenPopup3.addEventListener('click', function() {
      modal3.style.display = 'block';
   });

   btnclose3.addEventListener('click', function() {
      modal3.style.display = 'none';
   });
</script>