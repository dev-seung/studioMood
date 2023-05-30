<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="post.model.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
    String pageNavi = (String)request.getAttribute("pageNavi");
    String keyword = (String)request.getAttribute("keyword");
    if(keyword == null){
    	keyword="";
    }
    String type = (String)request.getAttribute("type");
    if(type == null){
    	type = "postWriter";
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
         .table-content>tbody>tr>td{
            border-top: 1px solid #b8b0b0;
            height : 30px;
        }
        .table-title{
            width: 100%;
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
            display:inline-block;
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
         .write>a:hover{
         color:#4a4a4a;
        }
        .post{
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
            margin: 50px;
        }
        .post>form>select{
        width : 100px;
        height : 30px;
        }
  		.pagination>li>a{
        color:black;
        }
        .pagination>li>.selectPage{
        color:#f1d1d1;
        } 
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
  <div class="content">
   <section>
       <div class="pink">후기</div>
       <br>
       <br>
       
       <%if(m!=null && m.getMemberLevel()==1) {%>
       <div class="write">
       <a href="/postWriterFrm" class="write-btn" style="text-decoration: none;" >글쓰기</a>
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
           <%for(Post p : list) {%>
         
          <tr>
               <td width="10%"><%=p.getpNum() %></td>
               	<%
               if(p.getPDate().equals(sf.format(nowTime))) {            
            %>
               <td width="50%"><a href="/postView?postNo=<%=p.getPostNo()%>"><%=p.getPostTitle() %><img src="img/new.png" width="20px" height="20px"></a></td>
               <%}else {%>
                <td width="50%"><a href="/postView?postNo=<%=p.getPostNo()%>"><%=p.getPostTitle() %></a></td>
               <%} %>
               <td width="20%"><%=p.getPostWriter() %></td>
               <td width="20%"><%=p.getPDate() %></td>
           </tr>
           <%} %>
       </table>
       <div id="pageNavi" class="pagination justify-content-center"><ul class='pagination'><%=pageNavi %></ul></div>
       <div class="post">
       <form action="/postSearchKeyword">
       <input type="hidden" name="reqPage" value="1">
       <select name="type">
       <%if(type.equals("postWriter")) {%>
       <option value="postWriter" selected>작성자</option>
       <option value="postTitle">제목</option>
       <%}else if(type.equals("postTitle")) {%>
       <option value="postWriter">작성자</option>
       <option value="postTitle" selected>제목</option>
       <%} %>
       </select>
       <input type="text" placeholder="검색어를 입력해주세요." name ="keyword" class="search-text" value = <%=keyword %> >
       <input type="submit" value="검색" class="btn-post">
       </form>
       </div>
   </section>
    </div>
    <br><br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>