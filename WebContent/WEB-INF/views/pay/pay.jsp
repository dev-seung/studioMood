<%@page import="payment.model.vo.Pay"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Pay pay = (Pay) request.getAttribute("pay");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 결제모듈 API -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<style>
 #chk{
	display: none;
} 
</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="table-wrapper"
		style="width: 50%; text-align: center; margin: 100px auto;">
		<table class='table'>
			<tr>
				<th>컨셉</th>
				<td class="concept"><%=pay.getConcept()%></td>
			</tr>
			<tr>
				<th>컷수</th>
				<td class="cutNum"><%=pay.getCutNum()%> 장</td>
			</tr>
			<tr>
				<th colspan="2">예약금을 먼저 결제하시겠습니까?</th>
			</tr>
		</table>
		<div id="pay">
			<button class="btn btn-outline-danger">결제하기</button>
			<form action="/payCheck?phone=<%=pay.getPhone()%>" method="post">
			<button class="btn btn-outline-danger" id="chk">결제완료</button>
			<p id="paymentResult"></p>
		</form>
		</div>
		
	</div>

</body>
<script>
	$(function() {
		$("#pay button").click(
				function() {
					var price = 10000;
					var d = new Date();
					var date = d.getFullYear() + '' + (d.getMonth() + 1) + ''
							+ d.getDate() + '' + d.getHours() + ''
							+ d.getMinutes() + '' + d.getSeconds();
					IMP.init("imp73474750");
					IMP.request_pay({
						merchant_uid : '상품명_' + date, //상점 거래 ID
						name : "결제 테스트", //결제이름
						amount : price, //결제 금액
						buyer_email : 'sonhs19996@naver.com', // 구매
						buyer_name : "구매자 이름", //구매자 이름
						buyer_tel : "010-3345-6908", // 구매자 전화번호
						buyer_addr : "서울시 영등포구 당산동", //구매자 주소
						buyer_postcode : "123-456" //우편번호
					}, function(rsp) {
						if (rsp.success) { //결제 성공시
							var r1 = "고유 ID : " + rsp.imp_uid;
							var r2 = '상점 거래 아이디 : ' + rsp.merchant_uid;
							var r3 = '결제 금액 : ' + rsp.paid_amount;
							var r4 = '카드 승인 번호 : ' + rsp.apply_num;
							alert('예약금 결제에 성공하였습니다.');
							$("#paymentResult").html(r4);
							$("#chk").css("display","inline-block");
						} else { //결제 실패시
							alert("결제 실패 사유 : " + rsp.error_msg);
						}
					});
				});

	});
</script>



</html>