<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<style>
	.name {width:150px; font-size:15; color:white;}
	
	.slick-img {
		margin : 0px auto;
		height:500px;
		z-index:-1;
	}
	
	#slider-div {
		width:100%;
		height:500px;
		z-index:1;
	}
	
	#slider-div:hover {
		cursor:pointer;
	}
</style>
<!-- stlye 은 slick 영역 확인용 -->
<div>
   <div id="slider-div"></div>
   <script id="temp" type="text/x-handlebars-template">
   			{{#each .}}
   				<div>
					<img src="/resources/{{image}}" class="slick-img">
				</div>
   			{{/each}}
   </script>
</div>

<script>
    $.ajax({
    	type:"get",
    	url:"/slick/list.json",
    	dataType:"json",
    	success:function(data){
    		//destroy();
    		var template = Handlebars.compile($("#temp").html());
    		$("#slider-div").html(template(data));	
    		apply();
    	}
    });
    
    function destroy() {
	    if ($('#slider-div').hasClass('slick-initialized')) {
	        $('#slider-div').slick('unslick');
	    }
	}
    
    function apply() {
        $('#slider-div').slick({
            slide : 'div',  //슬라이드 되어야 할 태그 ex) div, li 
            infinite : true,  //무한 반복 옵션
            slidesToShow :1,  // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll : 1,  //스크롤 한번에 움직일 컨텐츠 개수
            speed : 500,  // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows : true,  // 옆으로 이동하는 화살표 표시 여부
            dots : false,  // 스크롤바 아래 점으로 페이지네이션 여부
            autoplay : true,  // 자동 스크롤 사용 여부
            autoplaySpeed : 5000,  // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover : true,  // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
            vertical : false,  // 세로 방향 슬라이드 옵션
            prevArrow : "<button type='button' class='slick-prev' style='background:black'>Previous</button>",  // 이전 화살표 모양 설정
            nextArrow : "<button type='button' class='slick-next' style='background:black'>Next</button>",  // 다음 화살표 모양 설정
            dotsClass : "slick-dots",  //아래 나오는 페이지네이션(점) css class 지정
            draggable : true,  //드래그 가능 여부 
            fade: true, //부드럽게 넘어가기 기능
            cssEase: 'linear',

            // 반응형 웹구현 옵션
            responsive : [
                {
                    breakpoint : 960,  //화면 사이즈 960px
                    settings : { slidesToShow : 3 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                },
                {
                    breakpoint : 768,  //화면 사이즈 768px
                    settings : { slidesToShow : 2 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                }
            ]
        });
    }
</script>