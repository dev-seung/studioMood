<%@page import="member.model.vo.Member"%>
<%@page import="post.model.vo.PostComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="post.model.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Post p = (Post)request.getAttribute("p");
    ArrayList<PostComment> list = (ArrayList<PostComment>)request.getAttribute("list");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <style>
        .postView {
            width: 80%;
            margin: 0 auto;
		margin-top:50px;
        }
        .btn-post {
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

        .postView>table {
            border-spacing: 0;
            width:100%;
        }

        .firstth {
            text-align: left;
        }

		.postView>table>tbody>tr>td{
		
		border-top: 1px solid #dfd3d3;
		border-bottom: 1px solid #dfd3d3;
        }
        .postView>table>tbody>tr:nth-child(4)>td{
        border-bottom:none;
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
            margin-top:25px;
        }

        .inputComment>form>ul>li:first-child {
            width: 85%;
        }

        .inputComment>form>ul>li:nth-child(2) {
            width: 15%;
            line-height: 100px;
        }

        .postCommenttext {
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
		.commentList>ul>li a{
		text-decoration: none;
		color:black;
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
		.commentList>ul>li>p:nth-child(2){
		text-align: right;
		}
		.commentList>ul>li:nth-child(2){
		border-bottom:  1px solid #b8b0b0;
		}
		.btn-comment{
		display:inline-block;
		width:35px;
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
        <div class="postView">
            <table>
            <tr>
                    <th colspan="2" style="text-align : right;">
                        <%if(m!=null && m.getMemberId().equals(p.getPostWriter())) {%>
                        <a href="/postUpdateFrm?postNo=<%=p.getPostNo() %>" class="btn-post">수정</a>
                        <a href="/postDelete?postNo=<%=p.getPostNo() %>" class="btn-post">삭제</a>
                        <%} %>
                        <a href="/postList?reqPage=1" class="btn-post">목록</a>
                    </th>
                </tr>

                <tr>
                    <th class="firstth" colspan="2" style="height: 50px; font-size: 30px; font-weight:500;border-top: 3px solid #f1d1d1;"><%=p.getPostTitle() %></th>
                </tr>
                <tr>
                    <td style="height: 30px; font-weight:bold;"><%=p.getPostWriter() %></td>
                    <td>작성일 : <%=p.getPDate() %></td>
                </tr>
                <tr style="border-bottom:1px solid #dfd3d3;">
                    <td style="width: 20%;">첨부파일</td>
					
                    <td>
                    <%if(p.getFilename() != null) {%>
					<img src="/img/file.png" width="16px">
					<a href="javascript:fileDownload('<%=p.getFilename()%>','<%=p.getFilepath()%>')"><%=p.getFilename() %></a>
						
					<%} %>
					</td>
					
                </tr>
               
                 <%if(p.getFilename() != null) {%>
                 <tr>
                <td colspan="2" style="border-bottom:none;">
               	 <div style="width:80%; margin:0 auto;margin-top:10px;text-align:center;">
					<div style='width:600px;margin:0 auto;margin-bottom:10px; margin-top:20px;'>
						<img src="/upload/post/<%=p.getFilepath() %>" style="width:600px;">
					</div>
					</div>
				</td>
				</tr>
				<%} %>
				
				
				<tr>
                    <td colspan="2" style="border-bottom:1px solid #dfd3d3; border-top:none; height:200px;  vertical-align:top;"><%=p.getPostContentBr() %></td>
                </tr>
               
            </table>
            <div class="commentList">
            <%for(PostComment pc : list) {%>
            
            	<ul>
            		<li>
            			<p style="width : 20%; font-weight: bold;"><%=pc.getPostCommentWriter() %></p>
            			<p style="width : 80%; text-align: right;"><%=pc.getPostCommentDate() %></p>
            		</li>
            		<li>
            		<div class="flex">
            		<p style="width : 80%;"><%=pc.getPostCommentContentBr() %></p>
            		<textarea name = "postCommentContent" class="changeComment" style="width: 80%; resize: none;display:none;"><%=pc.getPostCommentContent() %></textarea>
            		<%if(m != null) {%>
	            		<p class="linkBox" style="width:20%; text-align:right;">
	            		<%if(m.getMemberId().equals(pc.getPostCommentWriter())) {%>
	            		<a href="javascript:void(0)" class="btn-comment" onclick="modifyComment(this,'<%=pc.getPostCommentNo()%>','<%=p.getPostNo()%>')">수정</a>
	            		<a href="javascript:void(0)" class="btn-comment" onclick="deleteComment(this,'<%=pc.getPostCommentNo() %>','<%=p.getPostNo() %>')">삭제</a>
            			<%} %>
            			</p>
            		<%} %>
            		
            		</div>
            		</li>
            	</ul>
            <%} %>
            </div>
            <%if(m!=null) {%>
            <div class="inputComment">
                <form action="/insertPostComment" method="post">
                    <ul>
                        <li>
                            <input type="hidden" name="postCommentWriter" value=<%=m.getMemberId() %>>
                            <input type="hidden" name="postRef" value=<%=p.getPostNo() %>>
                            <textarea class="postCommenttext"style="height: 100px;resize: none;"name="postCommentContent"></textarea>                           
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
    function fileDownload(filename,filepath){
    	var url = "/postFileDownload";
		var encFilename = encodeURIComponent(filename);
		var encFilepath = encodeURIComponent(filepath);
    	location.href=url+"?filename="+encFilename+"&filepath="+encFilepath;
    }
    function modifyComment(obj, commentNo, postNo){
		$(obj).parent().parent().css("border","1px solid #b8b0b0");
		$(obj).parent().prev().css("height","100px");
		$(obj).parent().prev().css("outline","none");
    	$(obj).parent().prev().show();	//textarea를 보여주는 코드
		$(obj).parent().prev().prev().hide();	//p태그를 숨기는 코드
		//수정버튼 -> 수정완료
		$(obj).html('수정완료');
		$(obj).attr('onclick', 'modifyComplete(this,"'+commentNo+'","'+postNo+'")')
		$(obj).attr('style','width:65px;')
		//삭제버튼 -> 수정취소
		$(obj).next().html('취소');
		$(obj).next().attr('onclick', 'modifyCancel(this,"'+commentNo+'","'+postNo+'")')
		$(obj).next().next().hide();
    }
    function modifyCancel(obj, commentNo, postNo){
    	$(obj).parent().parent().css("border","none");
    	$(obj).parent().prev().hide();	//textarea를 숨기는 코드
		$(obj).parent().prev().prev().show();	//p태그를 보여주는 코드
		//수정완료 -> 수정
		$(obj).prev().html('수정');
		$(obj).prev().attr('onclick','modifyComment(this,"'+commentNo+'","'+postNo+'")')
		
		//취소 - >삭제
		$(obj).html('삭제');
		$(obj).attr('onclick','modifyComment(this,"'+commentNo+'","'+postNo+'")')
		$(obj).next().show();
    }
    function modifyComplete(obj, commentNo, postNo){
    	var form = $("<form action='/postCommentUpdate' method='post'></form>");
    	form.append($("<input type='text' name='postCommentNo' value='"+commentNo+"'>"));
    	form.append($("<input type='text' name='postNo' value='"+postNo+"'>"));
    	form.append($(obj).parent().prev());
    	$("body").append(form);
    	form.submit();
    }
    function deleteComment(obj, commentNo, postNo){
    	if(confirm("댓글을 삭제하시겠습니까?")){
    		location.href="/postCommentDelete?postCommentNo="+commentNo+"&postNo="+postNo;	
    	}
    }
    </script>
</body>
</html>