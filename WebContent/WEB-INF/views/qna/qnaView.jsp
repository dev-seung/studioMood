<%@page import="qna.model.vo.QnaComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="qna.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
    Qna q = (Qna)request.getAttribute("q");
    ArrayList<QnaComment> list = (ArrayList<QnaComment>)request.getAttribute("list");
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

   <style>
        .qnaView {
            width: 80%;
            margin: 0 auto;
			margin-top:50px;
        }

		.qnaView>table>tbody>tr>th>a{
		 	text-decoration: none;
            display:inline-block;
            line-height : 38px;
            text-align: center;
            margin-top: 30px;
            width: 50px;
            height: 38px;
            font-weight: bold;
            font-size: 17px;
            color : #4a4a4a;
            border: none;
            outline:none;
            border-radius: 5px;
		}

        .qnaView>table {
        width:100%;
            border-spacing: 0;
        }

        .firstth {
            text-align: left;
        }

		.qnaView>table>tbody>tr>td{
		border-top: 1px solid #dfd3d3;
        }
        .qnaView>table>tbody>tr:nth-child(3)>td{
		border-bottom: 1px solid #dfd3d3;
        }
        
        .inputComment {
            height: 150px;
            width: 100%;
            background-color: #f3e1e1;
        }

        .inputComment>form>ul {
            padding: 0;
            overflow: hidden;
        }

        .inputComment>form>ul>li {
            text-decoration: none;
            list-style-type: none;
            float: left;
            text-align: center;
            margin-top: 25px;
        }

        .inputComment>form>ul>li:first-child {
            width: 85%;
        }

        .inputComment>form>ul>li:nth-child(2) {
            width: 15%;
            line-height: 100px;
        }

        .qnaCommenttext {
            outline: none;
            width: 95%;
        }

        .btn-postView {
        	margin-top:10px;
        	line-height : 80px;
            width: 100px;
            height: 80px;
            font-size: 20px;
            color: white;
            border: none;
            background-color: #b8b0b0;
        }
        .commentList{
        border-top : 3px solid #b8b0b0;
        
        }
		.commentList>ul{
		padding : 0;
		margin:0;
		
		}
		.commentList>ul>li{
		text-decoration: none;
		list-style-type: none;
		overflow: hidden;

		}
		.commentList>ul>li>p{
		float: left;
		margin :0;
		height :40px;
		
		}
		.commentList>ul>li a{
		text-decoration: none;
		color:black;
		}
		.commentList>ul>li>p:nth-child(2){
		text-align: right;
		
		}
		.commentList>ul>li:nth-child(2){
		border-bottom:  1px solid #b8b0b0;
		}
		.flex{
			display: flex;
            justify-content: center;
            
		}
		.flex>textarea{
            width: 80%;
            border:none;
		}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <section>
        <div class="qnaView">
  
            <table>
               <tr>
                    <th colspan="2" style="text-align : right;">
                    
                        <%if(m!=null && m.getMemberId().equals(q.getqWriter())) {%>
                        <a href="/qnaUpdateFrm?qnaNo=<%=q.getQnaNo() %>" class="btn-post">수정</a>
                        <a href="/qnaDelete?qnaNo=<%=q.getQnaNo() %>" class="btn-post">삭제</a>
                          
                        <%} %>
                        <a href="/qnaList?reqPage=1" class="btn-post" style="border:none;">목록</a>
                    </th>
                </tr>
                <tr>
                    <th class="firstth" colspan="2" style="width: 1000px; height: 50px; font-weight:500; font-size: 30px; border-top: 3px solid #f1d1d1;"><%=q.getqTitle() %></th>
                </tr>
                <tr>
                    <td style="height: 30px; font-weight:bold;"><%=q.getqWriter()%></td>
                    <td>작성일 : <%=q.getqDate() %></td>
                </tr>
            
                <tr>
                    <td colspan="2" style="height:200px; vertical-align:top;"><%=q.getQContentBr() %></td>
                </tr>

            </table>
              <div class="commentList">
            <%for(QnaComment qc : list) {%>
            	<ul>
            		<li>
            			<p style="width : 20%; font-weight:bold;"><%=qc.getQnaCommentWriter() %></p>
            			<p style="width : 80%; text-align: right;"><%=qc.getQnaCommentDate() %></p>
            		</li>
            		<li>
            			<div class="flex">
            		<p style="width : 80%;"><%=qc.getQnaCommentContentBr() %></p>
            		<textarea name = "qnaCommentContent" class="changeComment" style="width: 80%; resize: none;display:none;"><%=qc.getQnaCommentContent() %></textarea>
            		<%if(m != null) {%>
            		<p class="linkBox" style="width:20%; text-align:right;">
            		<%if(m.getMemberId().equals(qc.getQnaCommentWriter())) {%>
            		<a href="javascript:void(0)" onclick="modifyComment(this,'<%=qc.getQnaCommentNo()%>','<%=q.getQnaNo()%>')">수정</a>
            		<a href="javascript:void(0)" onclick="deleteComment(this,'<%=qc.getQnaCommentNo() %>','<%=q.getQnaNo()%>')">삭제</a>
            		<%} %>
            		</p>
            <%} %>
            		</div>
            
            </li>
            	</ul>
            <%} %>
            </div>
         
            <%if(m!=null && m.getMemberLevel()==0) {%>
             <div class="inputComment">
                <form action="/insertQnaComment" method="post">
                    <ul>
                        <li>
                            <input type="hidden" name="qnaCommentWriter" value=<%=m.getMemberId() %>>
                            <input type="hidden" name="qnaRef" value=<%=q.getQnaNo() %>>
                            <textarea class="qnaCommenttext"style="height: 100px;resize: none;"name="qnaCommentContent"></textarea>                           
                        </li>
                        <li style="text-align: center;">
                            <button type="submit" class="btn-postView" >등록</button>
                        </li>
                    </ul>
                </form>
                
            </div>   
            <%} %>
        </div>
        
    </section>
    <br><br>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script>
	function modifyComment(obj, commentNo, qnaNo){
		$(obj).parent().parent().css("border","1px solid #b8b0b0");
		$(obj).parent().prev().css("outline","none");
		$(obj).parent().prev().css("height","100px");
    	$(obj).parent().prev().show();	//textarea를 보여주는 코드
		$(obj).parent().prev().prev().hide();	//p태그를 숨기는 코드
		//수정버튼 -> 수정완료
		$(obj).html('수정완료');
		$(obj).attr('onclick', 'modifyComplete(this,"'+commentNo+'","'+qnaNo+'")');
		//삭제버튼 -> 수정취소
		$(obj).next().html('취소');
		$(obj).next().attr('onclick', 'modifyCancel(this,"'+commentNo+'","'+qnaNo+'")')
		$(obj).next().next().hide();
    }
	function modifyCancel(obj, commentNo, qnaNo){
		$(obj).parent().parent().css("border","none");
		$(obj).parent().prev().hide();	//textarea를 숨기는 코드
		$(obj).parent().prev().prev().show();	//p태그를 보여주는 코드
		//수정완료 -> 수정
		$(obj).prev().html('수정');
		$(obj).prev().attr('onclick','modifyComment(this,"'+commentNo+'","'+qnaNo+'")')
		//취소 - >삭제
		$(obj).html('삭제');
		$(obj).attr('onclick','modifyComment(this,"'+commentNo+'","'+qnaNo+'")')
		$(obj).next().show();
    }
    function modifyComplete(obj, commentNo, qnaNo){
    	var form = $("<form action='/qnaCommentUpdate' method='post'></form>");
    	form.append($("<input type='text' name='qnaCommentNo' value='"+commentNo+"'>"));
    	form.append($("<input type='text' name='qnaNo' value='"+qnaNo+"'>"));
    	form.append($(obj).parent().prev());
    	$("body").append(form);
    	form.submit();
    }
    function deleteComment(obj, commentNo, qnaNo){
    	if(confirm("댓글을 삭제하시겠습니까?")){
    		location.href="/qnaCommentDelete?qnaCommentNo="+commentNo+"&qnaNo="+qnaNo;	
    	}
    }
	
    
    </script>
</body>
</html>