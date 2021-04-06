<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- Favicon icon -->
 <link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
  <!-- CSS -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar/assets/css/fullcalendar.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar/assets/css/fullcalendar.print.css' rel='stylesheet' media='print' />
</head>

<body class="">
 
   <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
   <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
<!--메인 화면 전체시작 -->
   <div class="pcoded-main-container">
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
 
 				<form action="send.emailgo" method="post" id="goEmailSend">
    				<input type="hidden" name="eno" id ="eno" value="${loginUser.empNo}">
    			</form>
    			
    			<form action="view.emailImportant" method="post" id="goEmailImportant">
    				<input type="hidden" name="eno" id ="eno" value="${loginUser.empNo}">
    			</form>
 
 
 <!-- [ stiped-table ] start -->
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>주소록</h5>
                        <span class="d-block m-t-5">
                        <div class="card-body">
                        <input type="email" class="form-control" id="Email" aria-describedby="emailHelp" value="">
                        	<br>
                        	<button type="button" class="btn  btn-secondary">검색하기</button>
                        	<!-- <a href="send.emailgo"><button type="submit" class="btn  btn-primary">보내기</button></a>-->
                        	<button type="button" class="btn  btn-primary" onclick="$('#goEmailSend').submit();">내 주소록</button></a>
                        	<a href="view.emailImportant"><button type="button" class="btn  btn-primary">임시상세</button></a>
                        	
                        </div>
                        </span>
                        
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th>시간</th>
                                        <th>보낸사람</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>커피말인데</td>
                                        <td>10시까지 회사앞 커피집으로 와라</td>
                                        <td>9:40</td>
                                        <td>E0002</td>
                                    </tr>
                                    <tr>
                                        <td>도너츠말인데</td>
                                        <td>10시까지 회사앞 커피집으로 와라</td>
                                        <td>9:20</td>
                                        <td>E0002</td>
                                    </tr>
                                    <tr>
                                        <td>핫밀크말인데</td>
                                        <td>10시까지 회사앞 커피집으로 와라</td>
                                        <td>9:31</td>
                                        <td>E0002</td>
                                    </tr>
                                    <tr>
                                        <td>핫쵸코말인데</td>
                                        <td>10시까지 회사앞 커피집으로 와라</td>
                                        <td>9:39</td>
                                        <td>E0002</td>
                                    </tr>
                                    <tr>
                                        <td>양념치킨말인데</td>
                                        <td>10시까지 회사앞 커피집으로 와라</td>
                                        <td>9:30</td>
                                        <td>E0002</td>
                                    </tr>
                                    <tr>
                                        <td>퇴근하고말이야</td>
                                        <td>21시까지 회사앞 맥주집으로 와라 어딘지는 알거야</td>
                                        <td>9:30</td>
                                        <td>E0003</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ stiped-table ] end -->





 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->


    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>