<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

</style>

<div id="page">
   <table id="cart"></table>
   <script id="temp" type="text/x-handlebars-template">
	<tr>
		 <td colspan=2 class="title_buy">상품 정보</td>
		 <td class="title_buy">금액</td>
    </tr>
   {{#each list}}
    <tr id="{{id}}">
         <td><img src="/display?fileName={{image}}" width=70 class="image"></td>
         <td class="title row" width=500>{{title}}</td>
		 <td class="price">{{price}}</td>
    </tr>
   {{/each}}
	<tr>
		<td><h4 id="total" sum={{sum}}>총 결제 금액 : 	{{sum}},000원</h4></td>
	</tr>
   </script>
   <button id="buy" onclick="requestPay()">상품주문</button>
   <br>
   <h2>배송지 입력</h2>
   <form name="frm2" action="" method="post">
      <table>
         <tr>
            <td width=500>
                  <span class="titles">주소</span>
                  <input type="text" name="zipcode" size=5 id="zipcode" readonly>
                  <button type="button" id="btn_search" class="btn">주소검색</button><br>
                  <input type="text" name="uaddress1" size=30 id="uaddress1" value="${vo.uaddress1}" required><label> /</label>
                  <input type="text" name="uaddress2" size=10 id="uaddress2" value="${vo.uaddress2}" placeholder="상세주소"><br>
               </td>
         </tr>
      </table>
   </form>
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
//       $("#cart").on("click", ".row", function(){
//         var id=$(this).parent().attr("id");
//         location.href="read?id=" + id + "&page=" + page;
//       });

   $(".pagination").on("click", "a", function(e) {
      e.preventDefault();
      page = $(this).attr("href");
      getList();
   });
   
</script>
<script>
   var bno = '${bno}';
   var uid = '${uid}';
   var bsum ='${vo.sum}' + '000';
   var bname = '${vo.uname}';
   var bnickname='${vo.unickname}';
   var bemail='${vo.uemail}';
   var bphone = '${vo.uphone}';
   var baddress =$("#uaddress1").val() + " " + $("#uaddress2").val();
   var btitle = '${vo.title}';
   var bprice = '${vo.price}';
   var bimage = '${vo.image}';
   var blink = '${vo.link}';
   
   //카카오결제API
   var IMP = window.IMP; // 생략 가능
      IMP.init("imp85774140"); // 예: imp00000000

   function requestPay() {
         alert(bno + bimage + blink + bsum);
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
         pg : "kakaopay",
         pay_method : "card",
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : btitle,
         nickname : bnickname,
         amount : bsum,
         buyer_email : bemail,
         buyer_name : bname,
         buyer_tel : bphone,
         buyer_addr : baddress,
      }, function(rsp) { // callback
         if (rsp.success) { //결제성공
            $.ajax({
                  type : "post",
                  url : "/buy/insert",
                  data : {bno:bno, uid:uid, bsum:bsum, bemail:bemail, btitle:btitle, bnickname:bnickname, bname:bname,
                     baddress:baddress, bphone:bphone, bimage:bimage, blink:blink},
                  success : function() {
                	  $.ajax({
          				type: "post",
          				url: "/cart/deleteCart",
          				data:{uid:uid},
          				success:function(){
          					alert("구매성공!");
          				}
          			});
                 location.href = "/";
                  }
            });
         } else { //결제실패
            var msg = '결제에 실패하였습니다.';
             msg += '에러내용 : ' + rsp.error_msg;
             
             alert(msg);
         }
      });
   }
   
   //주소 검색후 값 적용
   $("#btn_search").on("click", function(){
      new daum.Postcode({
         oncomplete: function(data){
            $("#uaddress1").val(data.address);
            $("#zipcode").val(data.zonecode);
            $("#uaddress1").focus();
         }
      }).open();   
   });
</script>