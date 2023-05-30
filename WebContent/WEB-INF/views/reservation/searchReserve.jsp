<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='/fullcalendar-5.4.0/lib/resv.css' rel='stylesheet' />
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
/* Form */
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 300px;
  margin: 0 auto 100px;
  padding: 30px;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
  text-align: center;
}
.form .thumbnail {
  width: 200px;
  height: 180px;
  margin: 0 auto 30px;
  border-top-left-radius: 100%;
  border-top-right-radius: 100%;
  border-bottom-left-radius: 100%;
  border-bottom-right-radius: 100%;
  box-sizing: border-box;
}
.form .thumbnail img {
  display: block;
  width: 100%;
}
.form input {
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  outline: 0;
  background: rgb(241, 209, 209);
  width: 100%;
  border: 0;
  padding: 15px;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #EF3B3A;
  text-decoration: none;
}
.form .register-form {
  display: none;
}

.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 30px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
.navi-menu li>a {
    line-height: 30px;
}
.resv-chk-do:hover{
	text-decoration:none;
	color:#4a4a4a;
}
/* END Form */
/* Demo Purposes */
body {
  
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.resv-main-frame{
	width:80%;
	height:auto;
}
.resv-content{
	height:auto;
}
</style>
<body>

<div class="resv-main-frame">
    <div class="resv-chk">
        <a href="/test" class="resv-chk-do">예약하기</a>
    </div>
    <div class="resv-chk">
        <a href="/searchReserve" class="resv-chk-do">예약확인</a>
    </div>
    <div class="resv-content">

<div class="container">
  <div class="info">
    <h1>Reservation inquiry</h1><span>전화번호와 4자리 비밀번호를 입력하세요 <i class="fa fa-heart"></i> </span>
  </div>
</div>
<div class="form">
  <div class="thumbnail"><img src="/img/logo.png"/></div>
 
  <form class="login-form" action="/chkReserve">
    <input type="text" placeholder="phone" name="phone"/>
    <input type="password" placeholder="password" name="pw"/>
    <button>login</button>
  </form>
</div>

  </div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>