<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>

<body class="">

	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp"></jsp:include>
	<!--메인 화면 전체시작 -->
	<div class="pcoded-main-container">


		<div class="pcoded-content">



			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header">
						<h3>마이페이지</h3>
					</div>
					<br>
					<br>
						
					<div class="row">
					
					
								<div class="col-2" style="margin-left:10%;">
								<div class="list-group" id="list-tab" role="tablist">
								<a class="list-group-item list-group-item-action active"
										id="list-updatePwd-list" data-toggle="list"
										href="#list-updatePwd" role="tab" aria-controls="home">비밀번호변경</a>
									<a class="list-group-item list-group-item-action "
										id="list-updateForm-list" data-toggle="list"
										href="#list-updateForm" role="tab" aria-controls="profile">내정보</a>
									
								
								</div>
							</div>
	 			
                   <div class="tab-content" id="nav-tabContent">

					
<!-- 비밀번호변경 시작 (사번으로 비교)-->
      <c:if test="${loginUser.empPwd eq loginUser.empNo }">
					<div class="tab-pane fade show active" id="list-updatePwd" role="tabpanel" 	aria-labelledby="list-updatePwd-list" style="margin-left:10%; margin-bottom:20%; " >

						<form id="updatePwdForm" action="updatePwd.me" method="post">


							<h5>- 비밀번호 변경 -</h5>
							<hr>
							<table align="center">
								<tr>
									<td><label>현재 비밀번호 </label>
									<td><input type="password" class="form-control"
										name="currentPwd" id="userPwd" placeholder="현재 비밀번호 입력"></td>
								</tr>
								<tr>
									<td><label>새 비밀번호</label></td>
									<td><input type="password" class="form-control"
										name="newPwd" placeholder="새 비밀번호 입력"></td>
								</tr>
					
							</table>


							<br> <br>

							<div class="btns" align="center">
								<button type="submit" id="updatePwdBtn" class="btn btn-primary btn-primary">변경하기</button>
							</div>
							</form>
							</div>
</c:if>
<!-- 비밀번호변경 끝 -->

<!-- 인코딩 비번변경 (암호화후 비교)  -->
    <c:if test="${loginUser.empPwd ne loginUser.empNo }">
					<div class="tab-pane fade show active" id="list-updatePwd" role="tabpanel" 	aria-labelledby="list-profile-list" style="margin-left:10%; margin-bottom:20%; " >

						<form id="updatePwd" action="updatePwdenc.me" method="post">


							<h5>- 비밀번호 변경 -</h5>
							<hr>
							<table align="center">
								<tr>
									<td><label>현재 비밀번호</label>
									<td><input type="password" class="form-control"
										name="currentPwd" id="userPwd" placeholder="현재 비밀번호 입력"></td>
								</tr>
								<tr>
									<td><label>새 비밀번호</label></td>
									<td><input type="password" class="form-control"
										name="newPwd" placeholder="새 비밀번호 입력"></td>
								</tr>
					
							</table>


							<br> <br>

							<div class="btns" align="center">
								<button type="submit" id="updatePwdBtn" class="btn btn-primary btn-primary">변경하기</button>
							</div>
							</form>
							</div>
							
	</c:if>						
<!-- 인코딩 비번변경끝 - -->
<script type="text/javascript">





