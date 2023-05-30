<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[STUDIO Mood:]admin_</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
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
            padding-left: 10px;
        }

        .div2 {
            height: 28%;
        }

       .admin-content {
            width: 1200px;         
            float: left;
            display: inline-block;
            height: 950px;
            border-radius: 10px;
            margin: 20px;
            background-color: white;
            text-align: left;
        }


        .real-content>p {
            font-family: 'Black Han Sans';
            font-size: 50pt;
            margin: 10px;

        }

        .real-content>p>span {
            font-family: 'Black Han Sans';
            font-size: 45pt;
            margin-top: 100px;
            color: #56373c;

        }

        .real-content>span {
            font-family: 'GmarketSansMedium';
            margin: 30px;
            font-size: 20pt;
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
                <p>STUDIO <span>Mood:</span></p><br>
                <span>admin page</span>
            </div>
            <div class="div2"></div>
        </div>

    </div>


</body>
</html>