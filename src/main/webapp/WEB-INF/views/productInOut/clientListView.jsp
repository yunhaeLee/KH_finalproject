<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
 <!-- data tables css -->
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/plugins/dataTables.bootstrap4.min.css">
 <style>
 .btn-primary{
	background-color: #B8ACD0 !important;
    border-color: #B8ACD0 !important;
}
.btn{
	padding:0.5rem 0.95rem !important;
}
 .modal-content .table td{
   line-height: 35px!important;
   }
.table-hover>tbody>tr:hover{
		cursor:pointer
}
#clientAdd .table td, .table th{
	padding :0.5rem;
}
label{
	margin:0rem !important;
}
.modal-lg{
	max-width:1000px !important;
}
 </style>
</head>

<body class="">
   <jsp:include page="../common/sidebar.jsp"/>
   <jsp:include page="../common/topbar.jsp"/>
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
            <!-- Basic Button table start -->
            <div class="col-sm-10 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h3>거래처관리</h3>
                    </div>
                    <div class="card-body">
                        <div class="dt-responsive table-responsive">
                            <table id="clientList" class="table table-hover row-border  nowrap">
                                <thead>
                                    <tr>
                                    	<th style="width: 13%;">거래처코드</th>
	                                    <th style="width: 17%;">거래처명</th>
	                                    <th style="width: 23%;">사업자등록번호</th>
	                                    <th style="width: 10%;">담당자</th>
	                                    <th style="width: 17%;">연락처</th>
	                                    <th style="width: 8%;">입출고</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Basic Button table end -->

 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->
	 <div class="modal fade"  id="clientAdd">  
        <div class="modal-dialog modal-lg modal-dialog-centered ">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">거래처추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
				<form name="newClient" action="insertClient" method="post" autocomplete="off" onsubmit="return check('newClient');">
					<table class="table table-bordered  "  align="center">
                    	<tr>
                    		<td style="width:15%">거래처코드</td>
                            <td style="width:20%"><input type="text" name="cliNo" id="cliNo" class="form-control form-control-sm" style="width:70%" readonly></td>
                            <td style="width:15%">거래처명</td>
                            <td style="width:40%"><input type="text" name="cliName" class="form-control form-control-sm" style="width:80%"></td>
                        </tr><tr>
                        <td style="width:15%">구분</td>
                            <td style="width:20%"><input type="radio" name="sortation" value="입고">
                    			<label for="in">IN</label> &nbsp;&nbsp;
                    			<input type="radio" name="sortation" value="출고">
                    			<label for="out">OUT</label></td>
                            <td style="width:20%">사업자등록번호</td>
                            <td style="width:20%"><input type="text" name="corporateNo" class="form-control form-control-sm" style="width:90%"></td>
                        </tr><tr>
                             <td>담당자</td>
                             <td><input type="text" name="master" class="form-control form-control-sm"style="width:80%"></td>
                            <td>연락처</td>
                            <td><input type="text" name="phone" class="form-control form-control-sm" style="width:70%" placeholder="(-)포함 입력해주세요"></td>
                        </tr><tr>
                            <td>주소</td>
                            <td colspan="3">
			             		<div class="form-inline">
								<label> &nbsp; 우편번호 : &nbsp;</label>
								<input type="text"  name="post" class="form-control mr-2 postcodify_postcode5" value="${ post }" size="6" readonly >
								<button type="button" class="btn btn-primary" id="postcodify_search_button" style="padding:0.3rem 0.625rem">검색</button>
								</div>
								<br>
								<div class="form-inline">
								<label> &nbsp; 도로명주소 : </label>
								<input type="text" name="address1" class="form-control postcodify_address" value="${ address1 }" size="70">
								</div>
								<br>
								<div class="form-inline">
							    <label> &nbsp; 상세주소 : </label>
								<input type="text" name="address2" class="form-control postcodify_extra_info" value="${ address2 }" size="70">
								</div>
							</td>
                        </tr><tr>
                             <td>비고</td>
                             <td colspan="3"><input type="text" name="comment" class="form-control form-control-sm" style="width:90%"></td>
                        </tr>
					</table>
					<div class="modal-footer">
                    	<button type="submit" class="btn btn-primary">추가하기</button>
                    	<button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
                	</div>
				</form>	
			</div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    
	<script>
	$(document).ready(function() {
		var table = $('#clientList').DataTable({
			columnDefs: [
                { orderable: false, targets: [2,3,4] },
                { searchable: false, targets: [5]}
              ],
	        dom: '<"float-left"B><"float-right"f>rt<"float-left"i><"float-right"p>',
	        buttons: [{
	            text: '거래처추가',
	            className: 'btn-primary',
	            action: function(e, dt, node, config) {
	            	$.ajax({
	    		        type:"POST",  
	    		        url:"createClientNo",  
	    		        async:false,
	    		        success:function(code){
	    		        	$("#clientAdd #cliNo").val(code);
	    		        	$("#clientAdd").modal("show");
	    		        },   
	    		        error:function(e){  
	    		            console.log(e.responseText);  
	    		        }
	    			});
	            	
	            }
	        }],
	        language: {
          	  zeroRecords: "거래처가 존재하지 않습니다."
            },
	        ajax : {
                url :"selectClientList"
                ,type : "POST"
                ,dataType : "JSON"
                },
            columns : [
               {data: "cliNo"},
               {data: "cliName"},
               {data: "corporateNo"},
               {data: "master"},
               {data: "phone"},
               {data: "sortation"}
               ]
	    });
		
		$(document).on('click', '#clientList tbody tr', function() {
			location.href="detailClient?cliNo=" + $(this).children().eq(0).text();
	    });
	});
	
	function check() {
		var name=document.newClient;
			
		if(name.cliName.value==""){
			$(name.cliName).attr("placeholder","거래처명을 입력해주세요");
			name.cliName.focus();
			return false;
		}else if(name.sortation.value==""){
			alert("입/출고를 선택해주세요.");
			return false;
		}else if(name.corporateNo.value==""){
			$(name.corporateNo).attr("placeholder","사업자등록번호를 입력해주세요");
			name.corporateNo.focus();
			return false;
		}else if(name.master.value==""){
			$(name.master).attr("placeholder","담당자를  입력해주세요");
			name.master.focus();
			return false;
		}else if(name.phone.value==""){
			name.phone.focus();
			return false;
		}else if((name.phone.value).indexOf("-") == -1) {
			alert("연락처 형식을 잘못입력했습니다.");
			return false;
		}else if(name.post.value==""){
			alert("주소를 입력해주세요.");
			return false;
		}else if(confirm("추가하시겠습니까?")){
			return true;
		}else{
			return false;
		}
		
	}
	</script>
	<!-- jQuery와 Postcodify를 로딩한다. -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function(){
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/buttons.bootstrap4.min.js"></script>
</body>
</html>
	                                    