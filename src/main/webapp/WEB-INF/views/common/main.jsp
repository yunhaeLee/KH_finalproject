  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
<head>

 <!-- Favicon icon -->
 <link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
  <!-- CSS -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar/assets/css/fullcalendar.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar/assets/css/fullcalendar.print.css' rel='stylesheet' media='print' />
    
    <style>
    		#center{
	text-align:center;
	margin: auto;
	}
    
    
    </style>
    
    
    
</head>

<body class="       " onload="printClock()">
      
   <!-- [ Pre-loader ] start 로딩기능 
   <div class="loader-bg">
      <div class="loader-track">
         <div class="loader-fill">dfdfdf</div>
      </div>
   </div> -->
   
   
   <!-- [ Pre-loader ] End -->
   <jsp:include page="sidebar.jsp"/>
   <jsp:include page="topbar.jsp"/>
   
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
                        	<li class="breadcrumb-item"><a href="index.jsp"><i class="feather icon-home"></i></a></li>
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


									
									<div class="col">

										
										<h6 id="workStartTime"><!-- 시간자리 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->
										<!-- 
										<c:forEach items="${ workUser }" var="w">
											<fmt:parseNumber integerOnly="true" value="${(w.workStartMin/60)}"/>시
											<fmt:parseNumber integerOnly="true" value="${(w.workStartMin%60)%60}"/>분
										</c:forEach>
										-->
										</h6><!-- 시간자리 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->
										
									</div>



								</div>

								<div class="row p-t-30 p-b-30">
									<div class="col-auto text-right update-meta">
										<p class="text-muted m-b-0 d-inline-flex">퇴근시간</p>
										<i class="feather icon-user-minus bg-c-red update-icon"></i>
									</div>
									<div class="col">
										
										<h6 id="workEndTime"><!-- 시간자리 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->
										<c:forEach items="${ workUser }" var="w">
											<fmt:parseNumber integerOnly="true" value="${(w.workEndMin/60)}"/>시
											<fmt:parseNumber integerOnly="true" value="${(w.workEndMin%60)%60%60}"/>분
										</c:forEach>
										</h6><!-- 시간자리 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->
										
									</div>
								</div>


								<div class="row p-t-30 p-b-30">
									<div class="col-auto text-right update-meta">
										<p class="text-muted m-b-0 d-inline-flex">총근무 시간</p>
										<i class="fas fa-equals bg-c-blue update-icon"></i>
									</div>
									<div class="col">
										
										<h6 id="workTotalTime"><!-- 시간자리 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->
										
										<c:forEach items="${ workUser }" var="w">
											<fmt:parseNumber integerOnly="true" value="${(w.workSum/60)}"/>시
											<fmt:parseNumber integerOnly="true" value="${(w.workSum%60)%60}"/>분
										</c:forEach>
										
										</h6><!-- 시간자리 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->

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
            
            
            <script>
            
            function workUserStart(){
                $.ajax({
                type : "POST",
                   data : {empNo:"${loginUser.empNo}"},
                   url : "view.workMain",
                   success : function(workUser) {
                	   
                   	$tableBody = $('#workStartTime');
                   	$tableBody.html('');
                   	//var workS=${workUser.status}
                     	  	
                   	$.each(workUser, function(i, obj){

                   		/*
                   		var $fmt = $('fmt:parseNumber');
						var $hour = $('fmt:parseNumber style= "integerOnly:true">').text((Number(obj.workStartMin)/60));
						var $minute = $('fmt:parseNumber style= "integerOnly:true">').text((Number(obj.workStartMin)%60));
						$fmt.append($hour);
						$fmt.append($minute);
						$tableBody.append($fmt);
						*/
						
						var $label = $('<label>');
						var $hour = $('<label>').text(parseInt((obj.workStartMin)/60));
						var $si = $('<label>').text("시   ");
						var $minute = $('<label>').text(parseInt((obj.workStartMin)%60));
						var $bun = $('<label>').text("분");
						$label.append($hour);
						$label.append($si);
						$label.append($minute);
						$label.append($bun);
						$tableBody.append($label);
						
                         
       				//$h6 #workStartTime.append((Number(obj.workStartMin)/60)));
       				//$h6#workStartTime.append(Number(obj.workStartMin)%60);
       				//$tableBody.append($<h6>);
       			});
       		}
       	});
       }
            
            $(function(){
            	workUserStart();
            })
            
 //////////////////////////////////////////////////////////////////////////////////////////           
 
       function workUserEnd(){
                $.ajax({
                type : "POST",
                   data : {empNo:"${loginUser.empNo}"},
                   url : "view.workMain",
                   success : function(workUser) {
                	   
                   	$tableBody = $('#workEndTime');
                   	$tableBody.html('');
                   	//var workS=${workUser.status}
                     	  	
                   	$.each(workUser, function(i, obj){

                   		/*
                   		var $fmt = $('fmt:parseNumber');
						var $hour = $('fmt:parseNumber style= "integerOnly:true">').text((Number(obj.workStartMin)/60));
						var $minute = $('fmt:parseNumber style= "integerOnly:true">').text((Number(obj.workStartMin)%60));
						$fmt.append($hour);
						$fmt.append($minute);
						$tableBody.append($fmt);
						*/
						
						var $label = $('<label>');
						var $hour = $('<label>').text(parseInt((obj.workEndMin)/60));
						var $si = $('<label>').text("시   ");
						var $minute = $('<label>').text(parseInt((obj.workEndMin)%60));
						var $bun = $('<label>').text("분");
						$label.append($hour);
						$label.append($si);
						$label.append($minute);
						$label.append($bun);
						$tableBody.append($label);
						
                         
       				//$h6 #workStartTime.append((Number(obj.workStartMin)/60)));
       				//$h6#workStartTime.append(Number(obj.workStartMin)%60);
       				//$tableBody.append($<h6>);
       			});
       		}
       	});
       }
            ////////////////////////////////////////////////////////////////////////////////
            $(function(){
            	workUserEnd();
            })
            
       function workUserTotal(){
                $.ajax({
                type : "POST",
                   data : {empNo:"${loginUser.empNo}"},
                   url : "view.workMain",
                   success : function(workUser) {
                	   
                   	$tableBody = $('#workTotalTime');
                   	$tableBody.html('');
                   	//var workS=${workUser.status}
                     	  	
                   	$.each(workUser, function(i, obj){

                   		/*
                   		var $fmt = $('fmt:parseNumber');
						var $hour = $('fmt:parseNumber style= "integerOnly:true">').text((Number(obj.workStartMin)/60));
						var $minute = $('fmt:parseNumber style= "integerOnly:true">').text((Number(obj.workStartMin)%60));
						$fmt.append($hour);
						$fmt.append($minute);
						$tableBody.append($fmt);
						*/
						
						var $label = $('<label>');
						var $hour = $('<label>').text(parseInt((obj.workSum)/60));
						var $si = $('<label>').text("시   ");
						var $minute = $('<label>').text(parseInt((obj.workSum)%60));
						var $bun = $('<label>').text(" 분");
						$label.append($hour);
						$label.append($si);
						$label.append($minute);
						$label.append($bun);
						$tableBody.append($label);
						
                         
       				//$h6 #workStartTime.append((Number(obj.workStartMin)/60)));
       				//$h6#workStartTime.append(Number(obj.workStartMin)%60);
       				//$tableBody.append($<h6>);
       			});
       		}
       	});
       }
            

            $(function(){
            	workUserTotal();
            })
            
            </script>
            
            
           
            

            <!-- 근태관리화면끝 --><!-- 근태관리화면끝 --><!-- 근태관리화면끝 --><!-- 근태관리화면끝 --><!-- 근태관리화면끝 --><!-- 근태관리화면끝 --><!-- 근태관리화면끝 --><!-- 근태관리화면끝 -->
            
            
            
            
            
            
            <!-- [ Todo-list1 ] start 
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h5>To Do List</h5>
                    </div>
                    <div class="card-body">
                        <div class="input-group mb-3">
                            <input type="text" name="task-insert" class="form-control add_task_todo" placeholder="Create your task list" required="">
                            <div class="input-group-append">
                                <button class="btn waves-effect waves-light btn-secondary" id="add-btn">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="new-task">
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                                        <span class="custom-control-label">Lorem Ipsum Dolor Sit Amet</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(1);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck2">
                                        <span class="custom-control-label">Industry's standard dummy text ever since the 1500s</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(2);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck3">
                                        <span class="custom-control-label">The point of using Lorem Ipsum is that it has a more-or-less </span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(3);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck4">
                                        <span class="custom-control-label">Contrary to popular belief</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(4);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck5">
                                        <span class="custom-control-label">There are many variations of passages of Lorem Ipsum</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(5);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck6">
                                        <span class="custom-control-label">Sed ut perspiciatis unde omnis iste natus</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(6);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck7">
                                        <span class="custom-control-label"> must explain to you how all this mistaken idea</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(7);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Todo-list1 ] end -->
 			<!-- [ Todo-list1 ] start -->
                   <div class="col-xl-6 col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5>   ${loginUser.empName } 의 toDo+    </h5>
                                 
                        <div class="card-header-right">
                            <div class="btn-group card-option">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="feather icon-more-horizontal"></i>
                                </button>
                                <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
                                    <li class="dropdown-item full-card"><a href="#!"><span><i class="feather icon-maximize"></i> maximize</span><span style="display:none"><i class="feather icon-minimize"></i> Restore</span></a></li>
                                    <li class="dropdown-item minimize-card"><a href="#!"><span><i class="feather icon-minus"></i> collapse</span><span style="display:none"><i class="feather icon-plus"></i> expand</span></a></li>
                                    <li class="dropdown-item reload-card"><a href="#!"><i class="feather icon-refresh-cw"></i> reload</a></li>
                                    <li class="dropdown-item close-card"><a href="#!"><i class="feather icon-trash"></i> remove</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                                     
                            <table class="table table-hover mb-0" id="todoMainList">
                                <thead>
                                    <tr>
                                        
                                        <th style= "text-align:left">제목</th>
                                        <th style= "text-align:left">내용</th>
                                        <th style= "text-align:right">마감날짜</th>
                              
                           
                            
                                    </tr>
                                </thead>
                           
                                <tbody>                 
                                
                                <!--  -->
                                </tbody>
                                
                            </table>
                                
                        </div>
                    </div>
                </div>
            </div>
            
            <script>
      function topList(){
         $.ajax({
        	 
            url : "todoMainListView.do",
            success : function(todolist) {
            	$tableBody = $('#todoMainList tbody');
            	$tableBody.html('');
            	var todoS=${todolist.status}
              	  	
            	$.each(todolist, function(i, obj){
            		var $tr = $('<tr>');	  
               		var $tTitle = $('<td  style= "text-align:left">').text(obj.todoTitle);
               		var $tContent = $('<td  style= "text-align:left">').text(obj.todoContent);
              		var $tdoneDate = $('<td style= "text-align:right">').text(obj.todoDoneDate);
              	 
                  
               
				$tr.append($tTitle);
				$tr.append($tContent);
				$tr.append($tdoneDate);
				$tableBody.append($tr);
			});
		}
	});
}
      $(function(){
         topList();
         <%--setInterval(function(){
            topList();
         }, 5000);--%>
         
     	$("#todoMainList tbody ").click(function(){
			location.href="todoListView.do";
		});
      })
      
  
   </script>
   
   
            <!-- [ Todo-list1 ] end --><!-- [ Todo-list1 ] end --><!-- [ Todo-list1 ] end --><!-- [ Todo-list1 ] end --><!-- [ Todo-list1 ] end -->
            
            
          
                           
        <!-- 캘린더 -->
         <div class="col-xl-6 col-md-12">
            <div class="card table-card">

                    
                 <div class="pd-20 card-box mb-30">
               <div class="calendar-wrap">
                  <div id='calendar'></div>
               </div>
                 
               </div>
            </div>
        </div> <!-- 캘린더 -->
        
          
            <!-- 공지사항게시판 시작 -->
             <div class="col-xl-6 col-md-12">
                <div class="card">
                     <div class="card-header">
                        <h5>공지사항</h5>
                        <div class="card-header-right">
                            <div class="btn-group card-option">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="feather icon-more-horizontal"></i>
                                </button>
                                <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
                                    <li class="dropdown-item full-card"><a href="nlist.bo" class="dropdown-item full-card"><span><i class="fas feather icon-bell"></i>더보기</span>
                                    </a>
                                </ul>
                            </div>
                        </div>
                        </div>
                        
                          <div class="pd-20 card-box mb-30">
                            
                            <table class="table table-hover mb-0" id="noticeMainList">
							<thead>
                                    <tr>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>조회수</th>
                                    </tr>
                                </thead>
                           
                                <tbody>
                                </tbody>
                                
                            </table>
                    </div>

                    
                 </div>
      		</div><!-- 공지사항게시판 끝 -->    
      
      <script>
      function noticeList(){
         $.ajax({
            url : "noticeMainListView.bo",
            type : "get",
            success : function(noticeList) {
               var value="";
              
               for(var i in noticeList){
            	  
                  value +=
                	'<input type="hidden" value="'+noticeList[i].noticeNo+'">'+
                	'<tr>'+
                  	'<td width="70px">'+noticeList[i].noticeTitle+'</td>'+
                    '<td width="20px">'+'관리자'+'</td>'+
                    '<td width="10px">'+noticeList[i].count+'</td>'+
                    
                    '</tr>';
               }        
                  
               
               $("#noticeMainList tbody").html(value);
            },
            error : function() {
               console.log("ajax 통신실패");
            }

         });
      }
      $(function(){
    	  noticeList();
    	  
    	  $("#noticeMainList tbody ").click(function(){
  			location.href="ndetail.bo?nno=" + $(this).children().eq(0).val();
  		});
    	  
      })
   </script>  
      		
      		 
                    
 
   
                </div>
            </div>
