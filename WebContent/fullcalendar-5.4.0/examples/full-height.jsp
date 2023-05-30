<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="reservation.model.vo.Reservation"%>
    <%
    	Reservation r = (Reservation)request.getAttribute("reserveAdmin");
    	if(r!=null){
    		//수정인경우만
    		System.out.println("예약날짜 = "+r.getrDate());
    	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script  src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href='/fullcalendar-5.4.0/lib/main.css' rel='stylesheet' />
<link href='/fullcalendar-5.4.0/lib/resv.css' rel='stylesheet' />
<link rel="shortcut icon" href="#">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src='/fullcalendar-5.4.0/lib/main.js'></script>
<script>
var selConcept = null;
$(document).ready(function(){	
	  $("div").removeClass("fc-daygrid-event-harness");
		$("div").removeClass("fc-daygrid-event-harness-abs");
		$(".fc-event-title-container").parent().parent().parent().remove();
		$(".fc-daygrid-event-dot").parent().remove();
});
  document.addEventListener('DOMContentLoaded', function() {
	  $("div").removeClass("fc-daygrid-event-harness");
		$("div").removeClass("fc-daygrid-event-harness-abs");
		$(".fc-event-title-container").parent().parent().parent().remove();
		$(".fc-daygrid-event-dot").parent().remove();
    var calendarEl = document.getElementById('calendar');
    
    var today = new Date();
	console.log("연도"+today.getFullYear());
	console.log("월"+(today.getMonth()+1));
	var year = today.getFullYear();
	var month = (today.getMonth()+1);
	var day = today.getDate();
	if(day<10){
		day="0"+day;
	}
	console.log("일"+day);
	var todayStr = year+"-"+month+"-"+day;
	console.log("날짜 = "+todayStr);
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      height: '100%',
      expandRows: true,
      slotMinTime: '08:00',
      slotMaxTime: '20:00',
      //우측상단툴바메뉴조정
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth'
      },
      initialView: 'dayGridMonth',
      //초기화 날짜
      initialDate: todayStr,  //sysdate로 설정 요망
      navLinks: false, // can click day/week names to navigate views
      editable: true,//일정 드래그 앤 드랍
      selectable: true,
      nowIndicator: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
          
         
        ]
      });

    calendar.render();
    $('select[name="concept"]').change(function() {

        if ($(this).val() == "바디프로필") {
            picPrice = 10000;
            console.log(picPrice);
            selConcept="body";
        } else if ($(this).val()=="개인프로필" ) {
            picPrice = 5000;
            console.log(picPrice);
            selConcept="indiv";
        } else {
            picPrice = 15000;
            console.log(picPrice);
            selConcept="group";
        }
        $("#resv-submit-input-text").attr("value", "가격: "+(picPrice + cutPrice + timePrice) + "원");
        
       
    });
    var resvDate=null;
    var startDay = 0;
    var endDay = 0;
    var test3 = $("td[data-date]");
    test3.each(function(i){
		$(this).click(function(e){
			var inputChkbox = $('input[type="checkbox"]');
			inputChkbox.prop("disabled",false);
			e.preventDefault();
			console.log(test3.eq(i).attr('data-date'));
			resvDate=test3.eq(i).attr('data-date');
			$("div[name=r_date]").attr("value",resvDate);
			$("div[name=r_date]").html(resvDate);
			$("input[name=r_date]").attr("value",resvDate);
			console.log($("input[name=resvDate]").val());
			/*
				클릭시 resvDate를 디비에 보내 
				리스트에 시작시간과 총시간 가져옴
				반복문을 돌려서 시간만큼 비활성화
			*/
			$(".labelchk").removeClass("resv-chk-style-disabled");
			$.ajax({
				url:"/printReservedDateTime",
				type:"get",
				data:{resvDate:resvDate},
				success:function(data){
					console.log(data.length);
					for(var i=0;i<data.length;i++){
						var sTime=Number(data[i].sTime);
						var eTime=Number(data[i].eTime);
						//var timeLabel =document.getElementsByClassName("labelchk");
						var timeLabel = $(".labelchk");
						for(var i=0;i<timeLabel.length;i++){
							var val = timeLabel.eq(i).attr("value");							
							if(Number(val)>=sTime && Number(val)<eTime){
								timeLabel.eq(i).addClass("resv-chk-style-disabled");
								//timeLabel.eq(i).removeClass(".labelchk");
								timeLabel.eq(i).children().prop("disabled",true);								
							}
						}
					}
					
				},error:function(){
					console.log("실패");
				}
			});
			console.log(selConcept);
			 var inputChkbox = $('input[type="checkbox"]');
		        inputChkbox.unbind("click").bind("click",function(){
		        	startDay=0;
		        	endDay=0;
		        	inputChkbox.prop("checked",false);
		        	inputChkbox.parent().removeClass("resv-chk-style");
		        	console.log("123");
		        	
		        	console.log($(this).is(":checked"));
		        	if(selConcept=="group"){
		        		if($(this).parent().next().children().prop("disabled")==true){
		        			alert("단체사진은 최소 2시간이 필요합니다.");
		        			inputChkbox.prop("checked",false);
		        		}else{
		        			$(this).parent().addClass("resv-chk-style");
		        			$(this).parent().next().children().prop("checked",true);
		        			$(this).parent().next().addClass("resv-chk-style");
		        			console.log($(this).parent().next().children().is(":checked"));
		        			startDay=$(this).parent().attr("value");
		        			endDay=$(this).parent().next().attr("value");
		        		}
		        		
		        	}else if(selConcept==null){
		        		inputChkbox.prop("checked",false);
		        		alert("컨셉을 선택하세요");
		        		
		        	}else{
		        		$(this).parent().addClass("resv-chk-style");
		        		startDay=$(this).parent().attr("value");
		        		endDay=$(this).parent().attr("value");
		        	}
		        	 $('#sendstartday').attr("value",startDay);
						$('#sendendday').attr("value",Number(endDay)+1);
		        });
		       
			});
		});
    	$('input[type="checkbox"]').click(function(){
    		if(resvDate==null){
    			alert("날짜를 먼저 선택하세요");
    		}
    	})
    });
  
  $(".fc-daygrid-day-frame").click(function(){
	  
  });
	window.onload=function(){
		$("a[data-navlink]").removeAttr('data-navlink');
	};
