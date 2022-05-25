<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="/resources/css/passupdate.css" rel="stylesheet" >
<div id="page">
<div class="container">
   <h1>비밀번호재설정</h1>
   <form name="frm12" method="post" action="passUpdate" enctype="multipart/form-data">
      <table style="display: inline-block;">
         <tr>
            <td class="title" width=100>아이디</td>
            <td width=500>
               <input type="text" name="uid" class="uinput" value="${vo.uid}" readonly>
            </td>
         </tr>
         <tr>
            <td class="title" width=100>비밀번호</td>
            <td width=500>
               <input type="password" name="upass" id="upass">
            </td>
         </tr>
            <tr>
            <td class="title" width=100>비밀번호확인</td>
            <td width=500>
               <input type="password" name="upasscheck" id="upasscheck">
            </td>
            <td><span id="passcheck"></span></td>
         </tr>
      </table>
      <div style="text-align:center;margin-top:10px;"class="update-button">
         <button type="submit">재발급</button>
         <button type="reset">정보리셋</button>
      </div>
   </form>
   </div>
</div>


<script>
    var passcheck=false;
    var options = {
          min:7, max:14,
           special: true, // 특수문자 포함여부 (true일경우 반드시 포함하여야 함)
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
    
   $("#upasscheck").on("blur", function(){
       var upass=$(frm12.upass).val();
       var upasscheck = $(frm12.upasscheck).val();
       
       if(upass!=upasscheck){
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
   
   $(frm12).on("submit",function(e){
      e.preventDefault();
      
      var uid=$(frm12.uid).val();
      var upass=$(frm12.upass).val();
      var upasscheck = $(frm12.upasscheck).val();
      if(passcheck=false){
         alert("비밀번호가 일치하지 않습니다.");
         return;
      }
      
      alert(uid+"\n"+upass);
      
   
         if(!confirm("비밀번호를 재설정하시겟습니까?")) return;
         
         frm12.submit();
      });
</script>