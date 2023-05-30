<%@page import="java.util.ArrayList"%>
<%@page import="notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	Notice n = (Notice) request.getAttribute("n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <style>
         .postView{
            width: 80%;
            margin: 0 auto;

        }
      .btn-post{
          margin-top: 30px;
          margin-bottom: 30px;
            width: 100px;
            height: 38px;
            font-weight: bold;
            font-size: 17px;
            background-color: white;
            border-radius: 5px;
        }
/*         tr{
               border-top: 1px solid #dfd3d3;
    border-bottom: 1px solid #dfd3d3;
        } */

        .content-table{
             width:100%;
             border: 1px solid lightgray;
             border-collapse: collapse;
        }


            .postView>table tr{
                    border-top: 1px solid #dfd3d3;
    border-bottom: 1px solid #dfd3d3;
            }  

            .inputComment{
                 width: 100%;
            margin: 0 auto;
            }
            .inputComment>form>ul{
                padding: 0;
                overflow: hidden;
            }
            .inputComment>form>ul>li{
            text-decoration: none;
            list-style-type: none;
            float: left;
            }
            .inputComment>form>ul>li:nth-child(2){
                width: 20%;
                margin: 0 auto;
                line-height: 100px;
}
             .postCommenttext{
                 outline: none;
            }

            .btn-postView{
                width: 100px;
                height: 60px;
                font-size: 20px;
                color: white;
                border: none;
                background-color: rgb(252, 157, 154);
            }
            .content{
            	
            }
         .content-btn {
         display:block;
            width: 60px;
            height: 30px;
            font-size: 15px;
            text-align: center;
            background:none;
            border: none;

            list-style: none;
            color: #4a4a4a;
             text-decoration: none;
             line-height:30px;
             float:right;
        }
        
         .content-btn:hover{
        	 color: #4a4a4a;
             text-decoration: none;
        }
        .back {
            width: 100%;
            height:30px;
            text-align: right;
            
        }
		.modify{
			
			text-align: center;
			align-item: baseline;
		}
		.modify-btn {
		display:inline-block;
            width: 80px;
            height: 40px;
            line-height:40px;
            font-weight: bold; 
            font-size: 15px;
            text-align: center;
            background-color: #dfd3d3;
            border: 2px solid #dfd3d3;
            border-radius: 5px;
            margin-bottom: 10px;
            list-style: none;
            color: #4a4a4a;
            margin:5px;
        }
          .content-btn>a:hover{
        	 color: #4a4a4a;
             text-decoration: none;
        }
        .modify-btn:hover{
	 color: #4a4a4a;
             text-decoration: none;
        }
        
        th{
        	padding-left:10px;
        }
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<section>
        <div class="postView">
        <br><br>
        <div class="back">
        <button type="button" class="content-btn"><a href="/noticeList?reqPage=1">목록</a></button>
        </div>
        
            <table class="content-table">
                <tr style="border-bottom: 2px solid #FBB1B5;"  height="30px">
                	 <th width="20%">  제목</th>
				<td width="80%" style="font-size: 16px; font-weight: bold;"><%=n.getNoticeTitle() %></td>
<%--                     <th colspan="2" style="text-align: left; font-size: 20px; font-weight: bold;border-bottom: 2px solid #FBB1B5;">
                    <%=n.getNoticeTitle()%>
                    </th> --%>
                </tr>
                <tr height="30px">
                   <th width="20%">  작성자</th>
				<td width="80%"><%=n.getNoticeWriter()%></td>
                </tr>

                <tr height="30px">
                    <th width="20%">  작성날짜</th>
				<td width="80%"><%=n.getNoticeDate() %></td>
                </tr>
                <tr>
                	<td colspan="2" style="padding-left: 10px;padding-right: 10px; height:400px; vertical-align:top;">
                	<%=n.getNoticeContentBr() %>
                	</td>
                </tr>
                	
		
            </table>
           <br><br>
<%if (m != null && m.getMemberId().equals(n.getNoticeWriter())) {%> 
	
				<div class="modify">
				
					<a href="/noticeUpdateFrm?noticeNo=<%=n.getNoticeNo() %>" class="modify-btn">수정</a>
					<a href="/noticeDelete?noticeNo=<%=n.getNoticeNo() %>" class="modify-btn">삭제</a>
	</div>
					<%} %>
<br><br><br>

        </div>



    </section>
	
	
	<%-- <section>
	<div class="table-weapper" style="width: 80%; margin: 0 auto;">
		<table class="table table-bordered">
			<tr>
				<th colspan="2"><%=n.getNoticeTitle()%></th>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=n.getNoticeWriter()%></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><%=n.getNoticeContentBr() %></td>
			</tr>
			<tr style="text-align: center;">
				<th colspan="2">
					<%if (m != null && m.getMemberId().equals(n.getNoticeWriter())) {%> 
					<a href="/noticeUpdateFrm?noticeNo=<%=n.getNoticeNo() %>" class="btn btn-primary btn-sm">수정하기</a> 
					<a href="/noticeDelete?noticeNo=<%=n.getNoticeNo() %>" class="btn btn-primary btn-sm">삭제하기</a> 
					<%} %>
					<a href="javascript:history.go(-1)" class="btn  btn-primary btn-sm">목록으로</a>
				</th>
			</tr>
		</table>


	</div>
	</section> --%>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>

		$(".recShow").click(function() {
			$(this).hide();
			var idx = $(".recShow").index(this);
			$(".recCancel").eq(idx).parents("div").css("display","block");
		});
		$(".recCancel").click(function() {
			var idx=$(".recCancel").index(this);
			$(this).parents(".re").css("display","none");
			$(".recShow").eq(idx).show();
		});
		
		function modifyComment(obj, commentNo, noticeNo){
			$(obj).parent().prev().show();			//textarea를 보여주는 코드
			$(obj).parent().prev().prev().hide();	//p태그를 숨기는 코드
			//수정버튼 -> 수정완료
			$(obj).html('수정완료');
			$(obj).attr('onclick','modifyComplete(this,"'+commentNo+'","'+noticeNo+'")');
			//삭제버튼 -> 수정취소
			$(obj).next().html('취소');
			$(obj).next().attr('onclick','modifyCancel(this,"'+commentNo+'","'+noticeNo+'")');
			$(obj).next().next().hide();
		}
		function modifyCancel(obj,commentNo,noticeNo){
			$(obj).parent().prev().hide();			//textarea를 숨기는 코드
			$(obj).parent().prev().prev().show();	//p태그를 보여주느는 코드
			//수정완려 -> 수정
			$(obj).prev().html('수정');
			$(obj).prev().attr('onclick','modifyComment(this,"'+commentNo+'","'+noticeNo+'")');
			//최소 -> 삭제
			$(obj).html('삭제');
			$(obj).attr('onclick','deleteComment(this,"'+commentNo+'","'+noticeNo+'")');
			$(obj).next().show();
		}
		function modifyComplete(obj,commentNo, noticeNo){
			var form = $("<form action='/noticeCommentUpdate' method='post'></form>");
			form.append($("<input type='text' name='noticeCommentNo' value='"+commentNo+"'>"));
			form.append($("<input type='text' name='noticeNo' value='"+noticeNo+"'>"));
			form.append($(obj).parent().prev());
			$("body").append	(form);
			form.submit();
		}

	</script>
</body>
</html>