</script>
<style>
	body{
		/* width:100vw; */
	}
  html, body {
    /*overflow: hidden; /* don't do scrollbars */*/
    
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  html{
  	overflow:scroll; 
  }
	.resv-main-frame{
		width:80%;
		   
	}
  #calendar-container {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
  }

  .fc-header-toolbar {
    /*
    the calendar will be butting up against the edges,
    but let's scoot in the header's buttons
    */
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
  .resv-content{
  	float:left;
  	position:relative;
  }
	#calendar-container{
		position:absolute;
		color:black;
}
a{
	color:black;
}

.resv-chk-do:hover{
	text-decoration:none;
	color:#4a4a4a;
}
.resv-submit-div-go button{
  background:#f8f9fa;
  color:rgb(241, 209, 209);
  border:1px solid rgb(241, 209, 209);

  position:relative;
  height:60px;
  font-size:1.2em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}


.nav-item{
	line-height:50px;
	
}
.navi-menu li>a{
	line-height:30px;
}
.navbar{
	padding-left:16px;
	padding-right:16px;
	padding-top:8px;
	padding-bottom:8px;
}
.resv-select {
    width: 100%;
    margin: 0 auto;
}
</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<div class="resv-main-frame">
    <div class="resv-chk">
        <a href="/test" class="resv-chk-do">예약하기</a>
    </div>
    <div class="resv-chk">
        <a href="/searchReserve" class="resv-chk-do">예약확인</a>
    </div>
    <div class="resv-content">
  <div id='calendar-container'>
    <div id='calendar'></div>
    </div>
  </div>
  <form name="f" action="/reservationLoginChk">
 
