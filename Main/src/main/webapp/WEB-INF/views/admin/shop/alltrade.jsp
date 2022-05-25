<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/resources/main.css" rel="stylesheet" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <script src="/resources/pagination.js"></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<div>
   <h2> 구매 내역 </h2>
   <table id="trade"></table>
   <script id="temp" type="text/x-handlebars-template">
   <tr>
      <td>구매자</td>
      <td>상품이미지</td>
      <td>상품이름</td>
      <td>주소</td>
      <td>날짜</td>
      <td>가격</td>
   </tr>
   {{#each .}}
      <tr bno="{{bno}}">
       <td>{{uid}}</td>
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
   getTrade();
   
   
   function getTrade(){
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