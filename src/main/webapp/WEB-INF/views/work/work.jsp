<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <!-- Favicon icon -->
 <link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
  <!-- CSS -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar/assets/css/fullcalendar.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar/assets/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<head>

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
                            <li class="breadcrumb-item"><a href="#!">My Portal</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  
  
<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->
<div class="row">
 
 
 
 
 <!-- [ stiped-table ] start -->
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>주소록</h5>
                        <span class="d-block m-t-5">
                        <div class="card-body">
                        <input type="email" class="form-control" id="Email" aria-describedby="emailHelp" placeholder="검색">
                        	<br>
                        	<button type="button" class="btn  btn-secondary">검색하기</button>
                        	<button type="button" class="btn  btn-primary">휴가계</button>
                        	<a href="view.workMain"><button type="button" class="btn  btn-primary">임시 메인</button></a>
                        	<a href="view.workMain2"><button type="button" class="btn  btn-primary">임시 메인2</button></a>
                        	<input type="hidden" name="empNo" value="${loginUser.empNo}">
                        </div>
                        </span>
                        
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>사번</th>
                                        <th>출근시간</th>
                                        <th>퇴근시간</th>
                                        <th>주누적</th>
                                        <th>주초과</th>
                                        <th>주잔여</th>
                                        <th>현재날짜</th>
                                        <th>지각유무</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>E0001</td>
                                        <td>9:00</td>
                                        <td>18:00</td>
                                        <td>9:00</td>
                                        <td>0:00</td>
                                        <td>31:00</td>
                                        <td>21/03/06</td>
                                        <td>N</td>
                                    </tr>
                                    <tr>
                                        <td>E0001</td>
                                        <td>9:00</td>
                                        <td>18:00</td>
                                        <td>18:00</td>
                                        <td>0:00</td>
                                        <td>22:00</td>
                                        <td>21/03/06</td>
                                        <td>N</td>
                                    </tr>
                                    <tr>
                                        <td>E0001</td>
                                        <td>9:00</td>
                                        <td>18:00</td>
                                        <td>27:00</td>
                                        <td>0:00</td>
                                        <td>13:00</td>
                                        <td>21/03/06</td>
                                        <td>N</td>
                                    </tr>
                                    <tr>
                                        <td>E0001</td>
                                        <td>9:00</td>
                                        <td>18:00</td>
                                        <td>36:00</td>
                                        <td>0:00</td>
                                        <td>4:00</td>
                                        <td>21/03/06</td>
                                        <td>N</td>
                                    </tr>
                                    <tr>
                                        <td>E0001</td>
                                        <td>9:00</td>
                                        <td>18:00</td>
                                        <td>45:00</td>
                                        <td>5:00</td>
                                        <td>0:00</td>
                                        <td>21/03/06</td>
                                        <td>N</td>
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