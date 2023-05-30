<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="qna.model.vo.Qna"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%
    ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
    String pageNavi = (String)request.getAttribute("pageNavi");
    String keyword = (String)request.getAttribute("keyword");
    if(keyword == null){
    	keyword="";
    }
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <style>
        .content{
            width: 80%;
            margin : 0 auto;
            
        }
        .content *{
            margin: 0 auto;
        }
        .pink{
            margin-top: 50px;
            width: 90px;
            text-align: center;
            font-weight: bold;
            font-size: 30px;   
            border-bottom: 4px solid #f1d1d1;
        }
        .table-title{
            width: 100%;
        }
         .table-content>tbody>tr>td{
            border-top: 1px solid #b8b0b0;
            height : 30px;
        }
        
        .table-content>tbody>tr>td>a:hover{
		color:#4a4a4a;
		}
        .table-content{
        width:100%;
        border-bottom: 4px solid #b8b0b0;
        }
        .table-content>tbody>tr>td{
         text-align: center;
        }
       .table-content>tbody>tr>td>a{
      	 	width:100%;
      	 	text-decoration: none;
            color: black;
            display:block;
       }
        .table-content>tbody>tr:hover{
        background-color:#fbf0f0;;
        }
     
        .table-title>tbody>tr>th{
 	       height : 35px;
 	       text-align: center;
             border-top: 4px solid #b8b0b0;
            border-bottom: 3px solid #b8b0b0;
        }
       .write>a{
            text-decoration: none;
            display: inline-block;
            width: 80px;
            height: 40px;
            line-height: 40px;
            font-size: 17px;
            text-align: center;
            background-color: #f1d1d1;
            color:#4a4a4a;
            border-radius: 5px;
        }
        .write{
        margin-top:-20px;
            width: 100%;
            text-align: right;
            margin-bottom: 10px;
        }
        .qna{
            width: 80%;
            text-align: center;
        }
        .search-text{
            width: 250px;
            height: 30px;
        }
        .btn-post{
            width: 100px;
            height: 35px;
            font-weight: bold;
            font-size: 17px;
            background-color: #f1d1d1;
            color:#4a4a4a;
            border:none;
            outline:none;
            border-radius: 5px;
        }
        #pageNavi{
            text-align: center;
            margin: 50px;
        }
        .qna>form>select{
        width : 100px;
        height : 30px;
        }
        .closed{
        font-size : 15px;
        }
        .pagination>li>a{
        color:black;
        }
        .pagination>li>.selectPage{
        color:#f1d1d1;
        }
         .write-btn:hover{
        color:black;
         text-decoration: none;
        }
        
@media (min-width: 768px) {
    #kakao-talk-channel-chat-button {
    position: fixed;
    z-index: 999;
    right: 30px; /* 화면 오른쪽으로부터의 거리, 숫자만 변경 */
    bottom: 30px; /* 화면 아래쪽으로부터의 거리, 숫자만 변경 */
    }
}

@media (max-width:767px) {
    #kakao-talk-channel-chat-button {
    position: fixed;
    z-index: 999;
    right: 15px; /* 화면 오른쪽으로부터의 거리, 숫자만 변경 */
    bottom: 30px; /* 화면 아래쪽으로부터의 거리, 숫자만 변경 */
    }
}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
  <div class="content">
   <section>
       <div class="pink">QnA</div>
       <br>
       <br>
       
       <%if(m!=null && m.getMemberLevel()==1) {%>
       <div class="write">
       <a href="/qnaWriterFrm" class="write-btn">글쓰기</a>
       </div>
       <%} %>
       <table class="table-title">
       
           <tr>
               <th width="10%">No.</th>
               <th width="50%">제목</th>
               <th width="20%;">이름</th>
               <th width="20%;">날짜</th>
           </tr>
          
</table>
 <table class="table-content">
 			<%for(Qna q : list) {%>
           		<%if(q.getOpenChk().equals("0")) {%>
           			<tr>
	               		<td width="10%"><%=q.getqNum() %></td>
	               			<%
               if(q.getqDate().equals(sf.format(nowTime))) {            
            %>
	              		<td class="closed" width="50%"><a href="/qnaView?qnaNo=<%=q.getQnaNo() %>"><%=q.getqTitle() %><img src="img/new.png" width="20px" height="20px"></a></td>
	              		<%}else{ %>
	              		<td class="closed" width="50%"><a href="/qnaView?qnaNo=<%=q.getQnaNo() %>"><%=q.getqTitle() %></a></td>
	              		<%} %>
	               		<td width="20%"><%=q.getqWriter() %></td>
	               		<td width="20%"><%=q.getqDate() %></td>
	           		</tr>
	          <%}else {%>
	          		 <%if(m != null && (m.getMemberLevel() == 0 || q.getqWriter().equals(m.getMemberId()))) {%>
	          			 <tr>
	               			<td width="10%"><%=q.getqNum() %></td>
	               			<%
               if(q.getqDate().equals(sf.format(nowTime))) {            
            %>
	              			<td width="50%"><a href="/qnaView?qnaNo=<%=q.getQnaNo() %>"><%=q.getqTitle() %> <img src="img/closed.png" width="16px"><img src="img/new.png" width="20px" height="20px"></a>
	              			</td>
	              			<%}else{ %>
	              			<td width="50%"><a href="/qnaView?qnaNo=<%=q.getQnaNo() %>"><%=q.getqTitle() %> <img src="img/closed.png" width="16px"></a>
	              			<%} %>
	               			<td width="20%"><%=q.getqWriter() %></td>
	               			<td width="20%"><%=q.getqDate() %></td>
	           			</tr>
	          		<%}else {%>
	          			 <tr>
	               			<td width="10%"><%=q.getqNum() %></td>
	               			<%
               if(q.getqDate().equals(sf.format(nowTime))) {            
            %>
	              			<td class="closed" width="50%"><%=q.getqTitle() %>
	              			<img src="img/closed.png" width="16px"> <img src="img/new.png" width="20px" height="20px"></td>
	              			<%}else{ %>
	              			<td class="closed" width="50%"><%=q.getqTitle() %>
	              			<img src="img/closed.png" width="16px"></td>
	              			<%} %>
	               			<td width="20%"><%=q.getqWriter() %></td>
	               			<td width="20%"><%=q.getqDate() %></td>
	           			</tr>
	          		<%} %>
	          <%} %>
	      
           <%} %>
       </table>
       <div id="pageNavi" class="pagination justify-content-center"><ul class='pagination'><%=pageNavi %></ul></div>
       <div class="qna">
       <form action="/qnaSearchKeyword">
       <input type="hidden" name="reqPage" value="1">
       <select>
       <option value="qTitle" selected>제목</option>
       </select>
       <input type="text" placeholder="검색어를 입력해주세요." name ="keyword" class="search-text" value = "<%=keyword %>" >
       <input type="submit" value="검색" class="btn-post">
       </form>
       </div>
   </section>
    </div>
    <br><br><br>
    <div id="kakao-talk-channel-chat-button"></div>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('d1bb131319eadae26c139431e519d390');
    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
      channelPublicId: '_GExlxnK' // 카카오톡 채널 홈 URL에 명시된 ID
    });
  //]]>
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>



</body>
</html>