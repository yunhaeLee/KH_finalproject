<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



  <link rel="stylesheet " href= "${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  
  <!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">

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
                            <li class="breadcrumb-item"><a href="index.jsp"><i class="feather icon-home"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  

<div class="row">
 

			<div class="col-md-12">
			<div class="card">
			<div class="card-header"><h3 >결재 서류</h3> </div>
				  <div class="card-body">
				  	<form action="insertApproval.do" method="post" enctype="Multipart/form-data" id="form">
					  
					   <div class="form-group">
						   <strong>기안자 : </strong><input type="text" class="form-control" value="${loginUser.empNo} (${loginUser.empName})" name="empNo" readonly>
					   </div>
					   <div class="row">
						   <div class="form-group col-lg-6">
						    	<strong>결재자 : </strong><input type="text" class="form-control" value="${gEmp}" name="approvalEmp" readonly>
						   </div>
						   <div class="form-group col-lg-6">
						    	<strong>최종결재자 : </strong><input type="text" class="form-control" value="${hEmp}" name="hEmp" readonly>
						   </div>
					
					    </div>
					  <div class="form-group">
					    	<input type="text" class="form-control" name="apTitle" placeholder="제목을 입력해주세요" autocomplete="off" required>
					   	</div>
					   
						 <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                       <label class="form-check-label" for="exampleCheck1">긴급</label>
                       </div>
					  
					
					  
				  <div class="form-group">
						    <textarea class="form-control" id="summernote" name="apContent" maxlength="140" rows="7" autocomplete="off"></textarea>
						 </div>
			         
			          
			          
                     <input type="file" class="form-control" id="" name="">
                  
			          
			          <br><br>	  
					  <div class="row">
						  <div id="buttons">
							  <button type="button" id="submitBtn" class="btn btn-primary">전송</button>
							  <button type="button" onclick="location.href='approvalList.do'" class="btn btn-danger">취소</button>
						  </div>
					  </div>
					 </form>
				
 </div>

		 </div>		
 </div>


 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->


    <script type="text/javascript">
    

    $(document).ready(function() {
    	//여기 아래 부분
    	$('#summernote').summernote({
    		  height: 300,                 // 에디터 높이
    		  minHeight: null,             // 최소 높이
    		  maxHeight: null,             // 최대 높이
    		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
    		  lang: "ko-KR",					// 한글 설정
    		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
              
    	});
    });
    
    </script>
    
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
    
    
   	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>