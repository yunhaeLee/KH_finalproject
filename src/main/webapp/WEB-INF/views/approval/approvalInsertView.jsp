<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>



  <link rel="stylesheet " href= "${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  
  <!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">

<!--자동완성  -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

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

					   <strong>결재종류 : </strong>
					   <select name="formNo" id="formNo" class="form-control form-control-sm" style="width:20%;"  >
							<option value="">분류</option>
		                     <option value="1" style="color : black;">휴가계</option>
		                     <option value="2" style="color : black;">연장근무신청</option>
		                     <option value="3" style="color : black;">출장품의서</option>
		                    <option value="3" style="color : black;">채용요청서</option>
		                     <option value="4" style="color : black;">지출결의서</option>
                  	      </select>
					   <br>
					   
						   <strong>기안자 : </strong><input type="text" class="form-control" value="${loginUser.empName}(${loginUser.empPosition} ${loginUser.deptName} )"  readonly style="">
						   <input type="hidden" class="form-control" value="${loginUser.empNo}"  name="empNo"  id="empNo" >
					   </div>
					   <div class="row">
				
						   <div class="form-group col-lg-6">
						    	<strong>결재자 : </strong><input type="text" class="form-control"  value="${firstApprEmp.empName} ${firstApprEmp.empPosition}"  readonly>
						        	      <input type="hidden" class="form-control" value="${firstApprEmp.empNo}"  name="firstApprEmp" id="firstApprEmp" >
						   </div>
					
						   <div class="form-group col-lg-6">
						    	<strong>최종결재자 : </strong><input type="text" class="form-control" value="${lastAppEmp.empName} 대표이사 " readonly>
						    	    <input type="hidden" class="form-control" value="${lastAppEmp.empNo}"  name="lastAppEmp" id="lastAppEmp" >
						    
						   </div>
					
					    </div>
					  <div class="form-group">
					    	<input type="text" class="form-control" name="approvalTitle" id="approvalTitle"placeholder="제목을 입력해주세요" autocomplete="off" required>
					   	</div>
					   
				
					   
						 <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="urgent" value="긴급">
                       <label class="form-check-label" for="exampleCheck1" style="color:red; " >긴급</label>
                       </div>
					  

					  
				  <div class="form-group">
						    <textarea class="form-control" id="summernote" name="approvalContent" maxlength="140" rows="7" autocomplete="off"></textarea>
						 </div>
			         
			          
			          
                     <input type="file" class="form-control" id="uploadFile" name="uploadFile">
                  
			          
			          <br><br>	  
					  <div class="row"  style= "float:right;">
						  <div id="buttons">
							  <button type="submit" id="submitBtn" class="btn btn-primary" >전송</button>
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
    

	
	$(document).on('click','#submitBtn',function(){
		
		var formNo = $("#formNo").val();
		var approvalTitle = $("#approvalTitle").val();
		var summernote = $("#summernote").val();
		
		
		if (formNo == "") {
			alert("결재종류를 선택해 주세요!");
			$("#formNo").focus();
			return false;
		}
		if (approvalTitle == "") {
			alert("제목을 입력해주세요!");
			$("#approvalTitle").focus();
			$("#approvalTitle").val("");
			
			return false;
		}

		if (summernote == "") {
			alert("내용을 입력해 주세요!");
			$("#summernote").focus();
			$("#summernote").val("");
			return false;
		}
	
		if(confirm("정말로 제출하시겠습니까?\n기안 후엔 수정이 불가능합니다.")){
	
		document.form.method = "post";
		document.form.action = "insertApproval.do";
		document.form.submit();
		
		}else{
			return false;
		}
	});
    </script>
    
    
    

    
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
    
    
   	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>