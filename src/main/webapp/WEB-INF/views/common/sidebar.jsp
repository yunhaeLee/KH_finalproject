<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8  ">
<meta http-equiv="X-UA-Compatible" content="IE=edge chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
   
      <!-- Favicon icon -->
	 <link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
	 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
	 
    <!-- vendor css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/style.css">
	<!-- 썸머노트  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/vendor-all.min.js"></script>
   <title>FIOFFICE</title>
	
	<style>
	
	.btn-outline-primary {
    color: #8069AE;
    border-color: #8069AE;
	}
	
	.btn-outline-primary:hover {
	    color: #fff;
	    background-color: #8069AE;
	    border-color: #8069AE;
	}
	
	.btn-outline-primary:focus, .btn-outline-primary.focus {
	    box-shadow: 0 0 0 0rem rgba(70, 128, 255, 0.5);
	}
	
	.btn-outline-primary.disabled, .btn-outline-primary:disabled {
	    color: #8069AE;
	    background-color: transparent;
	}
	
	.btn-outline-primary:not(:disabled):not(.disabled):active, .btn-outline-primary:not(:disabled):not(.disabled).active,
	  .show > .btn-outline-primary.dropdown-toggle {
	    color: #fff;
	    background-color: #8069AE;
	    border-color: #8069AE;
	}
	
	</style>
</head>
<body>

