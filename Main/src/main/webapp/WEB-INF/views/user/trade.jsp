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
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
	<img src="/resources/join_img/join_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">마이페이지</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">새로운 인연,포포펫에서 함께 만들어 가겠습니다</p>
		  </div>
		</div>
	</div>
</div>
  <div id="header_board">
     <a href="/user/update?uid=${vo.uid}">개인정보수정</a>
     <a href="/user/trade?uid=${vo.uid}">구매내역</a>
  </div>
<div>
   <h2> 구매 내역 </h2>
   <table id="trade"></table>
   <script id="temp" type="text/x-handlebars-template">
   {{#each .}}
      <tr bno="{{bno}}">
         <td><img src="/display?fileName={{bimage}}" width=150 class="image"></td>
         <td>{{btitle}}</td>
       <td>{{baddress}}</td>
       <td>{{bdate}}</td>
       <td>{{bsum}} 원</td>
      </tr>
   {{/each}}
   </script>
</div>

<script>
   var uid="${param.uid}";
   var manager="${manager}";
   getTrade();
   
   
   function getTrade(){
      var manager="${vo.manager}";
      if(manager < 1) {
         $.ajax({
            type : "get",
            url : "/user/trade.json",
            data : {uid:uid},
            dataType : "json",
            success : function(data) {
               var template = Handlebars.compile($("#temp").html());
               $("#trade").html(template(data));
            }
         });
         
      }else {
         $.ajax({
            type : "get",
            url : "/user/alltrade.json",
            dataType : "json",
            success : function(data) {
               var template = Handlebars.compile($("#temp").html());
               $("#trade").html(template(data));
            }
         });
      }
   }
</script>