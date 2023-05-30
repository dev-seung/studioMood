<%@page import="faq.model.vo.Faq"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Faq> list = (ArrayList<Faq>) request.getAttribute("list");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
            border-bottom: 4px solid #FBB1B5;
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
        }
/* 		.content-tr:hover{
			background-color:#fbf0f0;
			color: #4a4a4a;
		} */
		
        .write-btn {
        display:inline-block;
            width: 80px;
            height: 40px;
            font-weight: bold;
            font-size: 15px;
            text-align: center;
            background-color: #dfd3d3;
            border: 2px solid #dfd3d3;
            border-radius: 5px;
            margin-bottom: 10px;
            list-style: none;
            line-height:40px;
            color: #4a4a4a;
            
        }
          .write-btn:hover{
        	color: #4a4a4a;
             text-decoration: none;
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
	.question:hover{
		 background-color:#fbf0f0;
			color: #4a4a4a;
	}
	.faq{
		width:100%;
		height:100%;
		display:block;
	}
		.question>li{
		float:left;
		list-style:none;
		
	}
	.question{
		width:80%;
		height:50px;
		line-height:50px;
		padding:0;
		postion:absolute;
		overflow:hidden;
	}
	.question>li:first-child{
		width:20%;
	}
	.li-second{
		width:70%;
		font-size:14px;
	}
	.li-last{
		width:10%;
	}
	.answer>li{
		float:left;
		list-style:none;
		
	}
	.answer{
		width:80%;
		padding:0;
		postion:absolute;
		overflow:hidden;
		background-color:#F0F0F0;
	}
	.answer>li:first-child{
		width:20%;
		padding-top:10px;
	}
	
	.answer>li:last-child{
		width:70%;
		font-size:14px;
		padding:10px;
	}
	hr{
		width:80%;
	}
			a{
		 text-decoration: none;
		color:black;
	}
	.question a:hover{
		 text-decoration: none;
		color:#4a4a4a;
	}
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<section>
		            <div class="content" style="text-align: center; margin: 0 auto;">
            <div class="header-text">FAQ</div>
            <br>
            <br>
            <br>
            
        <%
			if (m != null && m.getMemberLevel() == 0) {
		%> 
		<div class="write">
			<a href="/faqWriteFrm" class="write-btn">글쓰기</a>
		</div>
		<%
			}
		%>
<!--  <div class="write">
       <input type="submit" value="글쓰기" class="write-btn"></div> -->
       
            <table class="table-title">

                <tr>
                    <th width="20%">No.</th>
               <th width="70%">제목</th>
             <th width="10%"></th>
               
                </tr>
                  </table>
            <!--     <table class="table-content"> -->
            <div class="faq">
                <%
				for (Faq f : list) {
			%>
			<%-- <tr class="content-tr" height="30px">
				<td width="20%"><%=f.getfNum()%></td>
				<td width="70%"><a href="#"><%=f.getFaqTitle()%></a></td>
				<td width="10%">∨</td>

			</tr> --%>
<%-- 			<tr class="answer-tr">
				<td width="20%">A</td>
				<td width="70%"><div class="answer"><%=f.getFaqContent() %></div></td>
			</tr> --%>
			<!-- <tr colspan="3"> -->
			
			<ul class="question">
				<li><b><%=f.getfNum()%></b></li>
				<li class="li-second"><a href="#"><%=f.getFaqTitle()%></a></li>
				        <%
			if (m != null && m.getMemberLevel() == 0) {
		%> 
				<li  class="li-last"><a href="/faqDelete?faqNo=<%=f.getFaqNo() %>">삭제</a></li>
						<%
			}
		%>
			</ul>
			
			
			
			<ul class="answer">
				<li><b>A</b></li>
				<li><%=f.getFaqContentBr() %></li>
			</ul>
			<!-- </tr> -->
			<hr>
			<%
				}
			%>
			</div>
<!-- 		</table> -->
		<br>

                </div>
               
	</section>
	 <br><br><br>
	<script>
	var count = 0;
		$(function() {
			
			$(".answer").slideToggle(0);
			$(".question").click(function() {
				 var idx=$(".question").index(this);
				 var length=$(".question").length;
				if(count>0){
					$(".answer").slideUp(0);
					$(".answer").eq(idx).slideToggle(500);
	
					
				}else{
					
					 $(".answer").eq(idx).slideToggle(500);
				}
				
				count+=1;
				
				 
			});
		});
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>