<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/nse_files/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<style>
	.content-writer *{
		margin: 0 auto;
	}
	
        .header-text {
            margin-top: 50px;
            width: 150px;
            text-align: center;
            font-weight: bold;
            font-size: 30px;
            border-bottom: 4px solid #FBB1B5;
        }
	     .content-table{
             margin-top:50px;
             width:80%;
             border: 1px solid lightgray;
             border-collapse: collapse;
        }
        .content-table tr,th,td{
           
             border: 1px solid lightgray;
             border-collapse: collapse;
             
        }
/*          .content-table input{
           outline:1px solid white;
        } */
		input{
			width:95%;
			border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
			outline:none;
		}
		input:focus {outline:none;}
		textarea{
			width:99.5%;
			height:400px;
			border:none;
			resize: none;
			text-align:center;
		}
		textarea:focus{
			outline:none;
		}
		.content-btn {
         margin:5px;
         display:inline-block;
            width: 80px;
            height: 40px;
            font-weight: bold;
            font-size: 15px;
            text-align: center;
            background-color: #dfd3d3;
            border: 2px solid #dfd3d3;
            border-radius: 5px;
            list-style: none;
            color: #4a4a4a;
             text-decoration: none;
             line-height:40px;
             vertical-align:middle;
             padding:0;
        }
        .content-btn:hover{
        	 color: #4a4a4a;
             text-decoration: none;
        }
        .button{
        	width:100%;
        	height:50px;
        	text-align:center;
        }

        	a{
		 text-decoration: none;
		color: #4a4a4a;
	}
	td{
		text-align:left;
		padding-left:5px;
	}
	button{
		outline:none;
	}
		th{
		background-color:#F0F0F0;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<section>
		<div class="content-writer" style="text-align: center; margin: 0 auto; "width="80%">
			<div class="header-text">FAQ</div>
            <br>
            <br>
			<form action="/insertFaq" method="post">
			<table class="content-table">
				<tr height="30px">
					<th width="10%">제목</th>
					<td width="80%"><input type="text" name="faqTitle" >
					</td>
				</tr>

				<tr>
				<th width="10%">내용</th>
					<td><textarea name="faqContent" rows="3" col="40" id="faqContent"></textarea>
				</tr>
	
			</table>
			<br><br>
			<div class="button">
				<button type="submit" class="content-btn" onclick="submitContents(this)">등록</button>
				<a href="javascript:history.go(-1)" class="content-btn">취소</a>
			
			</div>
			
			</form>
			<br><br><br>
		</div>
	</section>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
					<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "faqContent",
				sSkinURI : "/nse_files/SmartEditor2Skin2.html",
				fCreator : "createSEditor2"
			});
			function submitContents(elClickedObj) {
				oEditors.getById["faqContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다. 
				// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

				try {
					elClickedObj.form.submit();
				} catch (e) {
				}
			}
		</script>
</body>
</html>