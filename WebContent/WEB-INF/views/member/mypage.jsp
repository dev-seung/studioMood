<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Member member = (Member)request.getAttribute("member");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My page</title>
 <style>
        @font-face {
            font-family: 'S-CoreDream-4Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'S-CoreDream-5Medium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .wrap {
        	margin-top:100px;
            margin: 0 auto;
            border: 1px solid gray;
            border-radius: 10px;
            width: 800px;
            height: 600px;
            text-align: center;
        }

        .wrap h2 {
            font-family: 'S-CoreDream-4Regular';
            margin-left: 30px;
            margin-top : 20px;
            padding-bottom: 10px;
            text-align: left;
            text-indent: 30px;
            width: 200px;
            border-bottom: 3px solid #FBB1B5;
        }

        .a-wrap {
            width: 100%
        }

        .Btn {
            display: inline-block;
            margin: 5px;
            border: 1px solid #FBB1B5;
            border-radius: 5px;
            background-color: transparent;
            color: #FBB1B5;
            width: 90px;
            height: 40px;
            text-decoration: none;
            line-height: 40px;
            font-family: 'S-CoreDream-5Medium';
        }

        .mypage-table {
            top: 300px;
            font-family: 'S-CoreDream-4Regular';
            margin: 0 auto;
            margin-top: 50px;
        }

        .mypage-table th {
            width: 130px;
            height: 40px;
            text-indent: 15px;
            text-align: left;
        }

        .mypage-table td {
            width: 300px;
            line-height : 40px;
            text-align: left;
        }

        input {
        	font-size : 9pt;
            height: 30px;
            width: 200px;
        }

        .button-wrap {
            margin-top: 60px;
            margin-right: 30px;
            float: right;
        }
        .Btn:hover{
        	color : white;
        	background-color : #FBB1B5;
        	text-decoration: none;
        }

    </style>


</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<br><br><br>
<div class="wrap">
        <h2>마이페이지</h2>
        
        <form action="/updateMember?memberId=<%=m.getMemberId() %>" method="post">
            <table class="mypage-table">
                <tr>
                    <th>아이디</th>
                    <td>
						<%=member.getMemberId()%>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                        <%=member.getMemberName()%>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="text" name="phone" id="phone" value="<%=member.getPhone() %>">
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>
                        <input type="text" name="birth" id="birth" value="<%=member.getBirth() %>">
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
						<%=member.getGender()%>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                        <input type="text" name="email" id="email" value="<%=member.getEmail() %>">
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input type="text" name="addr" id="addr" value="<%=member.getAddress() %>">
                    </td>
                </tr>

            </table>


            <div class="button-wrap">
               <button type="submit" class="updateBtn Btn">정보변경</button>
               <a class="deleteBtn Btn" href="/deleteMember?memberId=<%=member.getMemberId()%>">회원탈퇴</a>
            </div>
</form>
    </div>


<br><br><br>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>