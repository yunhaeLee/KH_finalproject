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
   padding:0.75rem !important;
   }
.table-hover>tbody>tr:hover{
		cursor:pointer
}
.table td, .table th {
	border-top: none !important;
	border-bottom : 1px solid #e2e5e8;
	padding:1.25rem 0.75rem !important;
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
                        <h3>상품 상세보기</h3>
                    </div>
                    <div class="card-body">
                        <div class="dt-responsive table-responsive">
						<table class="table  table-detail"  align="center">
						<tr>
                        	<td style="width:7%">거래처명</td>
                        	<td style="width:3%; text-align:center">:</td>
                            <td colspan="4">${product.cliName}</td>
                        </tr>
						<tr>
                        	<td>상품코드</td>
                        	<td style="text-align:center">:</td>
                            <td colspan="4">${product.proNo}</td>
                        </tr><tr>
                            <td>상품명</td>
                            <td style="text-align:center">:</td>
                            <td colspan="4">${product.proName}</td>
                        </tr><tr>
                             <td>총입고수량</td>
                             <td style="text-align:center">:</td>
                             <td>${product.inStock}개</td>
                             <td>입고단가</td>
                             <td style="text-align:center">:</td>
                             <td>${product.inPrice}원</td>
                        </tr><tr>
                             <td>총출고수량</td>
                             <td style="text-align:center">:</td>
                             <td>${product.outStock}개</td>
                             <td style="width:7%">출고단가</td>
                             <td style="width:3%;text-align:center">:</td>
                             <td>${product.outPrice}원</td>
                        </tr><tr>
                             <td>재고</td>
                             <td style="text-align:center">:</td>
                             <td colspan="4">${product.stock}개</td>
                        </tr><tr>
                             <td>비고</td>
                             <td style="text-align:center">:</td>
                             <td colspan="4">${product.comment}</td>
                        </tr>
						</table>
					<div class="btns" align="center">
                    	<button type="button" class="btn btn-light"  onClick="location.href='pList.pio'">목록으로</button>
                    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#productUpdate">수정하기</button>
                    	<button type="button" onclick="$('#deleteForm').submit();" class="btn btn-danger">삭제하기</button>
                	</div>
				</div>
                    </div>
                </div>
            </div>
            <form action="deleteProduct" method="post" id="deleteForm" onsubmit="return deletecheck();">
   				<input type="hidden" name = "proNo" id="proNo" value="${product.proNo}">
   	 		</form>
            <!-- Basic Button table end -->

 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->
    <div class="modal fade" id="productUpdate">  
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">상세보기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
				<form name="productUpdate" action="updateProduct" method="post" autocomplete="off" onsubmit="return check();">
					<table class="table table-bordered table-detail"  align="center">
						<tr>
                        	<td style="width:20%">거래처이름</td>
                            <td><input type="text" name="cliName" class="form-control form-control-sm" style="width:40%" value="${product.cliName}" readonly></td>
                        </tr><tr>
                        	<td style="width:20%">상품코드</td>
                            <td><input type="text" name="proNo" class="form-control form-control-sm" style="width:40%" value="${product.proNo}" readonly></td>
                        </tr><tr>
                            <td style="width:20%">상품명</td>
                            <td><input type="text" name="proName" class="form-control form-control-sm" style="width:40%" value="${product.proName}"></td>
                        </tr><tr>
                             <td style="width:20%">입고단가</td>
                             <td><input type="text" name="inPrice" class="form-control form-control-sm" style="width:25%;float:left" value="${product.inPrice}"><span>원</span></td>
                        </tr><tr>
                             <td style="width:20%">출고단가</td>
                             <td><input type="text" name="outPrice" class="form-control form-control-sm" style="width:25%;float:left" value="${product.outPrice}"><span>원</span></td>
                        </tr><tr>
                             <td style="width:20%">비고</td>
                             <td><input type="text" name="comment" class="form-control form-control-sm" value="${product.comment}"></td>
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
	function check() {
		var name=document.productUpdate;
		
		if(name.proName.value==""){
			$(name.proName).attr("placeholder","상품명을 입력해주세요");
			name.proName.focus();
			return false;
		}else if(name.inPrice.value==""){
			$(name.inPrice).attr("placeholder","입고단가를 입력해주세요");
			name.inPrice.focus();
			return false;
		}else if(name.outPrice.value==""){
			$(name.outPrice).attr("placeholder","출고단가를  입력해주세요");
			name.outPrice.focus();
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
	                                    