</script>						
						
						
<!-- 마이페이지시작  -->						
	<div class="card-body tab-pane fade " id="list-updateForm"
						role="tabpanel" aria-labelledby="list-home-list">
   
  
      
      
						<form action="update.me" method="post"  enctype="multipart/form-data">

				           
                             
                               <input type="hidden" name="empNo" value="${loginUser.empNo }">
							<table class="table table-bordered" style="width:900px">
							
                               	<tr >
                               	
									<td style="height: 50px; " >사진 </td>
									<td  >
									     
				                         <img  id="titleImg"  border="1px" width="120" height="120" border="1px" src="${pageContext.request.contextPath}/resources/upload_files/${loginUser.changeName}" > 
				                         <div id="filearea" >
				                         <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" >
				                         	                       
				                         
				                                     <c:if test="${ !empty loginUser.originName }">
	                                                               현재 업로드된 파일 : ${ loginUser.originName } <br>
	                            <input type="hidden" name="changeName" value="${ loginUser.changeName }">
	                            <input type="hidden" name="originName" value="${ loginUser.originName }">
	                            
                            </c:if> 
				                         </div>
				                           <label>클릭하여 프로필 사진을 넣어주세요!</label> 
				                         </td>
									
								</tr>
								<tr>
									<td style="width: 10%">이름</td>
									<td style="width: 40%"><input type="text"
										class="form-control form-control-user" id="empName" name="empName" style="width: 40%" value="${loginUser.empName}" readonly></td>
								</tr>
								<tr>
									 <td style="width:10%">개인번호</td>
                                 <td style="width:25%">
										
											<input type="text" id="phone" name="phone" class="form-control form-control-user" value="${loginUser.phone}" placeholder="(-)포함 입력해주세요"style="width: 50%" >
								</td>


								</tr>

								<tr>
									<td style="width: 10%">부서(팀)</td>
									<td style="width: 40%"><input type="text"
										class="form-control"  name="deptName" id="deptName" value="${loginUser.deptName}" readonly style="width: 40%"></td>

								</tr>
								<tr>
									<td style="width: 10%">직급</td>
									<td style="width: 40%"><input type="text"
										class="form-control" name="empPosition" id="empPosition" value="${loginUser.empPosition}" readonly style="width: 40%"></td>
								</tr>


								<tr>
									<td style="width: 10%">내선번호</td>
									<td style="width: 40%">
									
											
												<input type="text" id="officePhone1" name="officePhone"
													class="form-control form-control-user"  value="${loginUser.officePhone}" readonly style="width: 50%">
		
								</tr>
								<tr>
									<td style="width: 10%">이메일</td>
									<td style="width: 40%">
									
											
												<input type="email" id="email" name="email"
													class="form-control form-control-user"  value="${loginUser.email}" style="width: 50%">
										
										
									</td>
								</tr>
						              <tr>
                                 <td style="width:10%">주소</td>
                                 <td colspan="3">       
				             		<div class="form-inline"><!-- 인라인 폼은 가로로 배열된 형태로 폼태그에 form-inling 클래스를 사용합니다.  -->
									<label> &nbsp; 우편번호 :  </label>
									           		<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
											<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
												<c:set var="post" value="${ addr }"/>
											</c:if>
											<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
												<c:set var="address1" value="${ addr }"/>
											</c:if>
											<c:if test="${ status.index eq 1 }">
												<c:set var="address1" value="${ addr }"/>
											</c:if>
											<c:if test="${ status.index eq 2 }">
												<c:set var="address2" value="${ addr }"/>
											</c:if>
										</c:forTokens>
									<input type="text"  name="post" class="form-control mr-2 postcodify_postcode5" value="${ post }" style="width:25%">
									<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
									
									<br><br><br>
									<label> &nbsp; 도로명주소 : </label>
									<input type="text" name="address1" class="form-control postcodify_address" value="${ address1 }" style="width:35%">
								    </div><br>
								    <label> &nbsp;상세주소 : </label>
									<input type="text" name="address2" class="form-control postcodify_extra_info" value="${ address2 }" style="width:35%">
				                	</td>
                     
                                </tr>

							</table>
					
						
						
						<!-- jQuery와 Postcodify를 로딩한다. -->
						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
					
							$(function() {
								$("#postcodify_search_button")
										.postcodifyPopUp();
							});
						</script>
					

					<!-- 등록하기 버튼 -->
						<button type="submit" class="btn btn-primary"> <i class="fas fa-check"></i> 수정하기</button> 
						
						</form>		



</div>
      <script>
	$(function() {
		$("#filearea").hide();
		$("#titleImg").click(function(){
			$("#file1").click();
		});

	});
	
	
	function loadImg(inputFile, num) {// 이미지 미리보기 
		//inputFile : 현재 변화가 생긴 input type = "file"
		//num : 조건문을 활용 하기 위해 전달받은 매개변수

		console.dir(inputFile);

		if (inputFile.files.length == 1) {//file이 존재 할경우 
			var reader = new FileReader();// 파일을 읽어들이 FileReader객체를 생성 

			reader.readAsDataURL(inputFile.files[0]);//파일을 읽어주는 메소드  --> 해당 파일을 읽어서 url을 부여 (문자열로 저장 )

			reader.onload = function(e) {//파일 읽기가 다완료 되면 실행할 메소드 
				switch (num) {

				case 1 : $("#titleImg").attr("src", e.target.result); break;
		
				}
			};

		}
	}
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




	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>