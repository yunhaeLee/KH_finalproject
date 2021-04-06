<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
   padding: 0.75rem !important;
   }
.table-hover>tbody>tr:hover{
		cursor:pointer
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
	<div class="col-sm-10 mx-auto" >
    	<div class="card" >
        	<div class="card-header">
            	<h3>상품관리</h3>
            </div>
            <div class="card-body">
                <div class="dt-responsive table-responsive">
                    <select class="form-control form-control-sm" style="width:15%; margin:0rem 1rem 2rem 0rem;"
                    name="selectC" id="selectC" onchange="selectpList()">
                        <option value="">거래처선택</option>
						<c:forEach items="${ cList }" var="c">
							<c:if test="${c.sortation eq '입고' }">
								<option value="${ c.cliNo }">${ c.cliName }</option>
							</c:if>	
						</c:forEach>
					</select>
                    <table id="productList" class="table table-hover row-border  nowrap">
	                    <thead>
	                        <tr>
	                            <th style="width: 15%;">상품코드</th>
	                            <th style="width: 20%;">상품명</th>
	                            <th style="width: 10%;">입고단가</th>
	                            <th style="width: 10%;">출고단가</th>
	                            <th style="width: 10%;">재고</th>
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


<div class="modal fade" id="productAdd">  
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
		<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">상품추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
            <div class="modal-body">
				<form name="newProduct" action="insertProduct" method="post" autocomplete="off"onsubmit="return check();">
					<table class="table table-bordered"  align="center">
						<tr>
							<td>거래처명</td>
                    		<td><select class="form-control form-control-sm" style="width: 40%;"
								name="cliNo" id="cliNo" >
									<option value="">--선택--</option>
									<c:forEach items="${ cList }" var="c">
										<c:if test="${c.sortation eq '입고' }">
											<option value="${ c.cliNo }">${ c.cliName }</option>
										</c:if>	
									</c:forEach>
								</select>
							</td>
						</tr><tr>
                        	<td style="width:20%">상품코드</td>
                            <td><input type="text" name="proNo" id="proNo"class="form-control form-control-sm" style="width:40%" readonly></td>
                        </tr><tr>
                            <td style="width:20%">상품명</td>
                            <td><input type="text" name="proName" class="form-control form-control-sm" style="width:40%"></td>
                        </tr><tr>
                            <td style="width:20%">입고단가</td>
                            <td><input type="text" name="inPrice" class="form-control form-control-sm"style="width:25%;float:left"><span>원</span></td>
                        </tr><tr>
                            <td style="width:20%">출고단가</td>
                            <td><input type="text" name="outPrice" class="form-control form-control-sm" style="width:25%;float:left"><span>원</span></td>
                        </tr><tr>
                            <td style="width:20%">비고</td>
                            <td><input type="text" name="comment" class="form-control form-control-sm"></td>
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
		$("#selectC").val("");
		selectpList();	
	});
	$(document).on('click', '#productList tbody tr', function() {
		if($(this).children().eq(0).text()!="상품이 존재하지 않습니다."){
			location.href="detailProduct?proNo=" + $(this).children().eq(0).text();
		}
		
    });
	
	$("#cliNo").change(function() {
		$("#productAdd #proNo").val("");
		console.log($(this).val());
		var cliNo = $(this).val();
		if(cliNo != ""){
			$.ajax({
		        type:"POST",  
		        url:"createProductNo",  
		        async:false,
		        data:{cliNo:cliNo},
		        success:function(result){
		        	$("#productAdd #proNo").val(result);
		        },   
		        error:function(e){  
		            console.log(e.responseText);  
		        }
			});
		}			
	});
	
	function selectpList(){
		var table=$('#productList').DataTable({
        	destroy : true,
            columnDefs: [
                { orderable: false, targets: [4] },
                { searchable: false, targets: [2,3,4]}
              ],
              dom: '<"float-left"B><"float-right"f>rt<"float-left"i><"float-right"p>',
            buttons: [{
                text: '상품추가',
                className: 'btn-primary',
                action: function(e, dt, node, config) {
                	$("#productAdd").modal("show");
                }
            },{
                text: '전체삭제',
                className: 'btn-danger',
                action: function(e, dt, node, config) {
                	if(confirm("전체 삭제 후 복구 할 수 없습니다. 정말로 삭제할까요?")){
                		$.ajax({
        			        type:"POST",  
        			        url:"deleteAllProduct",  
        			        async:false,
        			        data:{cliNo:$("#selectC").val()},
        			        success:function(result){
        			     		if(result>0){
        			     			alert("삭제가 완료되었습니다.");
        			     			selectpList();
        			     		}else{
        			     			alert("삭제를 실패하였습니다.");
        			     		}
        			        }
        				});
                	}
                }
            }],language: {
          	  zeroRecords: "상품이 존재하지 않습니다."
            },
	        ajax : {
                url :"selectProductList"
                ,type : "POST"
                ,data:{cliNo:$("#selectC").val()}
                ,dataType : "JSON"
                },
            columns : [
               	{data: "proNo"},
               	{data: "proName"},
               	{data: "inPrice",
                   	render: function(data, type, row){
                         if(type=='display') data = data+"원";
                         return data;}},
               	{data: "outPrice",
                   	render: function(data, type, row){
                         if(type=='display') data = data+"원";
                         return data;}},
               	{data: "stock",
						render: function(data, type, row){
                       		if(type=='display') data = data+"개";
                            return data;}}
               ]
	    });
		$("#productList").hide();
		$("#productList").fadeIn(1000);
	}
	$('.modal').on('hidden.bs.modal', function (e) {
	    $(this).find('form')[0].reset()
	});
	function check() {
		var name=document.newProduct;
		console.log(name.cliNo.value);
		if(name.cliNo.value==""){
			alert("거래처를 선택해주세요.");
			return false;
		}else if(name.proName.value==""){
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
		}else if(confirm("추가하시겠습니까?")){
			return true;
		}else{
			return false;
		}
		
	}
	</script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.responsive.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/responsive.bootstrap4.js"></script>
</body>
</html>