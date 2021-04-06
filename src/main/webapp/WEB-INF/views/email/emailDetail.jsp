<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
#emailContent{ 
	height:800px; 
    resize:none;

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
 
 
 			<form id="EmailResend" action="resend.emailgo" method="post">
 			<input type="hidden" name="emailNo" value="${e.emailNo}">
 				<input type="hidden" class="form-control" id="empNo" name="empNo" value="${ e.emailReceive }">
 				<input type="hidden" class="form-control" id="emailTitle" name="emailTitle" value="${e.emailTitle}">
 				<input type="hidden" class="form-control" id="emailSendEmail" name='emailSendEmail' value="${e.emailReceiveEmail}">
 				<input type="hidden" class="form-control" id="emailContent" name="emailContent" value="${e.emailContent}">
 			</form>
 
 
 
 
 <!-- [ Main Content ] start -->
        
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>이메일 확인</h5>
                    </div>
                    <div class="card-body">
                        <form id="EmailDelete" action="delete.email" method="post">
                            <div class="row">
                                <div class="col-sm-9">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">보낸사람</label>
                                        <input type="hidden" name="emailReceiveEmail" value="${emailInfo2.emailEmail}">
                                        <input type="text" class="form-control" id="empNo" name="empNo" value="${ e.emailReceive }" readonly="readonly">
                                    </div>
                                </div>
                                
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text"></label>
                                        <label class="form-control">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

                                        </label>
                                        <!--
                                        <input type="radio" class="form-control" id="emailImportant" name="emailImportant" value="Y">Y
                                        <input type="radio" class="form-control" id="emailImportant" name="emailImportant" value="N">N
                                        -->
                                    </div>
                                </div>
                                
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="floating-label" for="Email">이메일</label>
                                        <input type="hidden" name="emailNo" value="${e.emailNo}">
                                        <input type="hidden" name="emailReceive" value="${e.empNo}">
                                        <input type="email" class="form-control" id="emailSendEmail" name='emailSendEmail' aria-describedby="emailTitle" value="${e.emailReceiveEmail}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">제목</label>
                                        <input type="text" class="form-control" id="emailTitle" name="emailTitle" value="${e.emailTitle}" readonly="readonly">
                                    </div>
                                </div>
                                
                                
                                
                            </div>
                            
                            
                            
                            
                            <div class="row">
                            
                                <div class="input-group">
                            	<div class="input-group-prepend">
                                <span class="input-group-text">내용</span>
                           	 	</div>
                            	<textarea id="emailContent" name="emailContent" class="form-control" aria-label="With textarea" readonly="readonly">${e.emailContent}</textarea>
                        		</div>
                        
                        	</div>
                        
                        
                        	<div class="row" id="center">
                        	<div class="col-md-12">
                        	
                        	
                        	<!--
                        	<input type="hidden" name="empNo" value="${emailInfo.empNo}">
                        	<input type="hidden" name="emailEmail" value="${emailInfo.emailEmail}">
                        	<input type="hidden" name="emailId" value="${emailInfo.emailId}">
                        	<input type="hidden" name="emailPwd" value="${emailInfo.emailPwd}">
                        	<input type="hidden" name="emailHost" value="${emailInfo.emailHost}">
                        	<input type="hidden" name="emailPort" value="${emailInfo.emailPort}">
                        	-->
                        	

							<div class="card-body">
								<button type="button" class="btn  btn-primary btn-lg" onclick="$('#EmailDelete').submit();">삭제하기</button></a>
								<button type="button" class="btn  btn-primary btn-lg" onclick="$('#EmailResend').submit();">답장하기</button></a>
							</div>

								</div>
                      		</div>
                        
                        
                            
                        </form>
                    </div>
                </div>
           
      <!--  -->



 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->


    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>