<%@page import="java.util.ArrayList"%>
<%@page import="reservation.model.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%    
    	ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("ReserveList");
    	//request.setAttribute("chkReserve",r);
    	String msg = (String)request.getAttribute("alertMsg");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	#table-content{
		
		height:auto;
	}
	#resv-one-search {
	
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin:0 auto;
}

.resv-search-result{
  border: 1px solid #ddd;
  padding: 8px;
}

#resv-one-search tr{background-color: #f2f2f2;}

#resv-one-search tr:hover {background-color: #ddd;}

#resv-one-search th {
  border:1px solid rgb(241, 209, 209);
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: white;
  color: black;
}
#btn{
	width:50%;
	background:white;
	border: none;
	height: 10vw;
	text-align:center;
}
button{
	width: 40%;
	height:30%;
	border:1px solid lightgray;
	background:white;
	font-weight:bolder;
	color:gray;
}
.resv-btn{
	width:80vw;
	text-align:center;
	float:left;
}
#table-content h2{
	margin-top:40px;
	margin-bottom:40px;
	text-align:center;
	font-family: 'Sunflower', sans-serif;
}
.resv-chk-submit{
	height:100px;
	margin:0 auto;
	text-align:center;
	
}
.resv-chk-button{
	height:50px;
	margin-top:20px;
	width:20%;
	margin:20px;
}
</style>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div id="table-content">	
	<div><h2>예약조회</h2></div>
	
	<table id="resv-one-search">
	<tr>
		<th>체크</th>
		<th>예약번호</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>예약날짜</th>
		<th>시작시간</th>
		<th>종료시간</th>
		<th>컨셉</th>
		<th>컷수</th>
		<th>예약확인</th>
	</tr>
	<%if(list.size()!=0) {%>
  <%for(int i=0; i<list.size(); i++) {%>
  <tr>
  	<td class="resv-search-result"><input type="radio" name="temp" class="change"></td>
    <td class="resv-search-result"><%=list.get(i).getrNum() %></td>
    <td class="resv-search-result"><%=list.get(i).getName() %></td>
    <td class="resv-search-result"><%=list.get(i).getPhone() %></td>
    <td class="resv-search-result"><%=list.get(i).getrDate() %></td>
    <td class="resv-search-result"><%=list.get(i).getsTime() %></td>
    <td class="resv-search-result"><%=list.get(i).geteTime() %></td>
    <td class="resv-search-result"><%=list.get(i).getConcept() %></td>
    <td class="resv-search-result"><%=list.get(i).getCutNum() %></td>
    <td class="resv-search-result"><%=list.get(i).getrCheck() %></td>
    
  </tr>
  <%} %>
  <%}else{ %>
  <tr>
  	<td colspan="11"><%=msg %></td>
  </tr>
  <%} %>
  
  </table>
  <div class="resv-chk-submit">
  	
  	<button type="button" class="resv-chk-button" id="btnChangeReserve">변경하기</button>
	<button type="button" class="resv-chk-button" id="btnDeleteReserve">취소하기</button>
	<button type="button" class="resv-chk-button" id="btnPayReserve">결제하기</button>
  
  </div>
 
  </div>
		
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
<script type="text/javascript">
$("#btnChangeReserve").click(function(){
	var check = $("[type=radio]:checked");
	var rNum = check.parent().next().html();
	
	if(check.length!=0){
		console.log("성공");
		location.href="/reserveUpdateNum?rNum="+rNum;
	}else{
		alert("경고");
	}
		
	
	
	//비회원은 현재 수정이 아니라 삽입되는 현상 발생함 해결요망
});
$("#btnDeleteReserve").click(function(){
	var check = $("[type=radio]:checked");
	var phone = check.parent().next().next().next().html();
	if(check.length!=0){
		location.href="/reserveDelete?phone="+phone;
	}else{
		alert("경고");
	}
	
});
$("#btnPayReserve").click(function(){
	var check = $("[type=radio]:checked");
	var phone = check.parent().next().next().next().html();
	if(check.length!=0){
		location.href="/payment?phone="+phone;
	}else{
		alert("경고");
	}
	
});
</script>
</html>