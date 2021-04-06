<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>



<link rel="stylesheet "
	href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">

</head>

<body class="">

	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp"></jsp:include>
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
								<li class="breadcrumb-item"><a href="index.jsp"><i
										class="feather icon-home"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- [ breadcrumb ] end -->


			<div class="row">


				<div class="col-md-10">
					<div class="card">
						<div class="card-header">
							<h3>결재서류 상세보기</h3>
						</div>
						<div class="card-body">
					
                              
								<div class="form-group">
								 <strong>결재종류 : </strong>
								   <input type="text" class="form-control"
										value="${ap.formName} "
										name="formName" readonly>
									<strong>기안자 : </strong><input type="text" class="form-control"
										value="${ap.empName} ( ${ap.deptName} ${ap.empPosition}) "
										name="empNo" readonly>
								</div>
								<div class="row">
									<div class="form-group col-lg-6">
										<strong>결재자 : </strong><input type="text" class="form-control"
											value="${firstApprEmp.empName} ${firstApprEmp.deptName} ${firstApprEmp.empPosition}"
											name="approvalEmp" readonly>
									</div>
									<div class="form-group col-lg-6">
										<strong>최종결재자 : </strong><input type="text"
											class="form-control" value="${lastAppEmp.empName} 대표이사"
											name="hEmp" readonly>
									</div>

								</div>
								<div class="form-group">
									<strong>제목 : </strong><input type="text" class="form-control"
										name="apTitle" value="${ap.approvalTitle }" autocomplete="off"
										readonly>
								</div>




								<div>
									<strong>내용 : </strong>
								</div>
								<hr>
								<div class="form-group" style="height: 500px;">
									${ap.approvalContent }</div>
                    <div class="form-group">
                        <strong>첨부파일 : </strong>
                        <c:if test="${ !empty ap.originalName  }">
						
                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${ap.changeName}" download="${ap.originalName }">${ ap.originalName  }</a>
                        </c:if>
                        <c:if test="${ empty ap.originalName  }">
                        	첨부파일이 없습니다.
                        </c:if>
   	                   </div>
								<div class="row">
								              	<button type="button"
												onclick="location.href='approvalList.do'"
												class="btn btn-primary" style="float: right">목록으로</button>
							
									<div id="buttons" style="margin-left: 80%;">
						   	  <c:if test="${(sessionScope.loginUser.empNo eq ap.firstApprEmp) && (ap.status ne 'A')  }">
										<button type="button" id="confirm"
											onclick="postFormSubmit(1)"
											class="btn btn-success">승인</button>
											
											<button type="button" id="reject"
											onclick="postFormSubmit(2)"
											class="btn btn-danger">반려</button>	
											
											</c:if>	
     					   	  <c:if test="${ (sessionScope.loginUser.jobCode eq 'J10') && (ap.status ne 'C')   }">
											
										<button type="button" id="confirm"
											onclick="postFormSubmit(3)"
											class="btn btn-success">승인</button>		
											
												<button type="button" id="reject"
											onclick="postFormSubmit(2)"
											class="btn btn-danger">반려</button>
                            </c:if>
									</div> <!--  버튼그룹 끝  -->
							<form id="postForm"  method="post">
								<input type="hidden" name="ano" value="${ap.approvalNo}">
					       
							
							
							</form>		
									
							<script type="text/javascript">
							function postFormSubmit(num) {
								var postForm =$("#postForm");
								if(num==1){
									postForm.attr("action","updateStatus.do");
								}if(num==2) {
									postForm.attr("action","updateRStatus.do");
								}if(num==3){
									postForm.attr("action","updateCStatus.do");
									
								}
						
							}
							
							</script>
							<script>
							$(document).on('click','#confirm',function(){
								if(confirm("정말로 승인하시겠습니까?\n승인 후엔 복구가 불가능합니다.")){
									$("#postForm").submit();
								}else{
									return false;
								}					
							});
							
							
							$(document).on('click','#reject',function() {
								if(confirm("정말로 반려하시겠습니까?\n반려 후엔 복구가 불가능합니다.")){
									$("#postForm").submit();
								}else {
									return false;
								}					
							});
							
							</script>
							
							
							
								
								</div>
						
						

						</div>

					</div>
				</div>


			</div>
			<!--지우지 마세요    div class="row"  -->
		</div>
		<!--지우지 마세요   div class="pcoded-content"  -->
	</div>
	<!--지우지 마세요    div class="pcoded-main-container"  -->
	<!-- [ Main Content ] 메인화면 끝 -->


	<script type="text/javascript">
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				height : 300, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

			});
		});
	</script>


	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>