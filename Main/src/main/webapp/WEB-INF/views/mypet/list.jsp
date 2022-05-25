<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>
#mypet {
   width: 900px;
   margin: 0px auto;
   overflow: hidden;
}

#pet_box {
   width: 280px;
   height:350px;
   margin: 10px;
   float: left;
   border: 1px solid #cecece;
   cursor: pointer;
   border-radius:10px;
   font-family: 'SBAggroL';
}

.title {
   width: 150px;
}

.mpreply {
	margin-bottom:-7px;
	border:none;
	resize:none;
}

.row {
	padding:15px;
}

.modal2 
{ 
	position: absolute; top: 0; left: 0; width: 100%; height:2100px; 
	display: none; background-color: rgba(0, 0, 0, 0.4); 
	z-index:20;
} 

.modal_body2
{ 
	position: absolute; top: 50%; left: 50%; width: 1100px; 
	height: 600px; text-align: center; background-color: rgb(255, 255, 255); border-radius: 10px; 
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 
	transform: translateX(-50%) translateY(-50%); 
	margin:0px auto;
	float:left;
	overflow:hidden;
}

.btn-close2 {
   width: 20px;
   height: 20px;
   float: right;
   cursor: pointer;
   margin:30px;
   z-index:20;
}

.petBox_content {
	padding : 10px;
	display:flex;
	flex-direction: column;
}

.petStargram_box {
	display:flex;
	margin-right:-50px;
}

.petStargram_content {
	width:400px;
	height:600px;
	padding:20px;
	text-align:left;
}

.reply_insertBox {
	padding-top:10px;
	height:100px;
}

#mp_writer {
	font-weight:bold;
	margin-left:5px;	
}

#mp_regdate {
	margin-left:45px;	
}

#likeImg, #chat {
	cursor:pointer;
	margin-right:15px;
}

#mpreply {
	border:none;
}

#insert {
	border:none;
	background:none;
	color:#3156f7;
}

.main_content {
	border-bottom:1px solid #dedede;
	height:450px;
	overflow-y: scroll;
}

