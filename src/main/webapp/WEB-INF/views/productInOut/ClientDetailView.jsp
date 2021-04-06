<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <!-- data tables css -->
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
   padding:0.5rem !important;
   }
label{
	margin:0rem !important;
}
.modal-lg{
	max-width:1000px !important;
}

.table td, .table th {
	border-top: none !important;
	border-bottom : 1px solid #e2e5e8;
	padding:1.2rem 0.75rem !important;
	
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
                        <h3>상세보기</h3>
                    </div>
                    <div class="card-body">
                        <div class="dt-responsive table-responsive">
                            <table class="table table-detail " id="clientDetail"  align="center">
		                    	<tr>
		                    		<td style="width:7%">거래처코드</td>
		                    		<td style="width:3%; text-align:center">:</td>
		                            <td colspan="4">${client.cliNo}</td>
		                        </tr><tr>
		                            <td>거래처명</td>
		                            <td style="text-align:center">:</td>
		                            <td colspan="4">${client.cliName}</td>
		                        </tr><tr>
		                        	<td>구분</td>
		                        	<td style="text-align:center">:</td>
		                            <td colspan="4">${client.sortation}</td>
		                        </tr><tr>
		                            <td>사업자등록번호</td>
		                            <td style="text-align:center">:</td>
		                            <td colspan="4">${client.corporateNo}</td>
		                        </tr><tr>
		                            <td>담당자</td>
		                            <td style="text-align:center">:</td>
		                            <td>${client.master}</td>
		                            <td style="width:7%">연락처</td>
		                            <td style="width:3%;text-align:center">:</td>
		                            <td>${client.phone}</td>
		                        </tr><tr>
		                            <td>주소</td>
		                            <td style="text-align:center">:</td>
		                            <td colspan="4">${client.address}</td>
		                        </tr><tr>
		                             <td>비고</td>
		                             <td style="text-align:center">:</td>
		                             <td colspan="4">${client.comment}</td>
		                        </tr>
							</table>
                        </div>
                        <div class="btns" align="center">
                        	<button type="button" class="btn btn-light"  onClick="location.href='cList.pio'">목록으로</button>
                    		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#clientUpdate">수정하기</button>
                    		<button type="button" onclick="$('#deleteForm').submit();" class="btn btn-danger">삭제하기</button>
                		</div>
                    </div>
                </div>
            </div>
            <form action="deleteClient" method="post" id="deleteForm" onsubmit="return deletecheck();">
   				<input type="hidden" name = "cliNo" id="cliNo" value="${client.cliNo}">
   	 		</form>
            <!-- Basic Button table end -->

 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->
    <div class="modal fade" id="clientUpdate">  
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">수정하기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
				<form name="clientUpdate" action="updateClient" method="post" autocomplete="off" onsubmit="return check();">
					<table class="table table-bordered table-detail "  align="center">
                    	<tr>
                    		<td style="width:15%">거래처코드</td>
                            <td style="width:34%"><input type="text" name="cliNo" class="form-control form-control-sm" style="width:70%" readonly value="${client.cliNo}"></td>
                            <td style="width:15%">거래처명</td>
                            <td style="width:34%"><input type="text" name="cliName" class="form-control form-control-sm" style="width:70%" value="${client.cliName}"></td>
                        </tr><tr>
                        <td style="width:15%">구분</td>
                            <td style="width:20%">
                            	<input type="radio" name="sortation" value="입고" checked onclick="return(false);">
                    			<label for="in">IN</label> &nbsp;&nbsp;
                    			<input type="radio" name="sortation" value="출고" checked onclick="return(false);">
                    			<label for="out">OUT</label></td>
                            <td style="width:20%">사업자등록번호</td>
                            <td style="width:20%"><input type="text" name="corporateNo"  class="form-control form-control-sm" style="width:80%" value="${client.corporateNo}"></td>
                        </tr><tr>
                             <td>담당자</td>
                             <td><input type="text" name="master" class="form-control form-control-sm"style="width:50%" value="${client.master}"></td>
                            <td>연락처</td>
                            <td><input type="text" name="phone"  class="form-control form-control-sm" style="width:80%" placeholder="(-)포함 입력해주세요" value="${client.phone}"></td>
                        </tr><tr>
                            <td>주소</td>
                            <td colspan="3">
			             		<div class="form-inline">
								<label> &nbsp; 우편번호 : &nbsp;</label>
								<c:forTokens var="addr" items="${ client.address }" delims="/" varStatus="status">
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
								<input type="text"  name="post" class="form-control mr-2 postcodify_postcode5" value="${ post }" size="6" readonly >
								<button type="button" class="btn btn-primary" id="postcodify_search_button" style="padding:0.3rem 0.625rem">검색</button>
								</div>
								<br>
								<div class="form-inline">
								<label> &nbsp; 도로명주소 : </label>
								<input type="text" name="address1" class="form-control postcodify_address" value="${ address1 }" size="60">
								</div>
								<br>
								<div class="form-inline">
							    <label> &nbsp; 상세주소 : </label>
								<input type="text" name="address2" class="form-control postcodify_extra_info" value="${ address2 }" size="60">
								</div>
							</td>
                        </tr><tr>
                             <td>비고</td>
                             <td colspan="3"><input type="text" name="comment" class="form-control form-control-sm" value="${client.comment}"></td>
                        </tr>
					</table>
					<div class="modal-footer">
                    	<button type="submit" class="btn btn-primary">수정하기</button>
                    	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                	</div>
				</form>	
			</div>
            </div>
        </div>
    </div>
	
    
    <jsp:include page="../common/footer.jsp"/>
    
	<script>
	 $('#clientUpdate').on('show.bs.modal', function (event) {
         $("input[name='sortation'][value='${client.sortation}']").attr('checked',true);
       
      });  
	function check() {
		var name=document.clientUpdate;
		
		if(name.cliName.value==""){
			$(name.cliName).attr("placeholder","거래처명을 입력해주세요");
			name.cliName.focus();
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
		}else if(confirm("수정하시겠습니까?")){
			return true;
		}else{
			return false;
		}
		
	}
    function deletecheck(){
      if(confirm("삭제 후 복구가 불가능 합니다. 그래도 삭제하시겠습니까?")) {
      	return true;
      }
      return false;
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
</body>
</html>
	                                    