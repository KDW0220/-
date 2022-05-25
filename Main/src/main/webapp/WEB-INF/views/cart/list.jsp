<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
#row {
	width: 900px;
	overflow: hidden;
	margin: 0px auto;
	pointer:cursor;
}
.title,.price, .chk {
	border-right:1px solid #dedede;
	border-bottom:1px solid #dedede;
	text-align:center;
	padding:10px;
}

.title_buy {
	background:#dedede;
	padding:5px;
	text-align:center;
}

#cart {
	margin:0px auto;
}

.title_cart {
	font-size:30px;
	font-weight:bold;
	font-family: 'SBAggroL';
	margin:0px auto;
	margin-top:100px;
}

#buy {
	font-family: 'SBAggroL';
	background:#ed7753;
	border:none;
	padding:15px;
	color:white;
}

#delete {
	font-family: 'SBAggroL';
	background:#232323;
	border:none;
	padding:15px;
	color:white;
}
</style>

<div id="page">
	<p class="title_cart">장바구니</p>
	<table id="cart">
		<c:if test="${vo.id==null}">
			<tr>
				<td>상품이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
	<script id="temp" type="text/x-handlebars-template">
	<tr>
		<td class="title_buy"><input type="checkbox" id="chkAll"></td>
		 <td colspan=2 class="title_buy">상품 정보</td>
		 <td class="title_buy">금액</td>
    </tr>
   {{#each list}}
    <tr id="{{id}}">
		 <td class="chk"><input type="checkbox" class="chk"></td>
         <td><img src="/display?fileName={{image}}" width=70 class="image"></td>
         <td class="title row" width=500>{{title}}</td>
		 <td class="price">{{price}}</td>
    </tr>
   {{/each}}
	<tr>
		<td><h4 id="total" sum={{sum}}>총 결제 금액 : 	{{sum}},000원</h4></td>
	</tr>
   </script>
   <button id="delete">상품 삭제</button>
   <button id="buy" onclick="location.href='/cart/buy?uid=${uid}'">상품주문</button>
</div>

<script>
	var bid = "${uid}";

	var page = 1;
	getList();
	
	$("#cart").on("click","#chkAll",function(){
        var checked = $('#chkAll').is(':checked');
        if(checked){
        	$('input:checkbox').prop('checked',true);
        }else{
        	$('input:checkbox').prop('checked',false);	
        }
     });

	
	$("#cart").on("click", "#delete", function(){
		if(!confirm("선택한 항목을 삭제?")) return;
		$("#cart tr td .chk:checked").each(function(){
			
			var tr=$(this).parent().parent();
			var id=tr.attr ("id");
			
			$.ajax({
				type: "post",
				url: "/cart/delete",
				data:{id:id},
				success:function(){
					location.reload();
				}
			});
		});
		getList();
	});
	
	function getList() {
		$.ajax({
			type : "get",
			url : "/cart/list.json",
			data : {page : page, uid:bid},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#cart").html(template(data));
				$(".pagination").html(getPagination(data));
			}
		});
	}
	
	//row를 클릭한경우
	   $("#cart").on("click", ".row", function(){
	     var id=$(this).parent().attr("id");
	     location.href="read?id=" + id + "&page=" + page;
	   });

	$(".pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getList();
	});
	
</script>
