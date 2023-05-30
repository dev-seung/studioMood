<%@page import="qna.model.vo.Qna"%>
<%@page import="oracle.net.aso.q"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Qna q = (Qna)request.getAttribute("q");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
   src="/nse_files/js/HuskyEZCreator.js"
   charset="utf-8"></script>
  <style>
     .qna-write{
            width: 80%;
            margin: 0 auto;
            
        }
         .qna-write>form>table{
        width:100%;
        }
        .btn-post{
        margin-top:30px;
            width: 100px;
            height: 50px;
            font-weight: bold;
            font-size: 18px;
            background-color: #dfd3d3;
            color:#4a4a4a;
            border:none;
            border-radius: 5px;
        }
               .btn-a{
       		display:inline-block;
       		line-height:50px;
 			width: 100px;
            height: 50px;
            font-weight: bold;
            font-size: 18px;
            background-color: #dfd3d3;
            color:#4a4a4a;
            border:none;
            outline:none;
            border-radius: 5px;
       }
        .updateTable>tbody>tr>td>input{
            border: none;
        }
        .updateTable>tr>td>input{
            border: none;
        }
        .updateTable>tbody>tr{
            border: 1px solid #b8b0b0;
            resize: none;
            outline: none;
            height: 40px;
            font-size:17px;
        }
        .updateTable>tbody>tr>td{
         border: 1px solid #b8b0b0;
        }
         .updateTable>tbody>tr>th{
          text-align:center;
          background-color:#F0F0F0;}
         .updateTable>tbody>tr>td>textarea{
           border:none;
            resize : none;
            outline: none;
        }
        .qna-write>form>table{
             border-spacing: 0;
             margin-top:50px;
        }
      
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
    	<section>
		<div class="qna-write">
			<form action="/qnaUpdate" method="post">
			<input type="hidden" name="qnaNo" value="<%=q.getQnaNo()%>">
				<table class="updateTable">
									<tr style="border:none;">
				<td colspan = "2" style="text-align:right; border:none;">
				
				    <label><input type="radio" name="open" value="0" checked> 공개</label>
      				<label><input type="radio" name="open" value="1"> 비공개</label>
      				<br>
				</td>
				</tr>
					<tr>
						<th width="10%">제목</th>
                        <td><input type="text" name="qTitle" style="width: 80%; outline: none;" value="<%=q.getqTitle() %>"></td>
					</tr>
				
					<tr>
						<th>작성자</th>
						<td><%=q.getqWriter() %></td>
					</tr>
					<tr>
					<th>내용</th>
                  		<td colspan="2"><textarea name="qContent" style="width: 100%; height: 500px; box-sizing: border-box;" id="qContent"><%=q.getqContent() %></textarea></td>
               		</tr>
               		
					<tr style="text-align:center; border:none;">
						<td colspan = "2" style="border:none;">
							<button type="submit" class="btn-post" style="outline:none;" onclick="submitContents(this)">수정</button>
							<a href="javascript:history.go(-1)" class="btn-post btn-a">취소</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<br>
	</section>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		<script type="text/javascript">
         var oEditors = [];
         nhn.husky.EZCreator.createInIFrame({
            oAppRef : oEditors,
            elPlaceHolder : "qContent",
            sSkinURI : "/nse_files/SmartEditor2Skin.html",
            fCreator : "createSEditor2"
         });
         function submitContents(elClickedObj) {
            oEditors.getById["qContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다. 
            // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

            try {
               elClickedObj.form.submit();
            } catch (e) {
            }
         }
      </script>
</body>
</html>