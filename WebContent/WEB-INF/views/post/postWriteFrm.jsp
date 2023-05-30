<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
   src="/nse_files/js/HuskyEZCreator.js"
   charset="utf-8"></script>
    <style>
     .post-write{
            width: 80%;
            margin: 0 auto;
            
        }
         .post-write>form>table{
        width:100%;
        }
      .btn-post{
          margin-top: 30px;
          margin-bottom: 30px;
            width: 100px;
            height: 50px;
            font-weight: bold;
            font-size: 18px;
           background-color: #dfd3d3;
            color:#4a4a4a;
            border: none;
            border-radius: 5px;
        }
        .post-write>form>table>tbody>tr>td>input{
            border: none;
        }
      
        .post-write>form>table>tbody>tr{
            border: 1px solid #b8b0b0;
            resize: none;
            outline: none;
            height: 40px;
            font-size:17px;
        }
       .post-write>form>table>tbody>tr>th{
        background-color:#F0F0F0;
        text-align:center
        }
        
        .post-write>form>table>tbody>tr>td{
         border: 1px solid #b8b0b0;
        }
        .post-write>form>table>tbody>tr>td>textarea{
           border:none;
            resize : none;
            outline: none;
        }
        .post-write>form>table{
             border-spacing: 0;
             margin-top:50px;
        }
       
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
    	<section>
		<div class="post-write">
			<form action="/insertPost" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th width="10%">제목</th>
                        <td><input type="text" name="postTitle" style="width: 100%; outline: none;font-size:20px;">
                        </td>
					</tr>
						<tr>
						<th>작성자</th>
						<td><%=m.getMemberId() %>
						<input type="hidden" name="postWriter" value="<%=m.getMemberId() %>">
						</td>
					</tr>
						<tr>
						<th>파일첨부</th>
						<td><input type="file" name="filename"></td>
					</tr>
					<tr> 
					<th>내용</th>
						<td><textarea name="postContent" style="width: 100%; height: 500px; box-sizing: border-box;" id="postContent"></textarea></td>
					</tr>
					<tr style="text-align:center; border:none;" >
						<td colspan = "2" style="border:none;">
							<button type="submit" class="btn-post" style="outline:none;" onclick="submitContents(this)">등록</button>
							<button class="btn-post" style="outline:none;">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script type="text/javascript">
         var oEditors = [];
         nhn.husky.EZCreator.createInIFrame({
            oAppRef : oEditors,
            elPlaceHolder : "postContent",
            sSkinURI : "/nse_files/SmartEditor2Skin.html",
            fCreator : "createSEditor2"
         });
         function submitContents(elClickedObj) {
            oEditors.getById["postContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다. 
            // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

            try {
               elClickedObj.form.submit();
            } catch (e) {
            }
         }
      </script>
	<script>
	$(".post-cancle").click(function(){
		confirm("작성하시던 글은 삭제됩니다. 등록 취소하시겠습니까?");
	});
	
	
	</script>
</body>
</html>