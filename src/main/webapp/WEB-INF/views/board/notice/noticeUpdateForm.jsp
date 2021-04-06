<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>


 <!-- Favicon icon -->
 <link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
  
   

<style type="text/css">
	#buttons button{
		margin: 5em;
		display: inline-block;
		margin-left: auto;
		margin-right: auto;
	}
	#buttons{
		display: inline-block;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
</style>
</head>

<body class="">
 
   <jsp:include page="/WEB-INF/views/common/adminSidebar.jsp"/>
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
                        
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  
  
	<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->

	
	<!-- 메인레버 -->
	<div id="wrapper">

		<!-- 컨텐츠 영역 -->
		<div class="container-fluid">
		
		<!-- 타이틀 영역 -->
		
			<div class="card shadow mb-4">
            	<div class="card-header py-3">
               		<h5>공지사항</h5>
           		</div>
           		
           	<!-- 폼 컨텐츠 영역 -->
           	<form id="updateForm" method="post" action="nupdate.bo" enctype="multipart/form-data">
				  <div class="card-body">
					  <div class="form-group">
					  
						<input type="hidden" name="noticeNo" value="${ n.noticeNo }">
					    <input type="text" class="form-control" id="subject" name="noticeTitle" value="${ n.noticeTitle }" required>
						
					  </div>
					    <div class="form-group">
						    <textarea class="form-control" id="summernote" name="noticeContent" maxlength="140" rows="7">${ n.noticeContent }</textarea>
						  </div>
						  
						   <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
                            <c:if test="${ !empty n.originName }">
	                                                               현재 업로드된 파일 : ${ n.originName } <br>
	                            <input type="hidden" name="changeName" value="${ n.changeName }">
	                            <input type="hidden" name="originName" value="${ n.originName }">
                            </c:if>
                            
					  <div class="row">
						  <div id="buttons">
							  <button type="submit" class="btn btn-primary">수정</button>
							  <button type="button" onclick="javascript:history.back();" class="btn btn-secondary">취소</button>
						  </div>
					  </div>
					  
				 </div>
				 </form>
				</div>
		</div>
	
	</div> <!--지우지 마세요    div class="row"  -->
	</div> <!--지우지 마세요   div class="pcoded-content"  -->
	</div> <!--지우지 마세요    div class="pcoded-main-container"  -->
	
	
	<!-- [ Main Content ] 메인화면 끝 -->

 	<script type="text/javascript">
 	
    $(document).ready(function() {

    	$('#summernote').summernote({
    		  height: 500,        
    		  minHeight: null,      
    		  maxHeight: null,        
    		  focus: true,    
    		  lang: "ko-KR",	
    		  placeholder: '최대 2048자까지 쓸 수 있습니다.',
    		  
    		  toolbar: [
    			    // [groupName, [list of button]]
    			    ['fontname', ['fontname']],
    			    ['fontsize', ['fontsize']],
    			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    			    ['color', ['forecolor','color']],
    			    ['table', ['table']],
    			    ['para', ['ul', 'ol', 'paragraph']],
    			    ['height', ['height']],
    			    ['insert',['picture','link']],
    			    ['view', ['fullscreen', 'help']]],
    		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    	});
    });
    
    
    
    
    </script>

    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    
</body>
</html>