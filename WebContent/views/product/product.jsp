<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@600&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Serif+KR:wght@300;700&display=swap" rel="stylesheet">
</head>
<style>
	@import url('https://fonts.googleapis.com/css?family=Open+Sans');




.text-center {
	text-align: center;
	
	
}
.text-center-div{
font-family: 'Sansita Swashed', cursive;
}

.pricing-box-container {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
}

.pricing-box {
	background-color: #ffffff;
	box-shadow: 0px 2px 15px 0px rgba(0,0,0,0.5);
	border-radius: 4px;
	flex: 1;
	padding: 0 30px 30px;
	margin: 2%;
	min-width: 250px;
	max-width: 350px;
}

.pricing-box h5 {
	text-transform: uppercase;
}

.price {
	margin: 24px 0;
	font-size: 36px;
	font-weight: 900;
}

.price sub, .price sup {
	font-size: 16px;
	font-weight: 100;
}

.features-list {
	padding: 0;
	list-style-type: none;
}

.features-list li {
	font-weight: 100;
	padding: 12px 0;
	font-weight: 100;
}

.features-list li:not(:last-of-type) {
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

.btn-primary {
	border-radius: 25px;
	border: none;
	background-color: #EC1362;
	color: #ffffff;
	cursor: pointer;
	padding: 10px 15px;
	margin-top: 20px;
	text-transform: uppercase;
	transition: all 0.1s ease-in-out;
}

.btn-primary:hover {
	box-shadow: 0px 2px 15px 0px rgba(0,0,0,0.5);
	transform: translateY(-3px);
}

.pricing-box-bg-image {
	background-image: url('');
	background-size: cover;
	background-position: center center;
	color: #ffffff;
}

.pricing-box-bg-image .features-list li {
	border-bottom-color: rgba(255, 255, 255, 1);
}

.pricing-box-bg-image .btn-primary {
	background-color: #ffffff;
	color: #000;
}


.explain-product{
	width:72%;
	height:auto;
	
}
.explain-product h2{
	font-family: 'Noto Serif KR', serif;
	font-weight:bolder;
}
.explain-product h4{
	font-family: 'Nanum Myeongjo', serif;
}

.explain-content{
	width:80vw;
	height:auto;
	padding-top:100px;
	padding-bottom:100px;
	margin-top:100px;
	margin-bottom:100px;
	margin:0 auto;
	
}


.pricing-box{
	-webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
  
}
.opacity-div p,h5{
	opacity:0;
}
.opacity-div ul{
	opacity:0;
}
#indiv{
padding:0px;
background-image: url('/img/indivisual.jpg');
	background-size: cover;
   background-position: center center;
}
#group{
padding:0px;
background-image: url('/img/GROUP_PICTURE.jpg');
	background-size: cover;
   background-position: center center;
}
#body{
padding:0px;
background-image: url('/img/BODY_PROFILE.png');
	background-size: cover;
   background-position: center center;
}
.pricing-box:hover h5{
	opacity:1;
	font-weight:bolder;
}
.pricing-box:hover p{
	opacity:1;
}
.pricing-box:hover ul{
	opacity:1;
}
.opacity-div{
	padding:20px;
	width:100%;
	height:337px;
	color: black;
}
#indiv:hover .opacity-div{
	background-color: rgba(169,169,169,0.7); 
}
#group:hover .opacity-div{
	background-color: rgba(169,169,169,0.7);
}
#body:hover .opacity-div{
	background-color: rgba(169,169,169,0.7); 
}
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="explain-content">
	<div class="text-center-div">
	<h1 class="text-center">Various concepts</h1>
	</div>
<div class="pricing-box-container">
	<div id="indiv" class="pricing-box text-center">
   <div class="opacity-div">
      <h5>개인프로필</h5>
      <p class="price"><sup>₩</sup>5,000<sub>/건</sub></p>
      <ul class="features-list">
         <li>최소 <strong>1</strong> 시간</li>
         <li>시안 <strong>1회</strong> 수정</li>
         <li><strong>A</strong> Photographer</li>
         <li><strong>Studio Mood:</strong> Exclusive</li>
      </ul>
      </div>
   </div>

   <div id="group" class="pricing-box text-center">
   <div class="opacity-div">
      <h5>단체프로필</h5>
      <p class="price"><sup>₩</sup>15,000<sub>/건</sub></p>
      <ul class="features-list">
         <li>최소 <strong>2</strong> 시간</li>
         <li>시안 <strong>3회</strong> 수정</li>
         <li><strong>B</strong> Photographer</li>
         <li><strong>Studio Mood:</strong> Exclusive</li>
      </ul>
      </div>
   </div>

   <div id="body" class="pricing-box text-center">
   <div class="opacity-div">
      <h5>바디프로필</h5>
      <p class="price"><sup>₩</sup>10,000<sub>/건</sub></p>
      <ul class="features-list">
         <li>최소 <strong>1</strong> 시간</li>
         <li>시안 <strong>2회</strong> 수정</li>
         <li><strong>C</strong> Photographer</li>
         <li><strong>Studio AAVEC</strong> Exclusive</li>
      </ul>
      
   </div>
   </div>
   <div class="explain-product">
   <br><br>
      <h2>메이크업과 헤어서비스</h2><hr>
      <h4>여자분은 기본 풀 메이크업 피부화장, 눈썹, 아이라인, 마스카라등은 하고 오셔야 촬영에 맞게 눈썹정리와 입술색 정도 수정을 해드립니다.</h4>
      <h4>헤어와 풀메이크업과 촬영을 포함한 패키지 상품입니다. 오시기전에 가볍게 선크림까지만 바르고 오시면 됩니다. 너무 과도한 스킨케어는 메이크업을 밀리게 할수 있습니다.</h4>
  		<br>
  		<br>
  	 <h2>사진촬영 서비스</h2><hr>
  	 <h4>작가와 함께 다양한 표정을 찍고 고릅니다.

충분한 촬영을 통해 나에게 맞는 이미지를 찾으세요.

촬영은 마음에 들때까지 재촬영합니다.</h4>
<br><br>
<h2>사진 보정 서비스</h2><hr>
<h4>보정작업은 너무 과하지 않은 사진이 좋습니다.
지나친 보정에 의상과 헤어를 합성한더던지 좌우 얼굴을 복사해서 붙이는 부자연스러운 사진은 좋지 않습니다. 사진은 사진으로서 가장 아름다워야 사진입니다. 지나치면 그림입니다.</h4>
   </div>
</div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>