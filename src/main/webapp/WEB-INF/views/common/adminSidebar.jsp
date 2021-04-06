<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8 ">
<meta http-equiv="X-UA-Compatible" content="IE=edge chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
     <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
   
    <!-- Favicon icon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/ablePro/assets/images/favicon.ico" type="image/x-icon">
    <!-- vendor css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/style.css">
<!-- 썸머노트  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
	
   <title>FIOFFICE</title>
</head>
<body>
<!-- [ navigation menu ] start -->
<nav class="pcoded-navbar menu-light ">
      <div class="navbar-wrapper  ">
         <div class="navbar-content scroll-div " >
            
            <ul class="nav pcoded-inner-navbar ">
               <li class="nav-item pcoded-menu-caption">
                   <label>ADMIN</label>
               </li>
               <li class="nav-item">
                   <a href="authority.ad" onclick="return adminCheck('A001');"class="nav-link "><span class="pcoded-micon"><i class="feather icon-edit m-r-5"></i></span><span class="pcoded-mtext">권한관리</span></a>
               </li>
               <li class="nav-item pcoded-hasmenu">
                   <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-users m-r-5"></i></span><span class="pcoded-mtext">인사관리</span></a>
                   <ul class="pcoded-submenu">
                       <li><a href="dept.ad" onclick="return adminCheck('A002');">부서관리</a></li>
                       <li><a href="manageEmp.do" onclick="return adminCheck('A002');">사원관리</a></li>
                       <li><a href="insertEmpForm" onclick="return adminCheck('A002');">사원추가</a></li>
                   </ul>
               </li>
               
                <li class="nav-item pcoded-hasmenu">
                   <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-grid m-r-5"></i></span><span class="pcoded-mtext">메뉴관리</span></a>
                   <ul class="pcoded-submenu">
                       <li><a href="notice.ad" onclick="return adminCheck('A003');">공지사항</a></li>
                       <li><a href="calendar.ad" onclick="return adminCheck('A004');">캘린더</a></li>
                       <li><a href="survey.ad" onclick="return adminCheck('A001');">설문</a></li>
                       <li class="pcoded-hasmenu">
                       	<a href="#!">회의실</a>
                       	 <ul class="pcoded-submenu">
                       	 	<li><a href="meetingRoom.ad" onclick="return adminCheck('A006');">회의실</a></li>
                       	 	<li><a href="reservation.ad" onclick="return adminCheck('A006');">예약현황</a></li>
                       	 </ul>
                       </li>
                   </ul>
               </li> 
            </ul>
            
         </div>
      </div>
   </nav>
   <!-- [ navigation menu ] end -->
   
   <!-- Required Js -->
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/vendor-all.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/ripple.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/pcoded.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/moment.js"></script>

   <!-- Apex Chart -->
   <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/apexcharts.min.js"></script>
   <!-- custom-chart js -->
   <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/pages/dashboard-main.js"></script>   

<!-- 썸머노트  -->
	   
	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>

   
</body>
</html>