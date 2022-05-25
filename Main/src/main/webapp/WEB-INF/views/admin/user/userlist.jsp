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
   <h2> 유저 리스트 </h2>
   <table id="tbl_user" style="margin-left: 200px;text-align:center;"></table>
   <script id="temp" type="text/x-handlebars-template">
   <tr>
      <td width=200>프로필사진</td>
      <td width=100>아이디</td>
      <td width=150>이름 / 닉네임</td>
      <td width=150>이메일</td>
      <td width=300>주소</td>
   </tr>
   {{#each .}}
      <tr class="row_user">
         <td><img src="/display?fileName={{bimage}}" width=150 class="image"></td>
       <td class="uid">{{uid}}</td>
       <td>{{uname}} / {{unickname}}</td>
         <td>{{uemail}}</td>
         <td>{{uaddress1}} _ {{uaddress2}}</td>
       <td>{{display status}}</td>
       <td><button class="updateButton" uid="{{uid}}" status="{{status}}">상태변경</button></td>
      </tr>
   {{/each}}
   </script>
</div>
<script>
      Handlebars.registerHelper("display", function(status){
         if(status == 1) {
            return "미사용";
         }else if(status == 0) {
            return "사용 중";
         }
      });
   </script>


<script>
   getUser();

   function getUser() {
        $.ajax({
           type : "get",
           url : "/admin/userlist.json",
           dataType : "json",
           success : function(data) {
              var template = Handlebars.compile($("#temp").html());
              $("#tbl_user").html(template(data));
           }
        });
   }
   
   $("#tbl_user").on(
         "click",
         ".updateButton",
         function() {
            var status = $(this).attr('status');
            var uid = $(this).attr('uid');
            if(status == 1) {
               status = 0;
            }else {
               status = 1;
            }
            alert(status + "_" + uid);
            $.ajax({
               type: "post",
               url: "/admin/statusUpdate",
               data: {uid:uid, status:status},
               success: function(){
                  getUser();
               }
            });
         });
   
</script>