
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
<head>

<!-- Favicon icon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico"
	type="image/x-icon">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico"
	type="image/x-icon">

<style>
	#center{
	text-align:center;
	margin: auto;
	}

</style>

</head>

<body onload="printClock()">

	<!-- [ Pre-loader ] start 로딩기능 
   <div class="loader-bg">
      <div class="loader-track">
         <div class="loader-fill">dfdfdf</div>
      </div>
   </div> -->
   
   


	<!-- [ Pre-loader ] End -->
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />

	<div class="pcoded-main-container">
		<!--메인 화면 전체시작 -->
		<div class="pcoded-content">


			<!-- [ breadcrumb start 부트스트랩에서 사이트 이동하는기능 -->
			<div class="page-header">
				<div class="page-block">
					<div class="row align-items-center">
						<div class="col-md-12">
							<div class="page-header-title">
								<h5 class="m-b-10"></h5>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.jsp"><i
										class="feather icon-home"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>


			<!-- [ breadcrumb ] end -->
			
			
			
			<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->
			<div class="row">
			
			
			
			
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<!-- 현재날짜 -->
				<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set>
				
				<form action="start.work" method="post" id="startWork">
    				<input type="hidden" name="empNo" id = "empNo" value="${loginUser.empNo}"><!-- 원래 eno -->
    				<!--  <input type="hidden" name="timeNow" id="timeNow" value="${date}" />-->
    			</form>
    			<form action="end.work1" method="post" id="endWork1">
    				<input type="hidden" name="empNo" id = "empNo" value="${loginUser.empNo}">
    				<!--<input type="hidden" name="timeNow" id="timeNow"  value="${date}" />-->
    			</form>
    			<form action="end.work2" method="post" id="endWork2">
    				<input type="hidden" name="empNo" id = "empNo" value="${loginUser.empNo}">
    				<!--<input type="hidden" name="timeNow" id="timeNow"  value="${date}" />-->
    			</form>
    			
    			
    			
    			
				<!-- 근태관리 화면시작 -->
				<div class="col-xl-6 col-md-12">
					<div class="card latest-update-card">
						<div class="card-header">
							<h5>근태관리</h5>
							<div class="card-header-right">
								<div class="btn-group card-option">
									<div
										style="width: 160%; height: 160%; line-height: 160%; color: #666; font-size: 160%; text-align: center;"
										id="clock">
									</div>
								</div>
							</div>
						</div>

						<div class="card-body">
							<div class="latest-update-box">

								<div class="row p-t-30 p-b-30">
									<div class="col-auto text-right update-meta">
										<p class="text-muted m-b-0 d-inline-flex">출근시간</p>
										<i class="feather icon-user-check bg-twitter update-icon"></i>
									</div>

									<!-- 시간자리 -->
									
									<div class="col">

										
										<h6>
										
										<c:forEach items="${ workUser }" var="w">
											<fmt:parseNumber integerOnly="true" value="${(w.workStartMin/60)}"/>시
											<fmt:parseNumber integerOnly="true" value="${(w.workStartMin%60)%60%60}"/>분
										</c:forEach>
										
										</h6>
										
									</div>

									<!-- 시간자리 -->


								</div>

								<div class="row p-t-30 p-b-30">
									<div class="col-auto text-right update-meta">
										<p class="text-muted m-b-0 d-inline-flex">퇴근시간</p>
										<i class="feather icon-user-minus bg-c-red update-icon"></i>
									</div>
									<div class="col">
										
										<h6>
										<c:forEach items="${ workUser }" var="w">
											<fmt:parseNumber integerOnly="true" value="${(w.workEndMin/60)}"/>시
											<fmt:parseNumber integerOnly="true" value="${(w.workEndMin%60)%60%60}"/>분
										</c:forEach>
										</h6>
										
									</div>
								</div>


								<div class="row p-t-30 p-b-30">
									<div class="col-auto text-right update-meta">
										<p class="text-muted m-b-0 d-inline-flex">총근무 시간</p>
										<i class="fas fa-equals bg-c-blue update-icon"></i>
									</div>
									<div class="col">
										
										<h6>
										
										<c:forEach items="${ workUser }" var="w">
											<fmt:parseNumber integerOnly="true" value="${(w.workSum/60)}"/>시
											<fmt:parseNumber integerOnly="true" value="${(w.workSum%60)%60%60}"/>분
										</c:forEach>
										
										</h6>
										
									</div>
								</div>


							</div>




							<br>

							<div class="row" id="center">
								<div class="col-md-12">

									<div class="card-body">
									
									
									
									
									
									
									<!--
									<c:choose>
    									<c:when test="${ 0 ne sessionScope.workUser.workEndMin}">
        									<button type="button" class="btn  btn-secondary btn-lg" onclick="$('#endWork1').submit();">퇴근하기</button>
    									</c:when>
    									<c:otherwise>
        									<button type="button" class="btn  btn-primary bg-twitter btn-lg" onclick="$('#startWork').submit();">출근하기</button>
    									</c:otherwise>
									</c:choose>
									-->
                					<!--  
                					<c:if test="${ null ne sessionScope.workUser.workEnd }">
	                					<button type="button" class="btn  btn-primary bg-twitter btn-lg" onclick="$('#startWork').submit();">출근하기</button>
	                					qqqqq
                					</c:if>
                					
                					<c:if test="${ null eq sessionScope.workUser.workEnd }">
	                					<button type="button" class="btn  btn-secondary btn-lg" onclick="$('#endWork1').submit();">퇴근하기</button>
	                					empp
               		 				</c:if>
               		 				<c:if test="${ null ne sessionScope.workUser.endWork && null ne sessionScope.workUser.startWork }">
	                					<button type="button" class="btn  btn-primary bg-twitter btn-lg" onclick="$('#startWork').submit();">출근하기</button>
	                					sdfsdfsdfsd
                					</c:if>
									-->
										
										<button type="button" class="btn  btn-primary bg-twitter btn-lg" onclick="$('#startWork').submit();">출근하기</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn  btn-secondary btn-lg" onclick="$('#endWork1').submit();">퇴근하기</button>
										

									</div>
									
								</div>
							</div>


						</div>
						</div>
						</div>


<script type="text/javascript">
<!--
function topList(){
    $.ajax({
       url : "todoMainListView.do",
       type : "get",
       success : function(todolist) {
          var value="";
         
          for(var i in todolist){
       	  
             value += '<tr class="thumbbo"  data-tno="'+todolist[i].todoNo+'">'+
             
               '<td width="100px" align="left">'+todolist[i].todoTitle+'</td>'+
               '<td width="50px" align="left">'+todolist[i].todoContent+'</td>'+
               
               '</tr>';
          }        
             
          
          $("#todoMainList").html(value);
       },
       error : function() {
          console.log("ajax 통신실패");
       }

    });
 }
-->

<!--
function callContent(){
    var url = "call.html";
    $.ajax({
        url:url,
        type:"get",
        dataType : "html",
        success: function(html){
            $(".ajax_inform").html(html);
              
        },
        error: function(xhr, status, error) {
            alert(error);
        }  
    });
}
-->
</script>
<!-- ----------------------------------------------------------- onclick="location.href='start.work'" -->

						<!-- [ Todo-list1 ] start -->
						<div class="col-xl-6">
							<div class="card">
								<div class="card-header">
									<h5>To Do List</h5>
								</div>
								<div class="card-body">
									<div class="input-group mb-3">
										<input type="text" name="task-insert"
											class="form-control add_task_todo"
											placeholder="Create your task list" required="">
										<div class="input-group-append">
											<button class="btn waves-effect waves-light btn-secondary"
												id="add-btn">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
									<div class="new-task">
										<div class="to-do-list mb-3">
											<div class="d-inline-block">
												<label
													class="check-task custom-control custom-checkbox d-flex justify-content-center">
													<input type="checkbox" class="custom-control-input"
													id="customCheck1"> <span
													class="custom-control-label">Lorem Ipsum Dolor Sit
														Amet</span>
												</label>
											</div>
											<div class="float-right">
												<a onclick="delete_todo(1);" href="#!"
													class="delete_todolist"><i class="far fa-trash-alt"></i></a>
											</div>
										</div>
										<div class="to-do-list mb-3">
											<div class="d-inline-block">
												<label
													class="check-task custom-control custom-checkbox d-flex justify-content-center">
													<input type="checkbox" class="custom-control-input"
													id="customCheck2"> <span
													class="custom-control-label">Industry's standard
														dummy text ever since the 1500s</span>
												</label>
											</div>
											<div class="float-right">
												<a onclick="delete_todo(2);" href="#!"
													class="delete_todolist"><i class="far fa-trash-alt"></i></a>
											</div>
										</div>
										<div class="to-do-list mb-3">
											<div class="d-inline-block">
												<label
													class="check-task custom-control custom-checkbox d-flex justify-content-center">
													<input type="checkbox" class="custom-control-input"
													id="customCheck3"> <span
													class="custom-control-label">The point of using
														Lorem Ipsum is that it has a more-or-less </span>
												</label>
											</div>
											<div class="float-right">
												<a onclick="delete_todo(3);" href="#!"
													class="delete_todolist"><i class="far fa-trash-alt"></i></a>
											</div>
										</div>
										<div class="to-do-list mb-3">
											<div class="d-inline-block">
												<label
													class="check-task custom-control custom-checkbox d-flex justify-content-center">
													<input type="checkbox" class="custom-control-input"
													id="customCheck4"> <span
													class="custom-control-label">Contrary to popular
														belief</span>
												</label>
											</div>
											<div class="float-right">
												<a onclick="delete_todo(4);" href="#!"
													class="delete_todolist"><i class="far fa-trash-alt"></i></a>
											</div>
										</div>
										<div class="to-do-list mb-3">
											<div class="d-inline-block">
												<label
													class="check-task custom-control custom-checkbox d-flex justify-content-center">
													<input type="checkbox" class="custom-control-input"
													id="customCheck5"> <span
													class="custom-control-label">There are many
														variations of passages of Lorem Ipsum</span>
												</label>
											</div>
											<div class="float-right">
												<a onclick="delete_todo(5);" href="#!"
													class="delete_todolist"><i class="far fa-trash-alt"></i></a>
											</div>
										</div>
										<div class="to-do-list mb-3">
											<div class="d-inline-block">
												<label
													class="check-task custom-control custom-checkbox d-flex justify-content-center">
													<input type="checkbox" class="custom-control-input"
													id="customCheck6"> <span
													class="custom-control-label">Sed ut perspiciatis
														unde omnis iste natus</span>
												</label>
											</div>
											<div class="float-right">
												<a onclick="delete_todo(6);" href="#!"
													class="delete_todolist"><i class="far fa-trash-alt"></i></a>
											</div>
										</div>
										<div class="to-do-list mb-3">
											<div class="d-inline-block">
												<label
													class="check-task custom-control custom-checkbox d-flex justify-content-center">
													<input type="checkbox" class="custom-control-input"
													id="customCheck7"> <span
													class="custom-control-label"> must explain to you
														how all this mistaken idea</span>
												</label>
											</div>
											<div class="float-right">
												<a onclick="delete_todo(7);" href="#!"
													class="delete_todolist"><i class="far fa-trash-alt"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- [ Todo-list1 ] end -->


						<!-- 공지사항게시판 시작 -->
						<div class="col-xl-12">
							<div class="card">
								<div class="card-header">
									<h5>공지사항</h5>
								</div>
								<div class="card-body table-border-style">
									<div class="table-responsive">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>작성자</th>
													<th>제목</th>
													<th>내용</th>
													<th>날짜</th>
												</tr>
											</thead>
											<tbody>
										<c:forEach items="${ list }" var="n">
											<tr>
												<td>${ n.workWriter }</td>
												<td>${ n.workTitle }</td>
												<td>${ n.workContent }</td>
												<td>${ n.workDate }</td>
											</tr>
										</c:forEach>
									</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- 공지사항게시판 끝 -->




						<!-- 캘린더 -->

						<div class="col-lg-8 col-md-12">
							<div class="card table-card">
								<div class="card-header">
									<h5>캘린더</h5>
								</div>

								<div class="pd-20 card-box mb-30">
									<div class="calendar-wrap">
										<div id='calendar'></div>
									</div>
									<jsp:include page="/WEB-INF/views/common/calendar.jsp" />
								</div>
							</div>
						</div>

						<!-- 캘린더 일정 -->
						<div class="card-body text-center">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Date</th>
											<th>Calendar</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>getDate();</td>
											<td>등록된 일정이 없습니다.</td>
										</tr>
										<tr>
											<td>getDate();</td>
											<td>등록된 일정이 없습니다.</td>
										</tr>
										<tr>
											<td>getDate();</td>
											<td>등록된 일정이 없습니다.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
			<!-- [ Main Content ] 메인화면 끝 -->

			<!-- script 부분 -->

			<script>

function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = calendar+"("+currentHours+":"+currentMinute+":"+currentSeconds +")"+" <span style='font-size:30%;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

</script>


			<script
				src="${pageContext.request.contextPath}/resources/ablePro/assets/js/todo.js"></script>
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>