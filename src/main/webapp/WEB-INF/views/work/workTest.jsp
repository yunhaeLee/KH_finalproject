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
#boardList {
	text-align: center;
}

#boardList>tbody>tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}
/* #pagingArea a{color:black} */
#searchForm {
	width: 80%;
	margin: auto;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

.select {
	width: 20%;
}

.text {
	width: 53%;
}

.searchBtn {
	Width: 20%;
}
</style>
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
 
 
 
 
 <!-- [ stiped-table ] start -->
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>출근기록</h5>
                        <span class="d-block m-t-5">
                        <div class="card-body">
                        <!--
									<input type="text" class="form-control" id="Email" aria-describedby="emailHelp" value="123">
                        			<br>
                        			<button type="button" class="btn  btn-secondary">검색하기</button>
                        		-->
                        	<!--<button type="button" class="btn  btn-primary">휴가계</button>-->
                        	<a href="view.workMain2"><button type="button" class="btn  btn-primary">임시 메인</button></a>
                        	
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
                                        <th>요일</th>
                                    </tr>
                                </thead>
                                <tbody>
										<c:forEach items="${ list }" var="w">
											<tr>
												<td>${ w.empNo }</td>
												<!--
												<td><fmt:formatDate value="${w.workStart}" pattern="yyyy-MM-dd"/></td>
												<td><fmt:formatDate value="${w.workEnd}" pattern="yyyy-MM-dd"/></td>
												-->
												
												<td>${ w.workStart }</td>
												<td>${ w.workEnd }</td>
												
												
												<td>
												<fmt:parseNumber integerOnly="true" value="${(w.workStack/60)}"/>시
												<fmt:parseNumber integerOnly="true" value="${(w.workExceed/60)%60}"/>분
												</td>
												<td>
												<fmt:parseNumber integerOnly="true" value="${(w.workExceed/60)}"/>시
												<fmt:parseNumber integerOnly="true" value="${(w.workExceed/60)%60}"/>분<!-- (w.workExceed/60)%60 -->
												</td>
												<td>
												<fmt:parseNumber integerOnly="true" value="${(w.workRemain/60)}"/>시
												<fmt:parseNumber integerOnly="true" value="${(w.workRemain/60)%60}"/>분
												</td>
												
												
												<!--
												<td>${ w.workStack }</td>
												<td>${ w.workExceed }</td>
												<td>${ w.workRemain }</td>
												-->
												<td>${ w.workDate }</td>
												<td>${ w.status }</td>
												<td>${ w.workDay }</td>
											</tr>
										</c:forEach>
									</tbody>
                            </table>
                        </div>
                    </div>
                    
                    
                    
                    <div id="pagingArea">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<li class="page-item"><a class="page-link"
									href="view.work?currentPage=${ pi.currentPage-1 }"><div class="feather icon-chevron-left"></div></a></li><!--이전페이지 -->
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href=""><div class="feather icon-chevron-left"></div></a></li>
							</c:otherwise>
						</c:choose>

						<!-- ㅇㅁㄴㅇㅁ노암닝ㅁ너ㅣㅏ어ㅣㅁ넝ㅁ너ㅏ암너         이제 번호 클릭이동 -->
						
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<li class="page-item"><a class="page-link"
										href="view.work?currentPage=${ p }">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><a class="page-link"
										href="">${ p }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<li class="page-item"><a class="page-link"
									href="view.work?currentPage=${ pi.currentPage+1 }"><div class="feather icon-chevron-right"></div></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="view.work?currentPage=${ pi.currentPage+1 }"><div class="feather icon-chevron-right"></div></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
                    
                    
                    
                    
                </div>
            </div>
            <!-- [ stiped-table ] end -->


			<!-- 원래 페이징 -->
	

				<br clear="both">
				<br> <br>
				<br>
				
				
			</div>
			<br>
			<br>






 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->




<script>
    	$(function(){
    		$("#boardList tbody tr").click(function(){
    			location.href="detail.bo?bno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>


    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>