</div>
<!-- [ Main Content ] 메인화면 끝 -->


  <script>
    $(document).ready(function(){
    	

	var calendar = $('#calendar').fullCalendar( {
		plugins: ['interaction'],
		editable : false,
		firstDay : 0,
		selectable : true,
		defaultView : 'month',
		allDaySlot : false,
		selectHelper : true,
		
		 /* 일정 받아옴
		events : [ 
			{
			id : '1',
			title : '찍히는지 테스트',
			description : '찍히는지 테스트',
			start : '2021-04-04T09:20',
			end : '2021-04-04T13:20',
			type : '나의 일정',
			backgroundColor: '#B8ACD0',
			textColor: '#ffffff'
			}, 
		 ]*/
		 
		 
		
		 events:
			 
			 function (start, end, callback) {
			    $.ajax({
			      type: "POST",
			      url: "calendarmain.ca",
			      dataType:"json",
			      success: function(calList) {
			    	  var events = [];
			    	  console.log(calList);
			    	  
	 					$.each(calList,function(idx,cal) {
	 						//console.log(cal.calTitle); //찍힘
							//console.log(calList[idx].calTitle); //찍힘
							
							var id = calList[idx].calNo;
							var title = calList[idx].calTitle;
							var description = calList[idx].calContent;
							var type = calList[idx].calCateName;
							var startDay = calList[idx].calSDates;
							var endDay = calList[idx].calEDates;
							var backgroundColor = calList[idx].calColor;

							events.push({
								id : id,
								title : title,
								description: description,
								start : startDay,
								end : endDay,
								type: type,
								backgroundColor : backgroundColor,
								textColor : '#ffffff'
							});
						});
						console.log("events : " + JSON.stringify(events));
						callback(events);

			      }
			      
			    });
			  }
	
      });
	
		calendar.render();
	
    });
    
    </script>
    
    
    
    <!-- 김영찬 스크립트 -->
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
    <!-- 김영찬 스크립트 끝 -->
    
    
    
    
    <script src='${pageContext.request.contextPath}/resources/fullcalendar/assets/js/jquery-ui.custom.min.js' type="text/javascript"></script>
	<script src='${pageContext.request.contextPath}/resources/fullcalendar/assets/js/fullcalendar.js' type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/todo.js"></script>
    <jsp:include page="footer.jsp"/>
</body>
</html>