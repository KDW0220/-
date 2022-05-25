<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=980b9a0e64885c4caacd9999711bb01d&libraries=services"></script>
<style>
	.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
	
	#map {
		width: 1300px; height: 800px;
		margin: 0px auto;
		border : 5px solid #F7E1E4;
	}
	
	#tbl_hospital {
		margin: 0px 10px;
		font-size:20px;
		font-family: 'SBAggroL';
	}
	
	#hos_search_box {
		border : 10px solid #FED8E0;
		display:inline-block;
		margin-top:-50px;
		margin-bottom: 50px;
		text-align:center;
		background:white;
	}
	
	#keyword {
		padding : 10px;
		border: none;
		font-size:40px;
		color:#aeaeae;
	}
	
	#keyword:focus {
		outline:none;
	}
	
	#hsearch{
		width:100px;
		height:100px;
		cursor:pointer;
	}
	
	#page {
		text-align:center;
	}
	
	.btnMap{
		border:1px solid #aeaeae;
		background:white;
		padding:10px;
		border-radius:10px;
		color:#aeaeae;
	}
	
	.hos_box{
		display:flex; justify-content: center; 
		align-items:center;
	}
	
	#banner_top{
		margin-left:200px;
	}
</style>
<div id="page">
	<div style="text-align:center;position: relative;">
	<img src="/resources/hos_banner.png" style="height:500px; width:100%;">
	<div class="body_banner" style=""> 
		<div class="heading">
		  <div style="text-align:center;">
		    <p id="banner_top" class="slide-up">Hospital</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">반려동물들을 신속하고 정확하게 진단해줄 병원들을 알려드립니다. </p>
		  </div>
		</div>
	</div>
	<div id="hos_search_box">
		<input type="text" id="keyword">
		<input type="text" style="display:none;">
		<img src="/resources/search.png" id="hsearch">		
	</div> 
</div>
<div id="map"></div>
	<hr/>
	<div class="hos_box">
		<img src="/resources/hospital_detail.png">
		<table id="tbl_hospital"></table>
	</div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
			<tr class="row">
				<td width=250 class="atitle">{{atitle}}</td>
				<td width=300 class="aaddress">{{aaddress}}</td>
				<td width=200 class="atel">{{atel}}</td>
				<td><button onClick="location.href='info?ano={{ano}}&atitle={{atitle}}&aaddress={{aaddress}}&atel={{atel}}&x={{x}}&y={{y}}'" class="btnMap" id="btnMap" x="{{x}}" y="{{y}}">자세히</button></td>
			</tr>
		{{/each}}
	</script>
	<div class="pagination"></div>
</div>

<script>
var page = 1;
var keyword = "인천";
var arrx=[];
var arry=[];
var placeName=[];
var i=0;
getList();

$("#hsearch").on("click", function(){
	keyword=$("#keyword").val();
	getList();
});

$("#keyword").on("keypress", function(e){
	if(e.keyCode==13) $("#hsearch").click();
});

function getList() {
	$.ajax({
		type : "get",
		url : "/hospital/list.json",
		dataType : "json",
		data : {
			keyword : keyword,
			page : page
		},
		success : function(data) {
			var template = Handlebars.compile($("#temp").html());
			$("#tbl_hospital").html(template(data));
			$(".pagination").html(getPagination(data));
			$(data.list).each(function(){
				arrx[i]=this.x;
				arry[i]=this.y;
				placeName[i]=this.atitle;
				i++;
			});
			i=0;
			ps.keywordSearch(keyword, placesSearchCB);
		}
	});
}

$(".pagination").on("click", "a", function(e) {
	e.preventDefault();
	page = $(this).attr("href");
	getList();
});



//---------------------------------------------------------------------------------
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch(keyword, placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<arrx.length; i++) {
        	displayMarker(arry[i],arrx[i],placeName[i]);
            bounds.extend(new kakao.maps.LatLng(arry[i], arrx[i]));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }
    
// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
  function makeOverListener(map, marker, infowindow) {
      return function() {
          infowindow.open(map, marker);
      };
  }

  // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
  function makeOutListener(infowindow) {
      return function() {
          infowindow.close();
      };
  }
  
  function closeOverlay() {
	    overlay.setMap(null);     
	}
  
  //지도에 마커를 표시하는 함수
  function displayMarker(y,x,place) {
	  
	  var marker = new kakao.maps.Marker({
  		  map: map,
          position: new kakao.maps.LatLng(y, x) 
      });  
  	
  	 // 마커에 표시할 인포윈도우를 생성합니다 
      var infowindow = new kakao.maps.InfoWindow({
          content: '<div class="wrap">' + 
          '    <div class="info">' + 
          '        <div class="title">' + 
          						place + 
          '        </div>' + 
          '        <div class="body">' + 
          '            <div class="desc">' + 
          '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
          '            </div>' + 
          '        </div>' + 
          '    </div>' +    
          '</div>'
          // 인포윈도우에 표시할 내용
      });

      // 이벤트 리스너로는 클로저를 만들어 등록합니다 
      // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
      kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
      kakao.maps.event.addListener(marker, 'click');
      kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
  }
}

</script>

