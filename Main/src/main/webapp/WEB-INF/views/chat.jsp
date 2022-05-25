<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>채팅</title>
<link href="/resources/chat.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style>
	.sender.right {display:none;}
	.delete.left{display:none;}
</style>
</head>
<body>
	<div class="chat_wrap">
		<div class="header">채 팅 방 (${uid})</div>
		<div id="chat"></div>
		<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="{{display sender}}">
				<div class="sender {{display sender}}">
					<img src="/display?fileName={{image}}" style="width:50px;border-radius:50%">
					{{sender}}
				</div>
				<div class="message">{{message}}<a href="{{id}}" class="delete {{display sender}}">X</a></div>
				<div class="date">{{regdate}}</div>
			</div>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("display", function(sender){
			if(sender=="${uid}") {
				return "right";
			}else{
				return "left";
			}
		});
	</script>
		<div class="input-div">
			<textarea id="txtMessage" placeholder="내용을 입력하세요."></textarea>
		</div>
	</div>
</body>
<script>
	var uid = "${uid}";
	getChat();
	
	function getChat(){
		$.ajax({
			type: "get",
			url:"/chat/list.json",
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#chat").html(temp(data));
				window.scrollTo(0, $("#chat").prop("scrollHeight"));
			}
		})
	}
	
	$("#chat").on("click", ".message a", function(e){
		e.preventDefault();
		var id=$(this).attr("href");
		if(!confirm(id + " 를 삭제하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url:"/chat/delete",
			data: {id:id},
			success:function(){
				getChat();
				sock.send("delete");
			}
		});
	});
	
	//enter클릭
	$("#txtMessage").on("keydown", function(e) {
		if (e.keyCode == 13 && !e.shiftKey) {
			e.preventDefault();
			var message = $(this).val();
			if (message == "") {
				alert("내용을 입력하세요");
				return;
			}
			//채팅데이터 입력
			$.ajax({
				type:"post",
				url:"/chat/insert",
				data:{sender:uid, message:message},
				success:function(){
					sock.send("insert");
					$("#txtMessage").val("");
				}
			});
			
		}
	})

	//소켓설정
	var sock = new SockJS("http://localhost:8088/sock_chat");
	sock.onmessage = onMessage;

	//서버에서 메시지 받을때
	function onMessage(msg) {
		getChat();
	}

	
</script>
</html>