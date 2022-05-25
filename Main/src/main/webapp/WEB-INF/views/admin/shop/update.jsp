<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div id="page">
   <h1>상품 등록</h1> 
   <form name="shfrm" method="post" enctype="multipart/form-data">
      <table>
      	<tr>
            <td class="title" width=100>상품번호</td>
            <td width=600><input type="text" value="${vo.id}" readonly id="title" name="title" size=5></td>
         </tr>
         <tr>
            <td class="title" width=100>상품사진</td>
            <td width=700>
               <img id="image" src="/display?fileName=${vo.image}" width=250/>
               <input type="file" id="file" name="file" accept="image/* "style=display:none;>
               <input type="text" value="${vo.image}" name="image"/>
            </td>
         </tr>
         <tr>
            <td class="title" width=100>제목</td>
            <td width=600><input type="text" value="${vo.title}" id="title" name="title" size=80></td>
         </tr>
         <tr>
               <td class="price" width=100>가격</td>
               <td width=300><input type="text" value="${vo.price}" id="price" name="price" size=10></td>
            </tr>
      </table>
      <div style="text-align:center;margin-top:20px;">
         <input type="submit" value="상품 수정">
         <input type="reset" value="수정 취소">
      </div>
   </form>
</div>

<script>
   $(shfrm).on("submit", function(e){
      e.preventDefault();
      var title=$("#title").val();
      var price=$("#price").val();
      
      if(title==""){
         alert("제목을 입력하세요!");
         $("#title").focus();
         return;
      }else if(price==""){
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