<!-- [ navigation menu ] start -->
<nav class="pcoded-navbar menu-light ">
      <div class="navbar-wrapper  ">
         <div class="navbar-content scroll-div " >
         
            <div class="">
              
               <div class="main-menu-header">
                   <c:if test="${sessionScope.loginUser.changeName eq null }">
                  <img class="img-radius" src="${pageContext.request.contextPath}/resources/ablePro/assets/images/user/profile.png" alt="User-Profile-Image">
                   </c:if>
                 <c:if test="${sessionScope.loginUser.changeName ne null }">
                  <img class="img-radius" src="${pageContext.request.contextPath}/resources/upload_files/${sessionScope.loginUser.changeName}" alt="User-Profile-Image">
                  </c:if>
                  <div class="user-details">
                     <div id="more-details">${sessionScope.loginUser.empName}님<i class="fa fa-caret-down"></i></div>
                  </div>
               </div>
       
               <div class="collapse" id="nav-user-link">
                  <ul class="list-unstyled">
                     <c:if test="${ !empty sessionScope.loginUser }">
                     <li class="list-group-item"><a href="mypage.do"><i class="feather icon-user m-r-5"></i>마이페이지</a></li>
                     <li class="list-group-item"><a href="#!"><i class="feather icon-settings m-r-5"></i>Settings</a></li>
                     <li class="list-group-item"><a href="logout.me"><i class="feather icon-log-out m-r-5"></i>Logout</a></li>
                      </c:if>
                  </ul>
               </div>
            </div>
             
            <ul class="nav pcoded-inner-navbar ">
               <li class="nav-item pcoded-menu-caption">
                   <label>My portal</label>
               </li>
               <li class="nav-item">
                   <a href="cmain.ca" class="nav-link "><span class="pcoded-micon"><i class="fas fa-calendar-alt"></i></span><span class="pcoded-mtext">캘린더</span></a>
               </li>
               <li class="nav-item">
                   <a href="view.work" class="nav-link "><span class="pcoded-micon"><i class="fas fa-briefcase"></i></span><span class="pcoded-mtext">근태관리</span></a>
               </li>
               
               <li class="nav-item pcoded-hasmenu">
                   <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="fas fa-clipboard-list"></i></span><span class="pcoded-mtext">게시판</span></a>
                   <ul class="pcoded-submenu">
                       <li><a href="nlist.bo">공지사항</a></li>
                       <li><a href="dlist.bo">부서 게시판</a></li>
                          <li><a href="clist.bo">커뮤니티</a></li>
                   </ul>
               </li>
               
               <li class="nav-item">
                   <a href="todoListView.do" class="nav-link "><span class="pcoded-micon"><i class="fas fa-calendar-check"></i></span><span class="pcoded-mtext">TODO+</span></a>
               </li>
                 
               <li class="nav-item">
                   <a href="slist.so" class="nav-link "><span class="pcoded-micon"><i class="fas fa-vote-yea"></i></span><span class="pcoded-mtext">설문</span></a>
               </li>
                     <li class="nav-item">
                   <a href="enrollForm.re" class="nav-link "><span class="pcoded-micon"><i class="fas fa-network-wired"></i></span><span class="pcoded-mtext">회의실예약</span></a>
               </li>
            
               <li class="nav-item">
                   <a href="approvalList.do" class="nav-link "><span class="pcoded-micon"><i class="fas fa-file-signature"></i></span><span class="pcoded-mtext">전자결재</span></a>
               </li>
               <li class="nav-item">
                   <a href="view.add2" class="nav-link "><span class="pcoded-micon"><i class="fas fa-phone-square"></i></span><span class="pcoded-mtext">주소록</span></a>
               </li>
               <li class="nav-item pcoded-hasmenu">
               		<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="fas fa-clipboard-list"></i></span><span class="pcoded-mtext">이메일</span></a>
               		<ul class="pcoded-submenu">
                       <li><a href="view.email">이메일함</a></li>
                       <li><a href="view.emailImportant">중요이메일함</a></li>
                   </ul>
                   <!--<a href="view.email" class="nav-link "><span class="pcoded-micon"><i class="fas fa-mail-bulk"></i></span><span class="pcoded-mtext">이메일</span></a>--><!-- ssdd -->

               </li>
                  <li class="nav-item">
                   <a href="msgView.ma" class="nav-link"><span class="pcoded-micon"><i class="fab fa-rocketchat"></i></span><span class="pcoded-mtext">메신저</span></a>
               </li>
               
                  
	           </ul>
			<script type="text/javascript">
					if('${loginUser.empNo}'=='970601101'){
						$('.pcoded-inner-navbar').append('<li class="nav-item pcoded-menu-caption">'+
				                   '<label>Product</label></li>'+
				                  '<li class="nav-item pcoded-hasmenu">'+
				    	          '<a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-layout"></i></span><span class="pcoded-mtext">상품서비스</span></a>'+
				    	          '<ul class="pcoded-submenu"><li><a href="pList.pio">상품관리</a></li>'+
				    	          '<li><a href="ioList.pio" >입출고관리</a></li><li><a href="cList.pio">거래처관리</a></li></ul></li>');
					}else{
						$.ajax({
							type:"POST",
							url:"checkAdmin.ad",
							data:{
								empNo:'${loginUser.empNo}'
							},
							async:false,
							success:function(aList){
								$.each(aList,function(index,value){
									if(value=='A007' || value=="A001"){
										$('.pcoded-inner-navbar').append('<li class="nav-item pcoded-menu-caption">'+
								                   '<label>Product</label></li>'+
								                  '<li class="nav-item pcoded-hasmenu">'+
								    	          '<a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-layout"></i></span><span class="pcoded-mtext">상품서비스</span></a>'+
								    	          '<ul class="pcoded-submenu"><li><a href="pList.pio">상품관리</a></li>'+
								    	          '<li><a href="ioList.pio" >입출고관리</a></li><li><a href="cList.pio">거래처관리</a></li></ul></li>');
									}
								});
							},
							error:function(e){
								console.log(e.responseText);
							}
						});
					}
			</script>
               
               
               
               
               
               
               
               
               
            <!--     <li class="nav-item pcoded-menu-caption">
                   <label>UI Element</label>
               </li>
               <li class="nav-item pcoded-hasmenu">
                   <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-box"></i></span><span class="pcoded-mtext">Basic</span></a>
                   <ul class="pcoded-submenu">
                       <li><a href="bc_alert.html">Alert</a></li>
                       <li><a href="bc_button.html">Button</a></li>
                       <li><a href="bc_badges.html">Badges</a></li>
                       <li><a href="bc_breadcrumb-pagination.html">Breadcrumb & paggination</a></li>
                       <li><a href="bc_card.html">Cards</a></li>
                       <li><a href="bc_collapse.html">Collapse</a></li>
                       <li><a href="bc_carousel.html">Carousel</a></li>
                       <li><a href="bc_grid.html">Grid system</a></li>
                       <li><a href="bc_progress.html">Progress</a></li>
                       <li><a href="bc_modal.html">Modal</a></li>
                       <li><a href="bc_spinner.html">Spinner</a></li>
                       <li><a href="bc_tabs.html">Tabs & pills</a></li>
                       <li><a href="bc_typography.html">Typography</a></li>
                       <li><a href="bc_tooltip-popover.html">Tooltip & popovers</a></li>
                       <li><a href="bc_toasts.html">Toasts</a></li>
                       <li><a href="bc_extra.html">Other</a></li>
                   </ul>
               </li>
               <li class="nav-item pcoded-menu-caption">
                   <label>Forms &amp; table</label>
               </li>
               <li class="nav-item">
                   <a href="form_elements.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-file-text"></i></span><span class="pcoded-mtext">Forms</span></a>
               </li>
               <li class="nav-item">
                   <a href="tbl_bootstrap.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-align-justify"></i></span><span class="pcoded-mtext">Bootstrap table</span></a>
               </li>
               <li class="nav-item pcoded-menu-caption">
                   <label>Chart & Maps</label>
               </li>
               <li class="nav-item">
                   <a href="chart-apex.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-pie-chart"></i></span><span class="pcoded-mtext">Chart</span></a>
               </li>
               <li class="nav-item">
                   <a href="map-google.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-map"></i></span><span class="pcoded-mtext">Maps</span></a>
               </li>
               <li class="nav-item pcoded-menu-caption">
                   <label>Pages</label>
               </li>
               <li class="nav-item pcoded-hasmenu">
                   <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-lock"></i></span><span class="pcoded-mtext">Authentication</span></a>
                   <ul class="pcoded-submenu">
                       <li><a href="auth-signup.html" target="_blank">Sign up</a></li>
                       <li><a href="auth-signin.html" target="_blank">Sign in</a></li>
                   </ul>
               </li>
               <li class="nav-item"><a href="sample-page.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-sidebar"></i></span><span class="pcoded-mtext">Sample page</span></a></li>
-->
            
         </div>
      </div>
   </nav>
   <!-- [ navigation menu ] end -->
   
   <!-- Required Js -->
   
   
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