.main_content::-webkit-scrollbar {
	display:none;
}
</style>
<body>
	<div style="text-align:center;position: relative; margin-bottom:70px;">
		<img src="/resources/board_banner.png" style="height:500px; width:100%;">
		<div class="body_banner"> 
			<div class="heading">
			  <div>
			    <p id="banner_top" class="slide-up">게시판</p>
			  </div>
			  <div class="notosanskr">
			    <p id="banner_bottom" class="slide-up">다양한 이야기들을 적어 함께 공유해주세요</p>
			  </div>
			</div>
		</div> 
	</div>
	<div id="page" style="text-align:center;">
	   <div id="header_board">
			<a href="/board/list">자유게시판</a>
			<a href="/mypet/list">펫스타그램</a>
		</div>
	   	<p class="small_title">펫스타그램</p>
		<p class="big_title">반려동물들을 마음껏 자랑해주세요</p>
	   </div>
	
	   <table id="mypet"></table>
	   <script id="temp" type="text/x-handlebars-template">
		{{#each list}}
      	<div id="pet_box" class="btn-open-popup2">   
         	<p class="mpno" style=display:none;>{{mpno}}</p>
			<p class="uimage" style=display:none;>{{uimage}}</p>
			<p class="likeImg" style=display:none;>{{likeImg}}</p>
         	<p class="mpimage" style=display:none;>{{mpimage}}</p>      
         	<img src="/display?fileName={{mpimage}}" style="width:280px; height:250px;" >
         	<div class="petBox_content">
				<div><b class="mpwriter">{{mpwriter}}</b>&nbsp;&nbsp;<span class="mptitle">{{mptitle}}</span></div>
				<div style="display:flex;">좋아요 <p class="mpcount" id="mpnum">{{mpcount}}</p>개</div>				
         		<p class="mpregdate">{{mpregdate}}</p>
		 	</div>
      	</div>
   		{{/each}}
   	   </script>
	   <div>
	      <input type="submit" id="submit" value="사진 올리기">
	   </div>
	   <div class="pagination"></div>
	<script src="/resources/pagination.js"></script>
	<button class="btn-open-popup2" style="display:none;">열기</button>
</body>
<div class="modal2">
   <div class="modal_body2">
      <img src="/resources/cancel.png" class="btn-close2">
      <div class="petStargram_box">
		<img id="mypet_image" style="width:600px;">
		<div class="petStargram_content">
			<p id="mp_no" style="display:none;"></p>
			<div class="main_content">
				<img id="mypet_uimage" style="border-radius:50%; width:32px; height:32px;">
				<span id="mp_writer"></span>
				<span id="mp_title"></span>
				<p id="mp_regdate">
				<hr>
				<div id="mpreplies"></div>
			</div>
			<div class="reply_insertBox">
				<label>좋아요<span id="mp_count"></span>개</label>
				<div style="display:flex; padding:10px 0px;">
					<img id="likeImg" onClick="like();" width=25>
					<img id="chat" src="/resources/chat.png" onClick="chat();" style="width:22px; height:22px;">
				</div>
				<input type="text" id="mpreply" placeholder="댓글달기" size=40>
				<button id="insert">게시</button>
			</div>
		</div>
      </div>
      <hr/>
	<script id="temp_reply" type="text/x-handlebars-template">
	{{#each mprlist}}
		<div class="row" mprno="{{mprno}}">
			<img src="/display?fileName={{uimage}}" style="border-radius:50%; width:32px; height:32px;">
			<b><span>{{mpreplyer}}</span></b>
			<input type="text" class="mpreply" {{read mpreplyer}} value="{{mpreply}}" size=25>
			<span style="display:{{display mpreplyer}}; text-align:right;">
				<a class="delete">삭제</a>
			</span>
			<p>{{mpreplydate}}</p>
		</div>
	{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("display", function(mpreplyer){
			if(mpreplyer!="${unickname}"){
				var btn=$("#mypet_upadte_btn");
				btn.css({
					"display" : "none"
				});
				return "none";
			}
		});
		
		Handlebars.registerHelper("read", function(mpreplyer){
			if(mpreplyer!="${unickname}"){
				var btn=$("#mypet_upadte_btn");
				btn.css({
					"display" : "none"
				});
				return "readonly";
			}
		});
	</script>
	<div class="mppagination"></div>
   </div>
</div>
<script>
   var searchType = '';
   var searchform = $("#searchForm");
   var page = "${param.page==null ? 1: param.page}";
   var keyword = "${param.keyword==null ? '': param.keyword}";
   var count = 0;
   var likeImg;
   getList();
   
   
   function chat() {
	   $("#mpreply").focus();
   }

   function like() {
	   var num=$("#mp_count").html();
	   likeImg = $('#likeImg').attr("src");
	   if(likeImg=="/resources/like_push.png"){
		   likeImg="/resources/like.png";
		   $("#likeImg").attr("src", likeImg);
		   count=-1;
		   num = parseInt(num) - 1;
		   $("#mp_count").html(num);
		   like_count(count);   
	   }else if(likeImg=="/resources/like.png"){
		   likeImg="/resources/like_push.png";
		   $("#likeImg").attr("src", likeImg);
		   count=1;
		   num = parseInt(num) + 1;
		   $("#mp_count").html(num);
		   like_count(count);
	   }
   }
   
   function like_count(mpcount) {
	   var mpno = $("#mp_no").html();
	   $.ajax({
	         type : "post",
	         url : "/mypet/like",
	         data : {
	            mpcount:mpcount,
	            mpno:mpno,
	            likeImg:likeImg
	         },
	         success : function(data) {
	         	alert("성공");
	         }
	      });
   }

   function getList() {
      keyword = $("#keyword").val();
      searchType = searchform.find("option:selected").val();
      $.ajax({
         type : "get",
         url : "/mypet/list.json",
         data : {
            page : page,
            keyword : keyword,
            searchType : searchType
         },
         dataType : "json",
         success : function(data) {
            var template = Handlebars.compile($("#temp").html());
            $("#mypet").html(template(data));

            //페이지목록 출력
            $(".pagination").html(getPagination(data));
         }
      });
   }

   //인서트로 ㄱ
   $("#submit").on("click", function() {
      location.href = "insert";
   });

   $("#mypet").on("click","#pet_box",function() {
	  var mpno = $(this).find(".mpno").html();
	  var likeImg = $(this).find(".likeImg").html();
	  var uimage = $(this).find(".uimage").html();
      var mpimage = $(this).find(".mpimage").html();
      var mptitle = $(this).find(".mptitle").html();
      var mpwriter = $(this).find(".mpwriter").html();
      var mpregdate = $(this).find(".mpregdate").html();
      var mpcount = $(this).find(".mpcount").html();
      
      $("#likeImg").attr("src", likeImg);
      $("#mypet_image").attr("src", "/display?fileName="+mpimage);
      $("#mypet_uimage").attr("src", "/display?fileName="+uimage);
      $("#mp_no").html(mpno);
      $("#mp_title").html(mptitle);
      $("#mp_writer").html(mpwriter);
      $("#mp_regdate").html(mpregdate);
      $("#mp_count").html(mpcount);
      
      modal2.style.display = 'block';
      getMyPetList();
   });
   //검색버튼을 클릭한 경우
   $("#search").on("click", function() {
      page = 1;
      getList();
   });

   //검색어상자에서 엔터를 친경우
   $("#keyword").on("keypress", function(e) {
      if (e.keyCode == 13)
         $("#search").click();
   });

   //페이지 번호를 클릭한 경우
   $(".pagination").on("click", "a", function(e) {
      e.preventDefault();
      page = $(this).attr("href");
      getList();
   });
	
	$("#mpdelete").on("click", function(){
		var mpno="${param.mpno}";
		if(!confirm(mpno + "을(를) 삭제하실래요?"))
			return;
		location.href = "delete?mpno=" + mpno;
	});
	
	//댓글 삭제
	$("#mpreplies").on("click", ".delete", function() {
		var row = $(this).parent().parent();
		var mprno = row.attr("mprno");
		if(!confirm("댓글을 삭제하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/mpreply/delete",
			data: {mprno:mprno},
			success: function(){
				getMyPetList();
			}
		});
	});

	//댓글 등록
	$("#insert").on("click", function() {
		var mpno=$("#mp_no").html();
		var mpreplyer = "${unickname}";
		var mpreply = $("#mpreply").val();
		var uimage="${image}";
		if (mpreply == "") {
			alert("댓글을 입력하세요!");
			$("#mpreply").focus();
			return;
		}
		if (!confirm("댓글을 등록하실래요?"+mpno+mpreplyer+ mpreply))
			return;
		$.ajax({
			type : "post",
			url : "/mpreply/insert",
			data : {
				mpno : mpno,
				mpreplyer : mpreplyer,
				mpreply : mpreply,
				uimage : uimage,
			},
			success : function() {
				getMyPetList();
				$("#mpreply").val("");
			}
		});
	});

	function getMyPetList() {
		var mpno=$("#mp_no").html();
		$.ajax({
			type : "get",
			url : "/mpreply/list.json",
			dataType : "json",
			data : {
				page : page,
				mpno : mpno
			},
			success : function(data) {
				var template = Handlebars.compile($("#temp_reply").html());
				$("#mpreplies").html(template(data));
			}
		});
	}


	$("#delete").on("click", function() {
		var mpno = "${param.mpno}";
		if (!confirm(mpno + "를(을) 삭제?"))
			return;
		location.href = "delete?mpno=" + mpno;
	});
</script>
<script>
   const
   modal2 = document.querySelector('.modal2');
   const
   btnclose2 = document.querySelector('.btn-close2');
   const
   btnOpenPopup2 = document.querySelector('.btn-open-popup2');
   btnOpenPopup2.addEventListener('click', function() {
      modal2.style.display = 'block';
   });

   btnclose2.addEventListener('click', function() {
      modal2.style.display = 'none';
   });
</script>
