<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
<!-- [ Header ] start -->
	<header class="navbar pcoded-header navbar-expand-lg navbar-light header-blue">
		

				<div class="m-header">
					<a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
					<a href="index.jsp" class="b-brand">
						<!-- ========   change your logo hear   ============ -->
						<img src="${pageContext.request.contextPath}/resources/ablePro/assets/images/logo.png" alt="" class="logo">
						<img src="${pageContext.request.contextPath}/resources/ablePro/assets/images/logo-icon.png" alt="" class="logo-thumb">
					</a>
					<a href="#!" class="mob-toggler">
						<i class="feather icon-more-vertical"></i>
					</a>
				</div>
				<div class="collapse navbar-collapse">
					
					<ul class="navbar-nav ml-auto">
						
						<li>

							<div class="dropdown drp-user">
							
							
								<c:if test="${ !empty sessionScope.loginUser }">
								<a >  ${sessionScope.loginUser.empName}님 환영합니다</a>	</c:if>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="feather icon-user"></i>
									
								</a>
							
								<div class="dropdown-menu dropdown-menu-right profile-notification">
									<div class="pro-head">
									<c:if test="${ !empty sessionScope.loginUser }">
										           <c:if test="${sessionScope.loginUser.changeName eq null }">
								                  <img class="img-radius" src="${pageContext.request.contextPath}/resources/ablePro/assets/images/user/profile.png" alt="User-Profile-Image">
								                   </c:if>
								                 <c:if test="${sessionScope.loginUser.changeName ne null }">
								                  <img class="img-radius" src="${pageContext.request.contextPath}/resources/upload_files/${sessionScope.loginUser.changeName}" alt="User-Profile-Image">
								                  </c:if>
										<span>${sessionScope.loginUser.empName}님</span>
										<a href="logout.me" class="dud-logout" title="Logout">
										<i class="feather icon-log-out"></i>
										</a>
										</c:if>
									</div>
									<ul class="pro-body">
									
										<li><a href="mypage.do" class="dropdown-item"><i class="feather icon-user"></i> 마이 페이지</a></li>
										<li><a href="msgView.ma" class="dropdown-item"><i class="feather icon-message-circle"></i> 메신저</a></li>
										<li><a href="" class="dropdown-item"><i class="feather icon-mail"></i> 이메일</a></li>
										<li><a href="adminMain.ad" onclick="return adminCheck();"class="dropdown-item"><i class="feather icon-settings"></i> 관리자</a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
				
			<script type="text/javascript">
			function adminCheck(adminNo){
				var type=false;
				if('${loginUser.empNo}'=='970601101'){
					return true;
				}else{
					$.ajax({
						type:"POST",
						url:"checkAdmin.ad",
						data:{
							empNo:'${loginUser.empNo}'
						},
						async:false,
						success:function(admin){
							console.log("admin : "+admin);
							if(admin==""){
								type = false;
							}
							else{
								console.log("adminNo : "+adminNo);
								if(typeof adminNo == "undefined" ){
									type = true;
								}else{
									$.each(admin,function(index,value){
										if(value==adminNo || value=='A001'){
											type = true;
											return false;
										}
									});
								}
								
							}
						},
						error:function(e){
							console.log(e.responseText);
						}
						
					});
					if(type==false){
						alert("권한이 없습니다.");
					}
					return type;
				}
				
			}
			</script>
	</header>
	<!-- [ Header ] end -->
</body>
</html>