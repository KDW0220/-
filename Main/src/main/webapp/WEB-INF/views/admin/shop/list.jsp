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
<div id="page">
	<h1>상품 목록</h1>
	<div id="shop"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each shoplist}}
      		<tr class="box" id="{{id}}">
				<td width=200><img src="/display?fileName={{image}}" style=width:200px;></td>
				<td width=400><p>{{title}}</p></td>
				<td width=100><p>{{display price}}</p></td>
				<td width=100><button class="delete">삭제</td>
				<td width=100><button onClick="location.href='update?id={{id}}'">수정</td>
			</tr>
   		{{/each}}		
	</script>
	<script>
		Handlebars.registerHelper("display", function(price){
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		});
	</script>
	<div class="pagination"></div>
</div>

<script>	
	var page=1;
	getList();
	
	function getList(){
		$.ajax({
			type: "get",
			url: "/admin/list.json",
			data: {page: page},
			dataType: "json",
			success : function(data) {
	            var template = Handlebars.compile($("#temp").html());
	            $("#shop").html(template(data));
	            $(".pagination").html(getPagination(data));
			}
		});
	}
	
	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
	
	$("#shop").on("click", ".delete", function(){
		var box = $(this).parent().parent();
		var id = box.attr("id");
		alert(id);
		if(!confirm("상품을 삭제하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/admin/delete",
			data: {id:id},
			success: function(){
				getList();
			}
		});
	});
</script>
