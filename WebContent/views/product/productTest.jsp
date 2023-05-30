<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	@import url('https://fonts.googleapis.com/css?family=Open+Sans');
	.text-center {
	text-align: center;
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
	width:100%;
	height:100px;
	text-align:center;
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


</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="explain-content">
	<h1 class="text-center">
Various concepts
</h1>

<div class="pricing-box-container">
	<div id="indiv" class="pricing-box text-center">
	<div class="opacity-div">
		<h5>개인프로필</h5>
		<p class="price"><sup>₩</sup>0<sub>/mo</sub></p>
		<ul class="features-list">
			<li><strong>1</strong> Project</li>
			<li><strong>5</strong> Team Members</li>
			<li><strong>50</strong> Personal Projects</li>
			<li><strong>5,000</strong> Messages</li>
		</ul>
		</div>
	</div>

	<div id="group" class="pricing-box text-center">
	<div class="opacity-div">
		<h5>단체프로필</h5>
		<p class="price"><sup>₩</sup>10000</p>
		<ul class="features-list">
			<li><strong>1</strong> Project</li>
			<li><strong>5</strong> Team Members</li>
			<li><strong>50</strong> Personal Projects</li>
			<li><strong>5,000</strong> Messages</li>
		</ul>
		</div>
	</div>

	<div id="body" class="pricing-box text-center">
	<div class="opacity-div">
		<h5>바디프로필</h5>
		<p class="price"><sup>₩</sup>89<sub>/mo</sub></p>
		<ul class="features-list">
			<li><strong>25</strong> Project</li>
			<li><strong>50</strong> Team Members</li>
			<li><strong>500</strong> Personal Projects</li>
			<li><strong>50,000</strong> Messages</li>
		</ul>
		
	</div>
	</div>
	<div class="explain-product">
		<h3>여기다가 설명을 좀 써주세요 현식씌  저는 이미 베개앞에 핸들이 고장난 8톤트럭 </h3>
	</div>
</div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>