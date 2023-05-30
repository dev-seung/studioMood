<%@page import="qna.model.vo.Qna"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
    ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
    String pageNavi = (String)request.getAttribute("pageNavi");

    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[STUDIO Mood:]admin_members</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        @font-face {
            font-family: 'Wemakeprice-Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'GmarketSansBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .admin-wrap {
            margin: 0 auto;
            width: 1500px;
            height: 1000px;
            border-radius: 20px;
            background-color: #9f807d;
        }

        .admin-menu {
            width: 200px;
            text-align: center;
            margin-top: 30px;
            height: 900px;
            background-color: #9f807d;
            display: inline-block;
            float: left;
        }

        .div1 {
            height: 20%;
        }

        .menuBox {
            height: 600px;
            margin: 0 auto;
            padding: 0;
        }

        .menu {
            list-style-type: none;
            margin: 0;
            padding: 0;
            font-weight: bold;
        }

        .profile-title {
            font-family: 'Wemakeprice-Bold';
            font-size: 20pt;
            margin-bottom: 20px;
            font-weight: bold;
            color: #56373c;
        }

        .icon {
            width: 30px;
            float: left;
        }

        .menu li>a {
            font-family: 'GmarketSansMedium';
            display: block;
            height: 45px;
            line-height: 45px;
            font-size: 10pt;
            color: #391e22;
            text-decoration: none;
        }

        .menu>li {
            text-align: left;
            text-indent: 10px;
            margin-left: 15px;
            padding-left: 15px;
            padding-top: 5px;
        }

        .div2 {
            height: 10%;
        }

        .admin-content {
            width: 1200px;
            
            float: left;
            display: inline-block;
            height: 950px;
            
            border-radius: 10px;
            margin: 20px;
            background-color: white;
            text-align: center;
        }

        .real-content {
            display: inline-block;
            width:80%;
        }

        .title {
            text-align: left;
            font-family: 'GmarketSansBold';
            font-size: 25pt;
        }
        table{
        	width:100%;
        }

        .th-long{
            width: 200px;
        }
        .table th{
            font-size: 11pt;
        }
        .table td{
            font-size: 10pt;
        }
        #pageNavi>*{
        	text-align: center;
        	margin: 10px;
        }
        .selectPage{
        	color : #5f7880;
        	font-weight: bold;
        	
        }
        table a{
        	color:black;
        }
        table a:hover{
        	color:black;
        	text-decoration:none;
        }
    </style>
    <script>
        $(function() {
            $(".menu li>a").hover(function() {
                $(this).parent().css('background-color', '#d0b0b1');
            }, function() {
                $(this).parent().css('background-color', '#9f807d');
            });
        });
    </script>

</head>
<body>
 <div class="admin-wrap">
        <!--화면 좌측-->
        <div class="admin-menu">
            <div class="div1"></div>
            <div class="menuBox">
                <img class="circle profile" src="img/admin.svg" width="100px;">
                <div class="profile-title">
                    admin
                </div><br><br>
                <ul class="menu">
                    <li>
                        <a href="/">
                            <img src="img/icon_Home.svg" class="icon">
                            <span>STUDIO Mood:</span>
                        </a>
                    </li>
                    <li>
                        <a href="/adminMembers?reqPage=1">
                            <img src="img/icon_members.svg" class="icon">
                            MEMBERS
                        </a>
                    </li>
                    <li>
                        <a href="/reservationAllSearch?reqPage=1">
                            <img src="img/icon_reservation.svg" class="icon">
                            RESERVATION
                        </a>
                    </li>
                    <li>

                        <a href="/adminQna?reqPage=1">
                            <img src="img/icon_Notice.svg" class="icon">
                            QnA
                        </a>
                    </li>
                </ul>
            </div>
            <div class="div1"></div>
        </div>
        <!--화면 우측-->
        <div class="admin-content">
            <div class="div2"></div>
            <div class="real-content">
                <div class="members">
                    <p class="title"> 문의사항 </p>
                   
                    <table class="table table-hover">
                        <tr>
                            <th width="10%" class="th-short">No.</th>
                            <th width="60%" class="th-short">제목</th>
                            <th width="10%" class="th-long">작성자</th>
                            <th width="20%" class="th-long">날짜</th>
                        </tr>
                        <%for(Qna q : list){%>
                        	<tr>
	                        	<td><%=q.getqNum() %></td>
	                        	<td><a href="/qnaView?qnaNo=<%=q.getQnaNo() %>"><%=q.getqTitle() %></td>
	                        	<td><%=q.getqWriter() %></td>
	                        	<td><%=q.getqDate() %></td>
                        	</tr>
                        <%} %>
                    </table>
                    <div id= "pageNavi"><%=pageNavi %></div>
                </div>
            </div>
            <div class="div2"></div>
        </div>

    </div>
</body>
</html>