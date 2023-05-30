<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
	String pageNavi = (String) request.getAttribute("pageNavi");
	
	String keyword = (String)request.getAttribute("keyword");
	if(keyword == null){
		keyword = "";
	}
	
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yy/MM/dd");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>

        .content {
            width: 100%;

        }

        .content * {
            margin: 0 auto;
        }

        .header-text {
            margin-top: 50px;
            width: 150px;
            text-align: center;
            font-weight: bold;
            font-size: 30px;
            border-bottom: 4px solid #f1d1d1;
        }

        .table-title {
            width: 80%;
	       border: none;
            border-top: 4px solid #b8b0b0;
            
            border-bottom: 4px solid #b8b0b0;
        } 
        tr {
    border-top: 1px solid #dfd3d3;
    border-bottom: 1px solid #dfd3d3;
  }
          tr:first-child {
    border-top: none;
  }
            tr:last-child {
    border-bottom: none;
  }
        .table-content{
        	 width: 80%;
        	 border: none;
        	 border-collapse: collapse;
        	 border-bottom: 4px solid #b8b0b0;
        }
		.content-tr:hover{
			background-color:#fbf0f0;
			color: #4a4a4a;
		}
		
        .write-btn {
        display:inline-block;
            width: 80px;
            height: 40px;
            font-weight: bold;
            font-size: 15px;
            text-align: center;
            background-color: #f1d1d1;
            border: 2px solid #f1d1d1;
            border-radius: 5px;
            margin-bottom: 10px;
            list-style: none;
            line-height:40px;
            color: #4a4a4a;
            
        }

        .write {
            width: 80%;
            text-align: right;
        }

        .post {
            width: 80%;
            text-align: center;	
            align-item: baseline;
        }
/*         .post input{
        	display:inline-block;
        } */

        .search-text {
            width: 250px;
            height: 40px;
            border-radius: 5px;
            border: 2px solid #b8b0b0;
            vertical-align:middle;
            outline:none;
        }
        

        .btn-post {
            width: 100px;
            height: 40px;
            font-weight: bold;
            font-size: 17px;
            background-color: #dfd3d3;
            border: 2px solid #dfd3d3;
            border-radius: 5px;
            color: #4a4a4a;
            vertical-align:middle;
        }
        .btn-post:focus{
        	
             outline:none;
        }

        #pageNavi>span{
        	color: #b8b0b0;
        	font-size:18px;
        }
#pageNavi>* {
	margin: 10px;
	font-size:18px;
}
	#pageNavi2{
		display:none;
	}
	a{
		 text-decoration: none;
		color:black;
	}
	.content a:hover{
		 text-decoration: none;
		color:#4a4a4a;
	}
	        .pagination>li>a{
        color:black;
        }
        .pagination>li>.selectPage{
        color:#f1d1d1;
        }
        
        img{
        	line-height:30px;
        }
    </style>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

        <section>
            <div class="content" style="text-align: center; margin: 0 auto;">
            <div class="header-text">공지사항</div>
            <br>
            <br>
            <br>
            
        <%
			if (m != null && m.getMemberLevel() == 0) {
		%> 
		<div class="write">
			<a href="/noticeWriteFrm" class="write-btn">글쓰기</a>
		</div>
		<%
			}
		%>
<!--  <div class="write">
       <input type="submit" value="글쓰기" class="write-btn"></div> -->
       
            <table class="table-title">

                <tr>
                    <th width="10%">No.</th>
               <th width="50%">제목</th>
               <th width="20%;">이름</th>
               <th width="20%;">날짜</th>
             
               
                </tr>
                  </table>
                <table class="table-content">
                <%
				for (Notice n : list) {
			%>
			<tr class="content-tr" height="30px">
				<td width="10%"><%=n.getrNum()%></td>
				
				<%
					if(n.getNoticeDate().equals(sf.format(nowTime))) {				
				%>
						<td width="50%"><a href="/noticeView?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a><img src="/upload/notice/newicon.png" width="20px" height="20px"></td>
				<%
					}else{
				%>
						<td width="50%"><a href="/noticeView?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
				<%
					}
				%>
				<td width="20%"><%=n.getNoticeWriter()%></td>
				<td width="20%"><%=n.getNoticeDate()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
		<div id="pageNavi" class="pagination justify-content-center"><ul class='pagination'><%=pageNavi %></ul></div>
		 <br><br>
            <div class="post">
                <form action="/searchKeyword">
          			<input type="hidden" name="reqPage" value="1">
                    <input type="text" name="keyword" value="<%=keyword %>" placeholder="제목을 입력해주세요." class="search-text">
                    <button type="submit" class="btn-post">검색</button>
                    
                </form>
            </div>
            
                </div>
        </section>
        <br><br><br>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
/* 		$(".btn-post").click(function() {
			$("#pageNavi").css('display', 'none');
			
		}); */
	
</script>

</html>
