<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[STUDIO Mood:]</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

        .notosanskr * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        @font-face {
            font-family: 'S-CoreDream-5Medium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'S-CoreDream-4Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        /* Make the image fully responsive */

        .mainPage-content {
            margin: 0 auto;
            width: 96vw;
            
        }

        .carousel-inner img {
            width: 100%;
            height: 100%;
        }

        .content {
            width: 1200px;
            margin: 0 auto;
            margin-top: 100px;
            margin-bottom: 100px;
            
        }

        .main-info {
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
            padding: 50px;
        }

        .main-info p {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .circleBox {
            margin: 0 auto;
            text-align: center;
        }

        .circle-content {
            width: 350px;
            display: inline-block;
            margin: 10px;
            text-align: center;
        }

        .circle-title {
            margin: 30px;
            font-size: 20pt;
            font-family: 'S-CoreDream-5Medium';
        }

        .img-wrap {
            margin: 0 auto;
            border-radius: 50%;
            width: 250px;
            height:250px;
            border: 8px solid black;
            overflow: hidden;
        }

        .img-wrap>img {
            width: 150px;
            margin: 18% auto;
        }

        .contentDetail {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0 auto;
            width: 340px;
        }

        .contentDetail>p {
            font-family: 'S-CoreDream-4Regular';
        }

        .contentDetail span {
            font-weight: bold;
        }

        .productBox {
            margin: 0 auto;
            width: 1200px;;

        }

        .imgBox {
            width: 1200px;
            text-align: center;
            margin: 0;
        }

        .cover {
            display: inline-block;
        }
		.cover>p{
		font-family: 'S-CoreDream-5Medium';
		font-size:20px;
		}
        .product-info {
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
            padding: 50px;
        }

        .product {
            width: 350px;
            height: 208px;
            background-color: #d0b0b1;
            display: inline-block;
            margin: 20px;
            padding: 0;
            box-shadow: 2px 2px 3px gray;
            position: relative;
            
        }

        .product>img {
            width: 350px;
            height: 208px;
            position: absolute;
            top: 15px;
            left: 15px;
            box-shadow: 2px 2px 3px gray;
            transition-duration: 0.5s;
        }
        .imgHover{
            width: 350px;
            height: 208px;
            background-color: rgb(225,225,225);
            opacity: 0;
            
            top: 15px;
            left: 15px;
        }
        
        
        .product>img:hover{
            top: 18px;
            left: 18px;
        }

        @media(max-width:760px) {
            .content {
                width: 728px;
            }

            .circle-content {
                margin: 0 auto;
                display: block;
            }
            .imgBox{
                width: 720px;
                display: block;
            }
            
        }
    </style>

<script>

    
    </script>


</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	 <div class="mainPage-content">
        <div class="content-banner">
            <div id="demo" class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>

                <!-- 슬라이드 쇼 -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/unsplash1.jpg" alt="carousel1" width="1100" height="500">
                    </div>
                    <div class="carousel-item">
                        <img src="img/unsplash2.jpg" alt="carousel2" width="1100" height="500">
                    </div>
                    <div class="carousel-item">
                        <img src="img/unsplash3.jpg" alt="carousel3" width="1100" height="500">
                    </div>
                </div>

                <!-- 왼쪽 오른쪽 컨트롤 -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>

        </div>
        <div class="content">
            <div class="main-info">
                <h1>OUR SERVICE</h1>
                <P>스튜디오무드 만의 고객 맞춤 촬영</P>
            </div>
            <div class="circleBox">
                <div class="circle-content">
                    <div class="img-wrap">
                        <img src="img/price.png">
                    </div>
                    <div class="contentDetail">
                        <h3 class="circle-title">합리적인 가격</h3>
                        <p>
                            가격 대비 고퀄리티사진을 위해<br>
                            불필요한 요소는 빼고 합리적인<br>
                            가격으로 책정합니다.
                            <br><br>
                        </p>
                    </div>
                </div>
                <div class="circle-content">
                    <div class="img-wrap">
                        <img src="img/Retouching.png">
                    </div>
                    <div class="contentDetail">
                        <h3 class="circle-title">차별화된 보정</h3>
                        <p>
                            <span>1:1 리터칭 : </span>고객님의 의견을 충분히<br>
                            반영하여 보정작업을 진행합니다. <br>
                            <span>무제한 수정 : </span> 책임감을 가지고 촬영 후<br>
                            한달동안 무제한 재수정을 약속합니다.
                        </p>
                    </div>
                </div>
                <div class="circle-content">
                    <div class="img-wrap">
                        <img src="img/pictures.png">
                    </div>
                    <div class="contentDetail">
                        <h3 class="circle-title">사용용도에 맞는 결과물</h3>
                        <p>
                            프로필, 개인화보,홍보사진,서류사진 등<br>
                            사용용도에 맞는 결과물을 만듭니다.
                            <br><br><br>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="content productBox">
            <div class="product-info">
                <h1>GALLERY</h1>
            </div>

            <div class="imgBox">
                <div class="cover">
                    <div class="product product1">
                        <img src="img/personal_profile2.png">
                        
                    </div>
                    <p>개인프로필</p>
                </div>

                <div class="cover">
                    <div class="product product2">
                        <img src="img/body-profile.png">
                        
                    </div>
                    <p>바디프로필</p>

                </div>

                <div class="cover">
                    <div class="product product3">
                        <img src="img/group_profile.png">
                        
                    </div>
                    <p>단체프로필</p>

                </div>
            </div>
        </div>
    </div>

	<br><br><br><br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
<!--테스트버전 body>
	<h1>서버 테스트</h1>
	<h3><a href="/postList?reqPage=1">후기</a></h3>
	<a href="/noticeList?reqPage=1">공지사항</a>
	<h3><a href="/searchReserve?reqPage=1">예약조회</a></h3>
	<h3><a href="/reservationAllSearch">예약조회(관리자)</a></h3>
	<h3><a href="/test">달력</a></h3>
</body-->