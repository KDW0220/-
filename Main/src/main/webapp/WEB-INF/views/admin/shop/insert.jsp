<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div id="page">
   <h1>상품 등록</h1> 
   <form name="shfrm" method="post" enctype="multipart/form-data">
      <table>
         <tr>
            <td class="title" width=100>상품사진</td>
            <td width=700>
               <img id="image" name="image" src="https://via.placeholder.com//300x200" width=250/>
               <input type="file" id="file" name="file" accept="image/* "style=display:none;>
            </td>
         </tr>
         <tr>
            <td class="title" width=100>제목</td>
            <td width=600><input type="text" id="title" name="title" size=80></td>
         </tr>
         <tr>
               <td class="price" width=100>가격</td>
               <td width=300><input type="text" id="price" name="price" size=10></td>
            </tr>
      </table>
      <div style="text-align:center;margin-top:20px;">
         <input type="submit" value="상품 올리기">
         <input type="reset" value="등록취소" onClick="location.href='/admin/index'">
      </div>
   </form>
</div>

<script>
   $(shfrm).on("submit", function(e){
      e.preventDefault();
      var title=$("#title").val();
      var image=$("#file").val();
      var price=$("#price").val();
      
      if(image==""){
         alert("사진을 등록하세요!");
         return;
      }else if(title==""){
         alert("제목을 입력하세요!");
         $("#title").focus();
         return;
      }else if(price=="" || price.replace(/[0-9]/g,'')){
         alert("가격을 숫자로 입력하세요!");
         $("#price").focus();
         return;
      }
      
      if(!confirm("상품을 등록하실래요?")) return;
      shfrm.submit();
   });
   
   $("#image").on("click", function(){
      $("#file").click();
   });
   
   //이미지 미리보기
   $("#file").on("change", function(e){
      var file=$("#file")[0].files[0];
      $("#image").attr("src", URL.createObjectURL(file));
   });
</script>