<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.subject {width:300px; color:gray;}
</style>
<div id="page">
	<h1>개사전</h1>
	<div style="border-bottom:1px dotted gray;padding-bottom:10px;">
		<input type="text" placeholder="검색어" id="keyword">
		<input type="button" value="검색" id="search">
	</div>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
         <tr class="row">
            <td width=50 class="code">{{id}}</td>
            <td width=150><img src="/display?fileName={{dimage}}" width=150></td>
            <td width=300><p class="subject ellipsis">{{dtitle}}</td>
			<td width=300>{{dcontent}}</td>
            <td width=100><button code="{{code}}" class="update">수정</td>
         </tr>
      {{/each}}
	</script>
	<script>
		Handlebars.registerHelper("display", function(price){
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		});
	</script>
</div>
<script>
	getList();
	
	
	//수정버튼을 클릭한 경우
	$("#tbl").on("click", ".row .update", function(){
		var code=$(this).attr("code");
		location.href="update?code="+code+"&page="+page+"&keyword="+keyword;
	});
	
	//검색어에서 엔터를 친경우
	$("#keyword").on("keypress", function(e){
		if(e.keyCode==13) $("#search").click();
	});
	
	//검색버튼을 클릭한 경우
	$("#search").on("click", function(){
		keyword = $("#keyword").val();
		page=1;
		getList();
	});
	
	//목록출력 함수
	function getList(){
		$.ajax({
			type:"get",
			url: "/dog/list.json",
			dataType: "json",
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
			}
		});
	}
</script>