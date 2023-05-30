<%@page import="reservation.model.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Reservation reservation = (Reservation)request.getAttribute("reservation");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<style>
*,
:before,
:after {
  box-sizing: border-box;
}

body {
  background: #424242;
}

form {
  width: 320px;
  margin: 45px auto;
}
form h1 {
  font-size: 3em;
  font-weight: 300;
  text-align: center;
}
form h5 {
  text-align: center;
  text-transform: uppercase;
  color: #c6c6c6;
}
form hr.sep {
  background: #2196f3;
  box-shadow: none;
  border: none;
  height: 2px;
  width: 25%;
  margin: 0px auto 45px auto;
}
form .emoji {
  font-size: 1.2em;
}

.group {
  position: relative;
  margin: 45px 0;
}

textarea {
  resize: none;
}

input,
textarea {
  background: none;
  color: #c6c6c6;
  font-size: 18px;
  padding: 10px 10px 10px 5px;
  display: block;
  width: 320px;
  border: none;
  border-radius: 0;
  border-bottom: 1px solid #c6c6c6;
}
input:focus,
textarea:focus {
  outline: none;
}
input:focus ~ label, input:valid ~ label,
textarea:focus ~ label,
textarea:valid ~ label {
  top: -14px;
  font-size: 12px;
  color: rgb(241, 209, 209);
}
input:focus ~ .bar:before,
textarea:focus ~ .bar:before {
  width: 320px;
}

input[type="password"] {
  letter-spacing: 0.3em;
}

label {
  color: #c6c6c6;
  font-size: 16px;
  font-weight: normal;
  position: absolute;
  pointer-events: none;
  left: 5px;
  top: 10px;
  -webkit-transition: 300ms ease all;
  transition: 300ms ease all;
}

.bar {
  position: relative;
  display: block;
  width: 320px;
}
.bar:before {
  content: "";
  height: 2px;
  width: 0;
  bottom: 0px;
  position: absolute;
  background: #faf2f2;
  -webkit-transition: 300ms ease all;
  transition: 300ms ease all;
  left: 0%;
}

.btn {
  background: #fff;
  color: #959595;
  border: none;
  padding: 10px 20px;
  border-radius: 3px;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  text-decoration: none;
  outline: none;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  -webkit-transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}
.btn:hover {
  color: #8b8b8b;
  box-shadow: 0 7px 14px rgba(0, 0, 0, 0.18), 0 5px 5px rgba(0, 0, 0, 0.12);
}
.btn.btn-link {
  background: #faf2f2;
  color: #d3eafd;
}
.btn.btn-link:hover {
  background: #0d8aee;
  color: #deeffd;
}
.btn.btn-submit {
  background: rgb(241, 209, 209);
  color: black;
}
.btn.btn-submit:hover {
  background: #faf2f2;
 color: #8b8b8b;
}
.btn.btn-cancel {
  background: #eee;
}
.btn.btn-cancel:hover {
  background: #e1e1e1;
  color: #8b8b8b;
}

.btn-box {
  text-align: center;
  margin: 50px 0;
}

.nonMem-disabled{
	background-color:rgb(124, 117, 117);
}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<div class="wrapper">
  <form action="/nonMemberReservation">
    <h1>비회원 예약</h1>
    <h5>이름과 전화번호를 입력하세요</h5>
    
    <div class="group">
      <input type="text" required="required" name="name"/><span class="highlight"></span><span class="bar"></span>
      <label>Name</label>
    </div>
    <div class="group">
      <input type="text" required="required" name="phone" /><span class="highlight"></span><span class="bar"></span>
      <label>phone</label>
    </div>
    <div class="group">
      <input type="password" value="<%=reservation.getrPass() %>" required="required" name="rPass" class="nonMem-disabled" readonly/><span class="highlight"></span><span class="bar"></span>
      <label> </label>
    </div>
    <div class="group">
      <input type="text" required="required" value="<%=reservation.getrDate() %>" name="rDate" class="nonMem-disabled" readonly/><span class="highlight"></span><span class="bar"></span>
    </div>
     <div class="group">
      <input type="hidden" required="required" value="<%=reservation.getsTime() %>" name="sTime"  readonly/><span class="highlight"></span><span class="bar"></span>
    	<input type="text" class="nonMem-disabled" disabled>
    	<label><%=reservation.getsTime() %>시</label>
    </div>
     <div class="group">
      <input type="hidden" required="required" value="<%=reservation.geteTime() %>" name="eTime" readonly/><span class="highlight"></span><span class="bar"></span>
    	<input type="text" class="nonMem-disabled" disabled>
    	<label><%=reservation.geteTime() %>시</label>
    </div>
    <div class="group">
      <input type="text" required="required" value="<%=reservation.getConcept() %>" name="concept" class="nonMem-disabled" readonly/><span class="highlight"></span><span class="bar"></span>
    </div>
    <div class="group">
      <input type="hidden" required="required" value="<%=reservation.getCutNum() %>"  name="cutNum" readonly/><span class="highlight"></span><span class="bar"></span>
    	<input type="text" class="nonMem-disabled" disabled>
    	<label><%=reservation.getCutNum() %>컷</label>
    </div>
    <div class="group">
      <input type="hidden" required="required" value="<%=reservation.getrCheck() %>" name="rCheck" class="nonMem-disabled" readonly/><span class="highlight"></span><span class="bar"></span>
    </div>
    
    <div class="btn-box">
      <button class="btn btn-submit" type="submit">submit</button>
      <button class="btn btn-cancel" type="button">cancel</button>
    </div>
  </form>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>