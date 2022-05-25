<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=980b9a0e64885c4caacd9999711bb01d&libraries=services"></script>
<div id="page">
	<h1 id="atitle"></h1>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<h3 id="aaddress"></h3>
	<h4 id="atel"></h4>
	<table id="tbl">
		<tr>
			<td></td>
		</tr>
	</table>
	
</div>

<script>
	var url = new URL(window.location.href);
	var urlParams = url.searchParams;	
	
	var atitle = urlParams.get('atitle');
	var aaddress = urlParams.get('aaddress');
	var atel = urlParams.get('atel');
	var x = urlParams.get('x');
	var y = urlParams.get('y');
	
	$("#atitle").html(atitle);
	$("#aaddress").html(aaddress);
	$("#atel").html(atel);

	//지도 생성
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(y, x),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);

	// 마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(y, x);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	//장소명 출력
	var info = new kakao.maps.InfoWindow({
		content : "<b>" + atitle + "</b>"
	});
	kakao.maps.event.addListener(marker, "mouseover", function() {
		info.open(map, marker);
	});
	kakao.maps.event.addListener(marker, "mouseout", function() {
		info.close(map, marker);
	});

	getList();

	function getList() {
		$.ajax({
			type : "get",
			url : "/hospital/list.json",
			dataType : "json",
			data : {
				query : query,
			},
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
			}
		});
	}
</script>