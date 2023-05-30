<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
        .footer{
            background-color: rgb(124, 117, 117);
            text-align: center;
            
            height: 250px;
            margin: 0;
            padding: 0;
            z-index: 0;
        }
        .footerBox{
            margin: 20px;
            text-align: left;
            display: inline-block
        }
        .footerBox >h2{
       		font-family: 'S-CoreDream-5Medium';
            color: rgb(241, 209, 209);
            font-size: 18pt;
        }
        .footerBox>p{
        	font-family: 'S-CoreDream-4Regular';
        	font-size: 9pt;
            color: rgb(241, 238, 238);
        }
        .footer-top,
        .footer-bottom{
        	margin : 0 auto;
            width: 1198px;
        }
        .footer-bottom>p{
          color: rgba(241, 238, 238, 0.8);
          font-size: 10pt;
        }
        .icon{
            
        }
        .icon>img{
            
            width: 50px;
        }
    </style>
</head>
<body>
 <footer>
       <div class="footer">
           <div class="footer-top">
                <div class="footerBox company-info" width:310px;>
                <h2>COMPANY INFO</h2>
                <p>
                    Company : 스튜디오무드 <br>
                    Business-License : 888-999-33333<br>
                    Tel: 02-3333-5555<br>
                    Email : mood_studio@gmail.com<br>
                    Addr : 서울특별시 강남구 사진관로 34번길<br>
                </p>
            </div>
            <div class="footerBox bank-info" width:180px;>
                <h2>BANK INFO</h2>
                <p>
                    농협 : 333-8888-5555-44 <br>
                    국민 : 888999-01-33333<br><br>
                    예금주: 스튜디오 분위기<br><br>
                    
                </p>
            </div>
            <div class="footerBox cs" width:230px;>
                <h2>CS CENTER</h2>
                <p>
                    tel : 010-2222-5555 <br>
                    mail : mood_studio@gmail.com<br><br><br><br>
                </p>
            </div>
           <div class="footerBox icon" width:130px;>    
               <img src="/img/Facebook_1.png">
               <img src="/img/Twitter_1.png">
               <img src="/img/Instagram_1.png">
               <p><br><br><br><br></p>
           </div>
           </div>
           
            <div class="footer-bottom">
                <p>Copyright &copy; 2020 by Studiomood All Right Reserved</p>
            </div>
            
       </div>
       
   </footer>
    
</body>
</html>