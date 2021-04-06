<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                         	<li class="breadcrumb-item"><a href="clist.bo">커뮤니티</a></li>
                         	<li class="breadcrumb-item"><a href="dlist.bo">부서 게시판</a></li>
                        </ul>
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
		<form id="boardForm" role="form" action="dupdate.bo" method="post" enctype="multipart/form-data">
			<div class="card shadow mb-4">
            	<div class="card-header py-3">
               		<h5>${loginUser.deptName} 게시판</h5>
           		</div>
                  		
           	<!-- 폼 컨텐츠 영역 -->
				  <div class="card-body">
					  <div class="form-group">
					  <select name="dboardCategory" id="dboardCategory" class="form-control form-control-sm" style="width:10%;" >
							<option value="">분류</option>
		                     <option value="긴급" style="color : black;">긴급</option>
		                     <option value="알림" style="color : black;">알림</option>
		                     <option value="공지" style="color : black;">공지</option>
		                     <option value="일반" style="color : black;">일반</option>
                  		</select>

					    <input type="text" class="form-control" id="dboardTitle" name="dboardTitle" value="${db.dboardTitle}" required>
					  	 <input type="hidden" name="dboardNo" value="${ db.dboardNo }">
					  	 <input type="hidden" name="dboardWriter" id="dboardWriter" value="${loginUser.empName}">
						 <input type="hidden" name="deptCode" id="deptCode" value="${loginUser.deptName}">
						   
					  </div>
					  
					   <div class="form-group">
						    <textarea class="form-control" id="summernote" name="dboardContent" maxlength="140" rows="7">${ db.dboardContent }</textarea>
						  </div>
						
						  
					  <div class="row">
						  <div id="buttons">
							  <button type="submit" class="btn btn-primary">등록</button>
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