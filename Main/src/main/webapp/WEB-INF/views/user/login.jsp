<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#login td {
		padding : 10px;
	}
	
	#login .btn {
		width : 350px;
		padding : 15px;
		font-size: 15px;
		margin :0px auto;
		background : #343434;
		color:white;
	}
	
	#login input:focus { 
		outline:none;
	}
	
	#login input {
		border :none;
		border-bottom:1px solid #D0D0D0;
		font-size:16px;
		padding : 10px 10px 10px 0px;
		hint-color:black;
	}
	
	small {
		color : #C0C0C0;
	}
	
	.login_title {
		font-weight:50px;
		text-align:center;
		font-size:40px;
		margin:10px 0px 20px 0px;
	}
</style>
<form name="frm" id="login">
	<p class="login_title">로그인</p>
	<table style="margin:0px auto;">
		<tr>
			<td>
				<small class="titles">아이디</small><br>			
				<input type="text" id="login_uid" name="uid" placeholder="아이디" size=35>
			</td>
		</tr>
		<tr>
			<td>
				<small class="titles">비밀번호</small><br>			
				<input type="password" id="login_upass" name="upass" placeholder="비밀번호" size=35>
			</td>
		</tr>
		<tr style="padding:10px;">
			<td>
				<input type="checkbox"> 아이디 저장
				<a href="/user/find_id" style="float:right;">아이디/비밀번호 찾기</a>
			</td>
		</tr>
		<tr>
			<td>
				<button class="btn" id="btn_login">로그인</button>
			</td>
		</tr>
		<tr>
			<td>
				<a href="/user/join_sel" style="float:right;">회원가입</a>
			</td>
		</tr>

	</table>
</form>

<script>
	$("#btn_login").on("click", function(e){
		e.preventDefault();
		var uid=$("#login_uid").val();
		var upass=$("#login_upass").val();
		
		$.ajax({
			type: "post",
			url: "/user/login",
			data: {uid:uid, upass:upass},
			success: function(data){
				if(data==0) {
					alert("아이디가 존재하지 않습니다.");
				}else if(data==2){
					alert("비밀번호가 일치하지 않습니다.");
				}else {
					var dest="${dest}";
					if(dest==null || dest==""){
						location.href="/";
					}else{
						location.href=dest;
					}
				}
			}
		});
	});
</script>