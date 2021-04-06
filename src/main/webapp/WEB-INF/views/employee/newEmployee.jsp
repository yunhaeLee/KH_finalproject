<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<style>
td {
	height: 10px;
}
</style>
</head>

<body class=" ">

	<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp"></jsp:include>
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
								<li class="breadcrumb-item"><a href="adminMain.jsp"><i
										class="feather icon-home"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- [ breadcrumb ] end -->


			<div class="col-md-10 mx-auto">
				<div class="card mb-4">
					<div class="card-header">
						<h3>신규 사원 등록</h3>
					</div>
					<br>
					<br>
					<div class="card-body">


						<form name="newEmpForm" method="post" autocomplete="off">



							<table class="table table-bordered">

								<tr>
									<td style="width: 10%">이름</td>
									<td style="width: 40%"><input type="text"
										class="form-control form-control-sm" style="width: 40%"
										name="empName" id="empName"></td>
									<td style="width: 10%">주민번호</td>
									<td style="width: 40%">
										<div class="row">
											<div class="col-sm-4 mb-sm-0">
												<input type="text" id="resNo1" name="resNo1"
													class="form-control form-control-user" max="6">
											</div>
											<label>-</label>
											<div class="col-sm-4">
												<input type="text" id="resNo2" name="resNo2"
													class="form-control form-control-user">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="width: 10%">부서</td>
									<td style="width: 25%">
										<div class="row">
											<select class="form-control form-control-sm"
												style="width: 40%; margin: 0rem 1rem 0rem 1rem;"
												name="deptMain" id="deptMain">
												<option value="">상위부서선택</option>
												<c:forEach items="${ dList }" var="d">
													<c:if test="${ fn:length(d.deptCode) < 4}">
														<option value="${ d.deptCode }">${ d.deptName }</option>
													</c:if>
												</c:forEach>
											</select> <select class="form-control form-control-sm"
												style="width: 40%" name="deptCode" id="deptCode">
											</select>
										</div>
									</td>

									<td style="width: 10%">직급</td>
									<td style="width: 25%"><select
										class="form-control form-control-sm" style="width: 50%"
										name="jobCode" id="jobCode">
											<option value="">직급선택</option>
											<c:forEach items="${ jList }" var="j">
												<option value="${ j.jobCode }">${ j.jobName }</option>
											</c:forEach>
									</select></td>
								</tr>

								<tr>
									<td style="width: 10%">입사일</td>
									<td style="width: 25%"><input type="date" id="joinDate"
										name="joinDate" class="form-control form-control-user"
										style="width: 50%;"></td>
									<td style="width: 10%">개인번호</td>
									<td style="width: 25%"><input type="text" id="phone"
										name="phone" class="form-control form-control-user"
										placeholder="(-)포함 입력해주세요" style="width: 50%;"></td>

								</tr>


								<tr>
									<td style="width: 10%">내선번호</td>
									<td style="width: 25%"><input type="text" id="officePhone"
										name="officePhone" class="form-control form-control-user"
										placeholder="(-)포함 입력해주세요" style="width: 50%;"></td>
									</td>
									<td style="width: 10%">이메일</td>
									<td style="width: 25%">
										<div class="row">
											<div class="col-sm-4 mb-sm-0">
												<input type="text" id="email1" name="email1"
													class="form-control form-control-user" max="6">
											</div>
											<label>@</label>
											<div class="col-sm-4">
												<input type="text" id="email2" name="email2"
													class="form-control form-control-user">
											</div>
										</div>
									</td>
								</tr>


								<tr>
									<td style="width: 10%">주소</td>
									<td colspan="3">
										<div class="form-inline">
											<!-- 인라인 폼은 가로로 배열된 형태로 폼태그에 form-inling 클래스를 사용합니다.  -->
											<label> &nbsp; 우편번호 : </label> <input type="text" name="post"
												id="post" class="form-control mr-2 postcodify_postcode5"
												value="${ post }" style="width: 25%" readonly>
											<button type="button" class="btn btn-primary"
												id="postcodify_search_button">검색</button>

											<br>
											<br>
											<br> <label> &nbsp; 도로명주소 : </label> <input type="text"
												name="address1" id="address1"
												class="form-control postcodify_address"
												value="${ address1 }" style="width: 35%">
										</div>
										<br> <label> &nbsp;상세주소 : </label> <input type="text"
										name="address2" id="address2"
										class="form-control postcodify_extra_info"
										value="${ address2 }" style="width: 35%">
									</td>

								</tr>

							</table>
						</form>


						<!-- jQuery와 Postcodify를 로딩한다. -->
						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
					
							$(function() {
								$("#postcodify_search_button")
										.postcodifyPopUp();
							});
						</script>

						<!-- 등록하기 버튼 -->
						<a href="javascript:confirm();"
							class="btn btn-primary btn-icon-split"> <span
							class="icon text-white-50"> <i class="fas fa-check"></i>
						</span> <span class="text">등록하기</span>
						</a>

						<script>
						optionDeptSub();
						function optionDeptSub(){
							var subDept;
							$("#deptCode").children().remove();
							if($("#deptMain option:selected").val()=="D99"){
								$("#deptCode").append('<option value="'+$("#deptMain option:selected").val()+'">'+$("#deptMain option:selected").text()+'</option>');
							}else{
								$("#deptCode").append('<option value="">하위부서선택</option>');
								if($("#deptMain option:selected").val()!=""){
									console.log($("#deptMain option:selected").val());
									<c:forEach items="${ dList }" var="d">	
										<c:choose>
	                     					<c:when test="${ fn:length(d.deptCode) == 4 }">
	                     						subDept = '<c:out value="${fn:substring(d.deptCode,0,2)}"/>';
	                     						if(subDept==$("#deptMain option:selected").val()){
	                     							$("#deptCode").append('<option value="${ d.deptCode }">${ d.deptName }</option>');
	                     						}
	                     						</c:when>
		    			                    	<c:when test="${ fn:length(d.deptCode) == 5 }">
		    			                    	subDept = '<c:out value="${fn:substring(d.deptCode,0,3)}"/>';
		    			                    		if(subDept==$("#deptMain option:selected").val()){
		    			                    			$("#deptCode").append('<option value="${ d.deptCode }">${ d.deptName }</option>');
		                     						}
		    		                    		</c:when>
		    			                    </c:choose>
		    		                    </c:forEach>
								}
							}
						}
						$("#deptMain").change(function() {
							optionDeptSub();
						});
							function confirm() {
								var empName = $("#empName").val();
								var resNo = $("#resNo").val();
								var resNo1 = $("#resNo1").val();
								var resNo2 = $("#resNo2").val();
								var deptCode = $("#deptCode").val();							
								var jobCode = $("#jobCode").val();
								var joinDate = $("#joinDate").val();
								var phone = $("#phone").val();
								var officePhone = $("#officePhone").val();						
								var email1 = $("#email1").val();
								var email2 = $("#email2").val();
								var post = $("#post").val();
								var address1 = $("#address1").val();
								var address2 = $("#address2").val();
								if (empName == "") {
									alert("이름이 입력되지 않았습니다!");
									$("$input").focus();
									return;
								}
								if (resNo1 == ""|| resNo2 == "") {
									alert("주민번호를 입력해주세요!");
									$("#resNo1").focus();
									$("#resNo1").val("");
									$("#resNo2").val("");
									return;
								}
								if (isNaN(resNo1)||isNaN(resNo2)){
									alert("주민번호는 숫자만 입력해주세요!");
									$("#resNo1").focus();
									$("#resNo1").val("");
									$("#resNo2").val("");
									return;
								}
								if (deptCode == "") {
									alert("부서를 선택하여 주세요!");
									return;
								}
								if (jobCode == "") {
									alert("직급을 선택하여 주세요!");
									return;
								}
								if (joinDate == "") {
									alert("입사일은 비어있을수 없습니다!");
									return;
								}
								if (phone == "" ) {
									alert("개인번호를 확인해주세요!");
									$("#phone").focus();
									$("#phone").val("");
							
									return;
								}
								if (officePhone == "" ) {
									alert("내선번호를 확인해주세요!");
									$("#officePhone").focus();
									$("#officePhone").val("");
								
									return;
								}
								if (email1 == "" || email2 == "") {
									alert("이메일을 확인해주세요!");
									$("#email1").focus();
									$("#email1").val("");
									$("#email2").val("");
									return;
								}
								if (post == "") {
									alert("우편번호를 입력해주세요!");
									$("#post").focus();
									$("#post").val("");
									return;
								}

								document.newEmpForm.method = "post";
								document.newEmpForm.action = "insertEmp.do";
								document.newEmpForm.submit();
							}
						</script>
					</div>
				</div>


			</div>
			<!--지우지 마세요    div class="row"  -->
		</div>
		<!--지우지 마세요   div class="pcoded-content"  -->
	</div>
	<!--지우지 마세요    div class="pcoded-main-container"  -->
	<!-- [ Main Content ] 메인화면 끝 -->




	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>