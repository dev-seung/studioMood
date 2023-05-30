<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js">
	
</script>
<!-- 네이버지도 -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=yxll4v2mv5&submodules=geocoder"></script>

<style>
.about {
	margin: 0 auto;
	width: 80%;
	height: 700px;
}

.map {
	marin-top: 20px;
}

.aboutContent {
	margin: 0 auto;
	width: 100%;
	height: 150px;
	font-family: 'S-CoreDream-5Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.mapBtn {
	position: relative;
}

.aboutContentTitle {
	width: 100%;
	height: 100px;
	text-align: center;
}

#title {
	font-size: 50px;
	font-weight: bolder;
}

.studioContent {
	width: 100%;
	height: 200px;
}

.studioInfo {
	padding-top: 50px;
	width: calc(99.5%/ 3);
	height: 100%;
	float: left;
	text-align: center;
}

.infoContent {
	margin-left: 30px;
	font-size: 32px;
	font-weight: bolder;
}

.infoContentExtra {
	margin-left: 30px;
	font-size: 18px;
	font-weight: bold;
}

.studioContentBottom {
	width: 100%;
	height: 190px;
}

.studioImg {
	width: 40%;
	height: 100%;
	float: left;
}

.studioIntroduce {
	width: 60%;
	height: 100%;
	float: left;
}

.btnWrap {
	margin: 0 auto;
	width: 5%;
	height: 50px;
}

input[type="checkbox"] {
	vertical-align: center;
	margin: 0 auto;
	position: absolute;
	visibility: hidden;
}

label {
	cursor: pointer;
	vertical-align: center;
	margin: 0 auto;
	display: block;
	position: absolute;
	width: 60px;
	height: 34px;
	border-radius: 17px;
	background-color: #ddd;
	transition-duration: 0.2s;
}

label span {
	position: absolute;
	left: 3px;
	top: 3px;
	z-index: 1;
	width: 28px;
	height: 28px;
	border-radius: 50%;
	background-color: #fff;
	transition-duration: 0.2s;
}

label:before, label:after {
	position: absolute;
	top: 0;
	width: 34px;
	font-size: 11px;
	line-height: 34px;
	color: #fff;
	text-align: center;
}

label:before {
	left: 0;
	content: 'ON';
}

label:after {
	right: 0;
	content: 'MAP';
}

input:checked+label {
	background-color: #00c73c;
}

input:checked+label span {
	/* left: 29px; */
	transform: translateX(26px);
}

.iw_inner {
	margin: 20px 20px;
	text-align: center;
	font-family: 'S-CoreDream-5Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/* .underLine{
	width : 60px;
	margin-left : 0px;
	size : 2;

} */
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div id="map" class="map"
		style="width: 100%; min-width: 500px; height: 700px; position: absolute; display: none;"></div>
	<div class="about">

		<div class="aboutContent">
			<div class="aboutContentTitle">
				<br> <span id="title">STUDIO Mood:</span>
			</div>
			<div class="studioContent">
				<div class="studioInfo">
					<span class="infoContent">PHONE :</span><br> <span
						class="infoContentExtra">010-3345-6908</span>
				</div>
				<div class="studioInfo">
					<span class="infoContent">MAIL :</span><br> <span
						class="infoContentExtra">sonhs19996@naver.com</span>
				</div>
				<div class="studioInfo">
					<span class="infoContent">OPEN :</span><br> <span
						class="infoContentExtra"> 평일 9:30 ~ 18:20</span><br> <span
						class="infoContentExtra"> 주말 및 공휴일 제외</span>
				</div>
			</div>
			<div class="studioContentBottom">
				<div class="studioImg">
					<img src="/img/studioIntroduce.jpg"
						style="width: 90%; height: 90%; margin-left: 5%;">
				</div>
				<div class="studioIntroduce">
					<h4>Introduce</h4>
					<hr class="underLine" color="black" width="50px"
						style="margin-left: 0px;">
					<span>소중한 인생의 순간을 포착하기 위해 우리의 전문 사진작가들이 여러분을 도와드립니다.<br>
						스튜디오무드는 오랜시간 각 분야에서 다양한 경험을 하면서 좀더 전문적이고<br> 창의적인 사진을 위해 노력해
						왔습니다.<br> 기술적인 사진보다 사진속에 생명을 불어넣는 작업에 힘을 쓰고 노력하겠습니다.
					</span>
				</div>
			</div>
			<div class="studioContentBottom">
				<div class="studioIntroduce" style="padding-left : 3%">
					<h4>Service</h4>
					<hr class="underLine" color="black" width="50px"
						style="margin-left: 0px;">
					<span>작가와 함께 다양한 표정을 찍고 고릅니다.<br> 충분한 촬영을 통해 나에게 맞는 이미지를 찾으세요. <br>

						촬영은 마음에 들때까지 재촬영합니다. </span>
				</div>
				<div class="studioImg">
					<img src="/img/studioIntroduce2.jpg"
						style="width: 70%; height: 90%; margin-left: 15%;">
				</div>
			</div>


		</div>


	</div>

	<br>
	<div class="btnWrap">
		<input type="checkbox" id="checkbox"> <label for="checkbox"><span></span></label>
	</div>




	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>


<script>
	window.onload = function() {
		$("#checkbox").click(function() {
			$(".map").fadeToggle();
		});

		var map = new naver.maps.Map("map", {
			center : new naver.maps.LatLng(37.533807, 126.896772),
			zoom : 17,
			zoomControl : true,
			zoomControlOptions : {
				position : naver.maps.Position.TOP_LEFT,
				style : naver.maps.ZoomControlStyle.SMALL
			}
		});
		//Marker
		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(37.533807, 126.896772),
			map : map
		});
		//지도에 클릭이벤트 추가
		naver.maps.Event.addListener(map, "click", function(e) {
			narker.setPosition(e.coord);
			if (infoWindow != null) {
				if (infoWindow.getMap()) {
					infoWindow.close();
				}
			}
			naver.maps.Service.reverseGeocode({
				location : new naver.maps.LatLng(e.coord.lat(), e.coord.lng())
			}, function(status, response) {
				if (status != naver.maps.Service.Status.OK) {
					return alert("잘못된 주소 입니다.");
				}
				var result = response.result;
				var items = result.items;
				var address = items[1].address; //0번이 지번, 1번이 도로명
				contentString = [ '<div class="iw_inner">',
						'<p>' + address + '</p>', '</div>' ].join('');

			});
		});
		var contentString = [ '<div class="iw_inner">', '<h3>KH정보교육원</h3>',
				'<p>서울시 영등포구 선유2로 57 이례빌딩 19F, 20F</p>', '</div>'

		].join('');
		var infoWindow = new naver.maps.InfoWindow();
		naver.maps.Event.addListener(marker, 'click', function(e) {
			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {

				infoWindow = new naver.maps.InfoWindow({
					content : contentString
				});
				infoWindow.open(map, marker);
			}
		});

	}
</script>

</html>