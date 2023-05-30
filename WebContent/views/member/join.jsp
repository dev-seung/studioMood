<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>회원가입</title>
<style>
        .join-table-wrap {
            width: 80%;
            margin: 0 auto;
            margin-bottom : 50px;
            text-align: center;
        }

        .join-title {
            width: 200px;
            margin: 0 auto;
            margin-top : 30px;
            text-align: center;
            border-bottom: 3px solid #FBB1B5;
        }

        input {
            width: 265px;
            height: 25px;
            outline: none;
        }

        input[type=radio] {
            display: none;
        }

        input[name=gender]+label {
            display: inline-block;
            height: 37px;
            line-height: 37px;
            width: 130px;
            text-align: center;
            border: 1px solid rgb(94, 94, 94);
            color: rgb(94, 94, 94);
        }

        input[name=gender]:checked+label {
            background-color: rgb(94, 94, 94);
            color: #fff;
        }

        input[type=checkbox] {
            width: 15px;
            height: 15px;
        }

        .join-table {
            margin: 0 auto;
            text-align: left;
        }

        .join-table th {
            width: 150px;   
        }

        .join-table td {
            width: 450px;
            height: 30px;
        }

        .join-table th,
        .join-table td {
            border-top: 1px solid gray;
            height: 40px;
        }
        .gender-td{
            padding:5px; 
        }
        #idMsg,
        #pwMsg{
        	font-size: 8pt;
        }

        .most {
            color: orangered;
        }

        .submit {
            margin: 0 auto;
            width: 150px;
            height: 40px;
            font-size: 11pt;
            background-color: #FBB1B5;
            border : none;
            color: rgb(248, 246, 246);
            
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

  <div class="join-title">
        <h3>회원가입</h3>
    </div>
    <br><br>
	<form action="/join" method="post" id="memberJoin">
		<div class="join-table-wrap">
	        <table class="join-table">
	            <tr>
	                <th><span class="most">*</span> 아이디</th>
	                <td>
	                    <input type="text" name="memberId" id="memberId"> <span id="idMsg"></span>
	                </td>
	
	            </tr>
	            <tr>
	                <th><span class="most">*</span> 비밀번호</th>
	                <td>
	                    <input type="password" name="memberPw" id="memberPw">
	                </td>
	            </tr>
	            <tr>
	                <th><span class="most">*</span> 비밀번호 확인</th>
	                <td>
	                    <input type="password" name="memberPw-re" id="memberPw_re"> <span id="pwMsg"> </span>
	                </td>
	            </tr>
	            <tr>
	                <th><span class="most">*</span> 이름</th>
	                <td>
	                    <input type="text" name="memberName" id="name">
	                </td>
	            </tr>
	            <tr>
	                <th><span class="most">*</span> 전화번호</th>
	                <td>
	                    <input type="text" name="phone" id="phone">
	                </td>
	            </tr>
	            <tr>
	                <th> 생년월일</th>
	                <td>
	                    <input type="text" name="birth" id="birth" placeholder="예)19900202">
	                </td>
	            </tr>
	            
	            <tr>
	                <th> 성별</th>
	                <td class="gender-td">
	                    <input type="radio" name="gender" value="남" id="m"><label for="m">남자</label>
	                    <input type="radio" name="gender" value="여" id="f"><label for="f">여자</label>
	                </td>
	            </tr>
	            <tr>
	                <th>이메일</th>
	                <td>
	                    <input type="text" name="email" id="email">
	                </td>
	            </tr>
	            
	             <tr>
	                <th> 주소</th>
	                <td>
	                    <input type="text" name="address" id="address">
	                </td>
	            </tr>
	            
	            <tr>
	                <td colspan="2" style="text-align: center">
	                	<br>
	                    <input type="checkbox" name="agree" id="agree">
	                    <a href="#">이용약관</a> 개인정보 사용 동의<br>
	                    <input type="checkbox" name="agree" id="agree">
	                    <a href="#">이용약관</a> 개인정보 사용 동의
	                </td>
	            </tr>
	        </table>
	        <br>
	        <input class="submit" type="submit" value="회원가입">
	    </div>
	</form>
   
	<script>
		$(function(){
			var pw = $("#memberPw");
		    var pw_re = $("#memberPw_re");
		    var msg = $("#pwMsg");
			console.log("test");
		    pw_re.change(function() {
		    	console.log("이벤트 안");
		        if (pw.val() == pw_re.val()) {
		            $(this).next().html("비밀번호가 일치합니다.").css('color','#5AB6DB');
		        }else{
		            $(this).next().html("비밀번호가 일치하지 않습니다.").css('color','#DC413E');
		        }
		    });
		    
		});
	
		$("#memberId").keyup(function(){
			var memberId = $(this).val();
			
			$.ajax({
				url : "/ajaxCheckedId",
				type : "get",
				data : {memberId:memberId},
				success : function(data){
					var msg = $("#idMsg");
					if(data == 1){
						msg.html("  사용 가능한 아이디 입니다.");
						msg.css('color','#5AB6DB');
					}else{
						msg.html("  이미 사용중인 아이디 입니다.");
						msg.css('color','#DC413E');
					}
				}
			});
		});
	
	</script>
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>