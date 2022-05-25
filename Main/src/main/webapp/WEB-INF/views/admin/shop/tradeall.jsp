<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
   <h2> 유저 구매 내역 </h2>
   <table id="trade" style="margin-left: 200px;text-align:center;"></table>
   <script id="temp" type="text/x-handlebars-template">
	<tr>
		<td width=150>아이디 / 닉네임</td>
		<td width=200>상품이미지</td>
		<td width=200>상품이름</td>
		<td width=300>주소</td>
		<td width=100>날짜</td>
		<td width=100>가격</td>
	</tr>
   {{#each .}}
      <tr bno="{{bno}}">
		<td>{{uid}} / {{bnickname}}</td>
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
	getAllTrade();

	function getAllTrade() {
        $.ajax({
           type : "get",
           url : "/admin/alltrade.json",
           dataType : "json",
           success : function(data) {
              var template = Handlebars.compile($("#temp").html());
              $("#trade").html(template(data));
           }
        });
	}
</script>