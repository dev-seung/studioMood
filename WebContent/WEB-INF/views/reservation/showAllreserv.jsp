<%@page import="reservation.model.vo.Reservation"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("reservationList");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
            height: 13%;
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
        }

        .title {
            text-align: left;
            font-family: 'GmarketSansBold';
            font-size: 25pt;
        }
        .th-short{
            width: 120px;
        }
        .th-long{
            width: 202px;
        }
        .table th{
            font-size:11pt;
        }
        .table td{
        	padding : 10px;
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
<style>
	#table-content{
		margin:0 auto;
		width:90%;
		height:60vw;
		min-height:800px;
		max-height:1200px;
		text-align:center;
		display: flex;
		justify-content: center;
		align-items: center;
		/*border: 1px solid black;*/
	}
	        .real-content {
            display: inline-block;
            width:80%;
        }
	.table{
		margin:0 auto;
		width: 100%;
		height: 100%;
		font-family: 'S-CoreDream-5Medium';
 		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff');
		font-weight: normal;
 		font-style: normal;
	}
	#titleLine>th{
		width: calc(100%/11);
		height: 5vw;
	}
	#btn{
		border: none;
		height: 10vw;
	}
	#btn button{
		width: 60%;
		height:40%;
		max-height:100px;
		font-size:1.5em;
		border-radius:50px;
	}
</style>
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
                <div class="members" >
                    <p class="title"> 전체예약정보 </p>
                    <table class="table table-hover">
                        <tr>                            
                            <th class="th-short">체크</th>
                            <th class="th-short">No</th>
                            <th class="th-long">이름</th>
                            <th class="th-long">전화번호</th>
                            <th class="th-long">예약날짜</th>
                            <th class="th-long">시작시간</th>
                            <th class="th-long">종료시간</th>
                            <th class="th-long">컨셉</th>
                            <th class="th-short">컷수</th>
                            <th class="th-short">결제</th>
                            <th class="th-long">비밀번호</th>
                        </tr>
                        <%for(Reservation r : list){%>
                        	<tr>
                        		<td><input type="radio" name="temp" class="change"></td>
	                        	<td><%=r.getrNum() %></td>
								<td><%=r.getName() %></td>
								<td><%=r.getPhone() %></td>
								<td><%=r.getrDate() %></td>
								<td><%=r.getsTime() %></td>
								<td><%=r.geteTime() %></td>
								<td><%=r.getConcept() %></td>
								<td><%=r.getCutNum() %></td>
								<td><%=r.getrCheck() %></td>
								<td><%=r.getrPass() %></td>
                        	</tr>
                        <%} %>
                    </table>
                    <div id= "pageNavi"><%=pageNavi %></div>
                </div>
            </div>
            <div class="div2">
            	<button type="button" class="btn btn-secondary btn-lg" id="btnChangeReserve">변경하기</button>
            	<button type="button" class="btn btn-secondary btn-lg" id="btnDeleteReserve">취소하기</button>
            </div>
        </div>

    </div>

<!-- div id="table-content">
	<table>
		<tr id="titleLine">
			<th>체크</th><th>예약번호</th><th>이름</th><th>전화번호</th><th>예약날짜</th><th>시작시간</th><th>종료시간</th><th>컨셉</th><th>컷수</th><th>예약확인</th><th>예약비밀번호</th>
		</tr>
		<%for(int i=0; i<list.size();i++){ %>		
		<tr>
			<td><input type="radio" name="temp" class="change"></td>
			<td><%=list.get(i).getrNum() %></td>
			<td><%=list.get(i).getName() %></td>
			<td><%=list.get(i).getPhone() %></td>
			<td><%=list.get(i).getrDate() %></td>
			<td><%=list.get(i).getsTime() %></td>
			<td><%=list.get(i).geteTime() %></td>
			<td><%=list.get(i).getConcept() %></td>
			<td><%=list.get(i).getCutNum() %></td>
			<td><%=list.get(i).getrCheck() %></td>
			<td><%=list.get(i).getrPass() %></td>
		</tr>
		<%} %>		
		<tr>
			<td id="btn" colspan="5"><button type="button" id="btnChangeReserve">변경하기</button></td>
			<td id="btn"></td>
			<td id="btn" colspan="5"><button type="button" id="btnDeleteReserve">취소하기</button></td>
		</tr>
	</table>
	</div!-->
	
</body>
<script type="text/javascript">
	$("#btnChangeReserve").click(function(){
		var check = $("[type=radio]:checked");
		var rNum = check.parent().next().html();
		console.log("체크 = "+check);
		if(check.length!=0){
			location.href="/reserveUpdateNum?rNum="+rNum;
		}else{
			alert("경고");
		}
	});
	$("#btnDeleteReserve").click(function(){
		var check = $("[type=radio]:checked");
		var rNum = check.parent().next().html();
		if(check.length!=0){
			location.href="/reserveDeleteNum?rNum="+rNum;
		}else{
			alert("경고");
		}
	});
</script>
</html>