<div class="resv-select">
        <div class="resv-chkbox">
           <div class="resv-selectbox">
                <label for="resv-concept-select" id="cut-label">컨셉</label>

                <select name="concept" id="resv-concept-select">
                    <option selected>원하는 컨셉을 선택하세요</option>
                    <option value="바디프로필" id="body">바디프로필</option>
                    <option value="개인프로필" id="indiv">개인프로필</option>
                    <option value="단체사진" id="group">단체사진</option>
                </select>
            </div> 
        </div>
         
        <div class="resv-cut-option">
            <div class="resv-selectbox">
                <label for="resv-select" id="cut-label">컷수</label>

                <select name="cut" id="resv-select">
                    <option selected>원하는 컷수를 선택하세요</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
        </div>
         <div class="resv-time-chk">
          <div class="resv-day-screen" value="" name="r_date">
          	
          </div>
          <input type="hidden" name="r_date" value="">
          
                <div class="resv-time-list">
                   
                   <label for="11" class="labelchk" value="11">11시
                        <input type="checkbox" class="resv-time-chkbox" value=11 id="11" style="display: none">
                    </label>
                    <label for="12" class="labelchk" value="12">12시
                        <input type="checkbox" class="resv-time-chkbox" value=12 id="12" style="display: none">
                    </label>
                    <label for="1" class="labelchk" value="13">1시
                        <input type="checkbox" class="resv-time-chkbox" value=13 id="1" style="display: none">
                    </label>
                    <label for="2" class="labelchk" value="14">2시
                        <input type="checkbox" class="resv-time-chkbox" value=14 id="2" style="display: none">
                    </label>
                    <label for="3" class="labelchk" value="15">3시
                        <input type="checkbox" class="resv-time-chkbox" value=15 id="3" style="display: none">
                    </label>
                </div>
                <div class="resv-time-list" >
                  
                   <label for="4" class="labelchk" value="16">4시
                        <input type="checkbox" class="resv-time-chkbox" value=16 id="4" style="display: none">
                    </label>
                    <label for="5" class="labelchk" value="17">5시
                        <input type="checkbox" class="resv-time-chkbox" value=17 id="5" style="display: none">
                    </label>
                    <label for="6" class="labelchk" value="18">6시
                        <input type="checkbox" class="resv-time-chkbox" value=18 id="6" style="display: none">
                    </label>
                    <label for="7" class="labelchk" value="19">7시
                        <input type="checkbox" class="resv-time-chkbox" value=19 id="7" style="display: none">
                    </label>
                    <label for="8" class="labelchk" value="20">8시
                        <input type="checkbox" class="resv-time-chkbox" value=20 id="8" style="display: none">
                    </label>
                </div>
            </div>
        <div class="resv-submit">
           
            <div class="resv-submit-div-price">
                        <input type="text" class="resv-submit-input" id="resv-submit-input-text" readonly>
                    </div>
                    <div class="resv-submit-div-pw">
                        <input type="password" id="resv-submit-input-pass" class="resv-submit-input" name="r_pass" required placeholder="4자리 비밀번호" minlength="4" maxlength="4" pattern="[0-9]+">
                    </div>
                    <div class="resv-submit-div-go">
                        <button type="submit" class="resv-submit-input">예약하기</button>
                    </div>
            <input type="hidden" id="sendstartday" name="s_time" value="">
            <input type="hidden" id="sendendday" name="e_time" value="">
            <%if(r!=null){%>
            <input type="hidden" id="sendrCheck" name="rCheck" value="<%=r.getrCheck()%>">
            <input type="hidden" id="sendrNum" name="rNum" value="<%=r.getrNum()%>">
            <%} %>
        </div>
        </div>
        </form>
        </div>
        
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

<script>
var option;
var startDay = $("#sendstartday").attr("value");
var endDay = $("#sendendday").attr("value");
var picPrice = 0;
var cutPrice = 0;
var timePrice = 0;

window.onload = function() {
    $("#resv-submit-input-text").attr("value", "가격: "+(picPrice + cutPrice + timePrice) + "원");
};
//컨셉의 가격표

//컷수당의 가격수
$('select[name="cut"]').change(function() {
    cutPrice = $(this).val() * 1000;
    $("#resv-submit-input-text").attr("value", "가격: "+(picPrice + cutPrice + timePrice) + "원");
});
//시작과 끝시간
$(".labelchk").click(function() {
    if (endDay > 0 && startDay > 0) {
        timePrice = (endDay - startDay) * 100000;
        $("#resv-submit-input-text").attr("value", "가격: "+(picPrice + cutPrice + timePrice) + "원");
    } else {
        timePrice = 0;
        $("#resv-submit-input-text").attr("value", "가격: "+(picPrice + cutPrice + timePrice) + "원");

    }

});
    
    $('button[type="submit"]').click(function(){
        console.log($("#sendstartday").val());
        console.log(endDay);
        if(document.f.cut.value==""||$("#sendstartday").val()==null||$("#sendstartday").val()==0||$("#sendendday").val()==null||$("#sendendday").val()==0||document.f.concept.value==""){
            alert("다시");
           return false;
        }
	});
	
</script>
</html>
