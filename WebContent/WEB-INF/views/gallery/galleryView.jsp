<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int totalCount = (Integer) request.getAttribute("totalCount");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
  font-family: Verdana, sans-serif;
  margin: 0;
}

* {
  box-sizing: border-box;
  
}
h2{
font-family: 'S-CoreDream-5Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
.row{
	width : 80vw;
}
.row > .column {
  margin-top : 15px;
  padding: 0 8px;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

.column {
  float: left;
  width: 25%;

}

/* The Modal (background) */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: black;
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  width: 25%;
  max-width: 25%;

}

/* The Close Button */
.close {
  color: white;
  position: absolute;
  top: 10px;
  right: 25px;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #999;
  text-decoration: none;
  cursor: pointer;
}

.mySlides {
  display: none;
}

.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

img {
  margin-bottom: -4px;
}

.caption-container {
  text-align: center;
  background-color: black;
  padding: 2px 16px;
  color: white;
}

.demo {

  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

img.hover-shadow {
  transition: 0.3s;
}

.hover-shadow:hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- 	<section>
	<div class="photo-container"
		style="width: 80%; margin: 0 auto; text-align: center;">
		<h1>사진게시판</h1>
		<div id="photo-wrapper" style="padding: 100px;"></div>
		<div id="photo-btn-container">
			<button class="btn btn-outline-info" currentCount="0" value=""
				totalCount="<%=totalCount%>" id="more-btn">더보기</button>
			
			<a class="btn btn-outline-info" href="/galleryWriteFrm">글쓰기</a>
			
		</div>
	</div>
	</section> --%>
	
	
<br>
<h2 style="text-align:center">GALLERY</h2>
<br>
<br>
<hr class="underline" color="gray" width="75%">

<div class="row" style ="margin: 0 auto;">
  <!--  <div class="column">
    <img src="/upload/gallery/studioIntroduce3.jpg" style="width:100%" onclick="openModal();currentSlide(1)" class="hover-shadow cursor">
  </div>
  <div class="column">
    <img src="/upload/gallery/studioIntroduce4.jpg" style="width:100%" onclick="openModal();currentSlide(2)" class="hover-shadow cursor">
  </div>
  <div class="column">
    <img src="/upload/gallery/studioIntroduce5.jpg" style="width:100%" onclick="openModal();currentSlide(3)" class="hover-shadow cursor">
  </div>
  <div class="column">
    <img src="/upload/gallery/studioIntroduce6.jpg" style="width:100%" onclick="openModal();currentSlide(4)" class="hover-shadow cursor">
  </div> -->
 
</div>

<div id="myModal" class="modal">
  <span class="close cursor" onclick="closeModal()">&times;</span>
  <div class="modal-content">

      <!-- <div class="mySlides">
      <div class="numbertext"></div>
      <img src="/upload/gallery/studioIntroduce2.jpg" style="width:100%">
    </div>

    <div class="mySlides">
      <div class="numbertext"></div>
      <img src="/upload/gallery/studioIntroduce3.jpg" style="width:100%">
    </div>

    <div class="mySlides">
      <div class="numbertext"></div>
      <img src="/upload/gallery/studioIntroduce4.jpg" style="width:100%">
    </div>
    
    <div class="mySlides">
      <div class="numbertext"></div>
      <img src="/upload/gallery/studioIntroduce5.jpg" style="width:100%">
    </div>
     <div class="mySlides">
      <div class="numbertext"></div>
      <img src="/upload/gallery/studioIntroduce6.jpg" style="width:100%">
    </div>
     <div class="mySlides">
      <div class="numbertext"></div>
      <img src="/upload/gallery/studioIntroduce.jpg" style="width:100%">
    </div> -->
    
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>

   
  </div>
</div>
<div class="btn-wrppaer" style="margin:20px auto; width:80%; height: 50px; text-align: center;">
<button class="btn btn-outline-danger" currentCount="0" value=""
				totalCount="<%=totalCount%>" id="more-btn">더보기</button>
			<%if(m != null){ %>
				<%if (m.getMemberLevel()==0){ %>
			<a class="btn btn-outline-danger" href="/galleryWriteFrm">글쓰기</a>
				<%} %>
			<%} %>
			</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
<script>
	$(function() {
		galleryMore(1);
		
	});
	$("#more-btn").click(function() {
		galleryMore($(this).val());
	});
	function galleryMore(start) {
		$.ajax({
					url : "/galleryMore",
					data : {
						start : start
					},
					type : "post",
					dataType : "json",
					success : function(data) {
						var html = "";
						var html2 = "";
						var html3 = "";
						for ( var i in data) {
							var p = data[i]; //리스트에서 꺼내온 포토객체
							
							html += " <div class = 'column' >";
							html += " <img src='/upload/gallery/" + p.gFilePath + "' style='width:100%' onclick='openModal();currentSlide("+p.rNum+")' class='hover-shadow cursor'></div>";
							
							html2 += '<div class="mySlides">';
							html2 += " <img src='/upload/gallery/" + p.gFilePath +"' style='width:100%; overflow:hidden;'></div>";
							
							/* html3 += '<div class="column">';
							html3 += "<img class='demo cursor' src='/upload/gallery/" + p.gFilePath + "'style='width:100%' onclick='currentSlide(1)' alt='Nature and sunrise'>";
							 html += "<p class='caption'>" + p.gContent
									+ "</p></div>";  */
						}
						$(".row").append(html);
						$(".modal-content").append(html2);
						//$(".row").append(html3);  
	/* 					 $(".photo").click(function(){
							 
							 var idx=$(this).index();
							 $("#photo-wrapper").attr('display','none');
							 html+="<div class='modal-wrap' style='position:absolute; top:0px; left:0px; width:100vw; height:100vh; background-color:rgba(0,0,0,0.5); display:flex;'>";
							 html+="<img class='modal src='#' width='40vw; height:40hw;'></div>";
							 $(".photo-container").append(html);
							 alert('dd');
						});  */
						//추가완료 후 더보기 버튼의 value값 조정(start+5)
						$("#more-btn").val(Number(start) + 4);
						//현재 몇번까지 가지고왔는지 체크
						var currCount = $("#more-btn").attr("currentCount");
						$("#more-btn").attr("currentCount",
								Number(currCount) + data.length);
						currCount = $("#more-btn").attr("currentCount");
						var totalCount = $("#more-btn").attr("totalCount");
						if (currCount == totalCount) {
							$("#more-btn").attr("disable", true);
							$("#more-btn").css("cursor", "not-allowed");
						}
					}
				});
	}
	function openModal() {
		  document.getElementById("myModal").style.display = "block";
		}

		function closeModal() {
		  document.getElementById("myModal").style.display = "none";
		}

		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}

		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}

		function showSlides(n) {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("demo");
		  var captionText = document.getElementById("caption");
		  if (n > slides.length) {slideIndex = 1}
		  if (n < 1) {slideIndex = slides.length}
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";
		  }
		  for (i = 0; i < dots.length; i++) {
		      dots[i].className = dots[i].className.replace(" active", "");
		  }
		  slides[slideIndex-1].style.display = "block";
		  dots[slideIndex-1].className += " active";
		  captionText.innerHTML = dots[slideIndex-1].alt;
		}
</script>
<script>

</script>
</html>