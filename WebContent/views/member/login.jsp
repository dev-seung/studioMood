<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>studio_Mood:_Login</title>


    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <style>
    
     	@font-face {
            font-family: 'S-CoreDream-4Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
		    font-family: 'Cafe24Danjunghae';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Danjunghae.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
        
        .modal {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background-color: rgba(0, 0, 0, 0.3);
        }

        .modalBox {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border-radius: 10px;
            height: 400px;
            width: 700px;
        }

        .imgBox {
            width: 400px;
            height: 100%;
            display: inline-block;
            float: left;
        }

        img {
            height: 100%;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .loginBox {
            text-align: center;
            width: 300px;
            height: 400px;
            display: inline-block;
            margin-top : 20px;
        }

        .login {
            text-align: center;
            margin-top: 20px;
            font-family: 'S-CoreDream-4Regular';
        }
        .login-title {
        	font-family: 'Cafe24Danjunghae';
        }

        .login input {
            margin: 5px;
            width: 215px;
            height: 30px;
            border: 1.5px solid #373a40;
            border-radius: 5px;
            outline: none;
        }

        #loginBtn {
            width: 220px;
            height: 40px;
            color: white;
            border: none;
            background-color: #000;
            margin: 10px;
            
            font-weight: bold;
        }


        .close {
            display: block;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            border: 3px solid #000;
            text-align: center;
            line-height: 20px;
            text-decoration: none;
            color: #000;
            font-size: 15px;
            font-weight: bold;
            margin: 0 auto;
        }
		#kakao-login-btn{
			padding:0px;
			background:white;
			border:0px;
			height:auto;
			margin:0 auto;
			
		}
    </style>
    
</head>
<body>

	
	
		<div class="modal" id="modal">
		    <div class="modalBox modal-con">
		        <div class="imgBox">
		            <img src="/img/loginImg.jpg">
		        </div>
		        <div class="loginBox">
		            <div class="login-title">
		                <h1>STUDIO Mood:</h1>
		            </div>
		            <div class="login">
		                <h2>Login</h2>
		                <form action="/login" method="post" id="login">
		                <input type="text" id="id" name="id" placeholder="ID"><br>
		                <input type="password" id="pw" name="pw" placeholder="password"><br>
		                <button type="submit" id="loginBtn" value="로그인">로그인</button><br>
		                 
		                </form>
		                
		                	<input class="kakaoHiddenId" name="kakaoID" value="" type="hidden">
		                	<a href="javascript:kakaoLogin();" id="kakao-login-btn" ></a>
		                	
		                	
		                
		               
		            </div>
		        </div>
		
		    </div>
		
		</div>
	
<script type="text/javascript">
	var id=null;
    document.addEventListener("DOMContentLoaded", function() {



        // @details 카카오톡 Developer API 사이트에서 발급받은 JavaScript Key

        
    	

    	
    	Kakao.init( "d1bb131319eadae26c139431e519d390" );
        // @breif 카카오 로그인 버튼을 생성합니다.

        Kakao.Auth.createLoginButton({

              container : "#kakao-login-btn"

            , success : function( authObj ) {



                // console.log( authObj );
				
	

                Kakao.API.request({
                	
                      url : "/v2/user/me"
                    	 

                    , success : function( res ) {
                    	
                    	

                        // console.log( res );



                        // @breif 아이디
                        
						id=res['id'];
                        $(".kakaoHiddenId").attr("value",res['id']);
                        console.log(id);
                       
                        // @breif 닉네임
						
						 Kakao.API.request({
    	      		url: '/v1/user/unlink',
    	     		 success: function(res) {
    	    	  
    	       		 
    	     		 },
    	     		 fail: function(err) {
    	       		 alert('fail: 탈퇴 실패' )
    	     		 },
    	    	});
                        if(id!=null){
                        	location.href="/kakaoLogin?kakaoLoginId="+id;
                        }
                    		
                    		
                    	

                      



                    }, fail : function( error ) {

                        alert( "불러왔지만 실패");

                    }

                });

            }

            , fail : function( error ) {

                alert( "불러오지도 못함");

            }

        });

    });
   
    
    	
    
</script>

</body>
</html>