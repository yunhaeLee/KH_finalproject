<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <!-- data tables css -->
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/plugins/dataTables.bootstrap4.min.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/plugins/select.dataTables.min.css">

 <style>
#inoutList td,th{
	padding:0.75rem !important;
	vertical-align: middle;
	}	
.select-checkbox:before {
    margin-top: 0px !important;
}
.btn-primary{
	background-color: #B8ACD0 !important;
    border-color: #B8ACD0 !important;
}

.modal-content .table td{
   line-height: 35px!important;
   }
.table-hover>tbody>tr:hover{
		cursor:pointer
}
.btn-sm{
	padding:0.2rem, 0.5rem !important;
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
	<div class="col-sm-12">
		<div class="card">
			<div class="card-header">
				<h3>입출고관리</h3>
			</div>
			<div class="card-body">
				<div class="dt-responsive table-responsive">
					<div>
						<span style=" float:left;padding: 0.3rem 0rem;margin: 0rem 0.5rem 1rem 0rem">거래처선택 :</span>
						<select class="form-control form-control-sm" style="width:18%; margin:0rem 1rem 1rem 0rem; float:left;"
                   		name="selectC" id="selectC" onchange="selectpList('selectC')">
                        	<option value="">전체</option>
							<c:forEach items="${ cList }" var="c">
								<c:if test="${c.sortation eq '입고' }">
									<option value="${ c.cliNo }">${ c.cliName }</option>
								</c:if>	
							</c:forEach>
						</select>
						<span style=" float:left;padding: 0.3rem 0rem;margin: 0rem 0.5rem 1rem 0rem">상품선택 :</span>
						<select class="form-control form-control-sm" style="width:18%; margin:0rem 1rem 1rem 0rem;"
						name="selectP" id="selectP" onchange="selectioList()">
							<option value="">전체</option>
						</select>
					</div>
					<script>
					function selectpList(cSelect) {
						var pSelect;
						if(cSelect=='selectC'){
							pSelect = 'selectP';
						}else{
							pSelect = 'proNo';
						}
						$('#'+pSelect).children('option:not(:first)').remove();
						var cliNo = $('#'+cSelect).val();
						<c:forEach items="${ pList }" var="p">
							if(cliNo==""){
								$('#'+pSelect).append('<option value="${ p.proNo }">${p.proNo} [${ p.proName }]</option>');
							}else{
								if('${p.cliNo}' == cliNo ){
									$('#'+pSelect).append('<option value="${ p.proNo }">${p.proNo} [${ p.proName }]</option>');
								}
							}
						</c:forEach>
						selectioList();
						}
					</script>
                    <table id="inoutList"  class="table table-hover row-border  nowrap inout" >
                    	<thead>
                        	<tr>
                            	<th>입출고번호</th>
                                <th style="width: 13%;">입출고일자</th>
	                            <th style="width: 5%;">구분</th>
	                            <th style="width: 17%;">거래처명</th>
	                            <th style="width: 25%;">상품명</th>
	                            <th style="width: 10%;">수량</th>
	                            <th style="width: 12%;">금액</th>
	                            <th style="width: 5%;">취소</th>
	                            <th style="width: 13%;">비고</th>
	                            
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->
<div class="modal fade" id="inoutAdd">  
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
		<!-- Modal Header -->
			<div class="modal-header">
            	<h4 class="modal-title">입출고추가</h4>
            	<button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
            <div class="modal-body">
				<form name="newInout" action="insertInout" method="post" autocomplete="off" onsubmit="return check();">
					<table class="table table-bordered  "  align="center">
                    	<tr>
                        	<td style="width:20%">입출고일자</td>
                            <td><input type="date" id="inoutDate" name="inoutDate"  class="form-control form-control-sm" style="width:40%"></td>
                        </tr><tr>
                            <td style="width:20%">구분</td>
                            <td><input type="radio" name="sortation" id="in" value="입고">
                    			<label for="in">IN</label> &nbsp;&nbsp;
                    			<input type="radio" name="sortation" id="out" value="출고">
                    			<label for="out">OUT</label></td>
                        </tr><tr>
                           <td>상품명</td>
                    		<td><select class="form-control form-control-sm" style="width: 40%; float:left; margin-right:3rem;"
								name="incliNo" id="incliNo" onchange="selectpList('incliNo')">
									<option value="">--거래처--</option>
									<c:forEach items="${ cList }" var="c">
										<c:if test="${c.sortation eq '입고' }">
										<option value="${ c.cliNo }">${ c.cliName }</option>
										</c:if>	
									</c:forEach></select>
								<select class="form-control form-control-sm" style="width: 40%;"
								name="proNo" id="proNo" onchange="changePrice()" >
									<option value="">--상품선택--</option>
								</select>
							</td>
                        </tr><tr>
                            <td>출고거래처명</td>
                    		<td><select class="form-control form-control-sm" style="width: 40%;"
								name="cliNo" id="cliNo" disabled>
									<option value="">--선택--</option>
									<c:forEach items="${ cList }" var="c">
										<c:if test="${c.sortation eq '출고' }">
										<option value="${ c.cliNo }">${ c.cliName }</option>
										</c:if>	
									</c:forEach>
								</select>
							</td>
							
                        </tr><tr>
                            <td style="width:20%">수량</td>
                            <td><input type="text" name ="quantity" id ="quantity" class="form-control form-control-sm"style="width:25%;float:left;">
                            <label id="stockLabel">출고가능 수량 : <span id="stock"></span>개</label></td>                    
                        </tr><tr>
                            <td style="width:20%">금액</td>
                            <td><input type="text" name ="price" id = "price" class="form-control form-control-sm" style="width:25%;float:left" readonly><span>원</span></td>
                        </tr><tr>
                            <td style="width:20%">비고</td>
                            <td><input type="text" name ="comment" id = "comment" class="form-control form-control-sm"></td>
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
 		$("#selectP").val("");
 		$("#stockLabel").hide();
 		selectpList("selectC");
		
		
	});
 	
 	function selectioList(){
 		var table =$('#inoutList').DataTable({
 			destroy : true,
			columnDefs: [
		        {
		        	visible: false, targets :0
		        },
                { orderable: false, targets: [0,5,6,7,8]},
                { searchable: false, targets: [0,1,2,5,6,7,8]}

              ],
		        order: [[ 1, 'desc' ]],
              dom: '<"float-left"B><"float-right"f>rt<"float-left"i><"float-right"p>',
	        buttons: [{
	            text: '입출고 추가',
	            className: 'btn-primary',
	            action: function(e, dt, node, config) {
	            	selectpList("incliNo");
	            	$("#inoutAdd").modal("show");
	            }
	        }],language: {
          	  zeroRecords: "입출고내역이 존재하지 않습니다."
            },
	        ajax : {
                url :"selectInoutList"
                ,type : "POST"
                ,data:{cliNo:$("#selectC").val(),
                	proNo:$("#selectP").val()}
                ,dataType : "JSON"
                },
            columns : [
               	{data: "inoutNo"},
               	{data: "inoutDateS"},
               	{data: "sortation"},
               	{data: "cliName"},
               	{data: "proNo",
					render: function(data, type, row){
                   		if(type=='display') data = data+'['+row['proName']+"]";
                        	return data;}},
               	{data: "quantity",
						render: function(data, type, row){
                       		if(type=='display') data = data+"개";
                            	return data;}},
                {data: "price",
        			render: function(data, type, row){
                    	if(type=='display') data = data+"원";
                        	return data;}},
                {data: "status",
                	render: function(data, type, row){
                    	if(type=='display'){
                        	if(data == 'Y'){
                            	data = '<button type="button" onclick="location.href=\'deleteInout?proNo='+row['proNo']+'&inoutNo='+row['inoutNo']+'\';" class="btn btn-danger btn-sm">취소</button>';
                            }else{
                            	data = "취소처리";
                            }
                        }
                        return data;
                }},
                {data: "comment",
                defaultContent: ""}
                
               ]
	    });
 		$("#inoutList").hide();
		$("#inoutList").fadeIn(1000);
 	}
 	$('.modal').on('hidden.bs.modal', function (e) {
	    $(this).find('form')[0].reset()
	});
 	$("input:radio[name=sortation]").click(function(){
 		 
        if($("input[name=sortation]:checked").val() == "입고"){
        	$("#stockLabel").hide();
        	$("#cliNo").val("");
        	$("#stock").text("");
            $("#cliNo").attr("disabled",true);
            changePrice();
 
        }else if($("input[name=sortation]:checked").val() == "출고"){
        	 $("#stockLabel").show();
        	 console.log($("#stock").text());
        	 $("#cliNo").attr("disabled",false);
        	 changePrice();
        }
    });
 	$("#quantity").on('change keyup paste',function(){
    	changePrice();
    });
    function changePrice() {
    	$("#price").val("");
    	var num = $("#quantity").val();
    	console.log(num);
    	var proNo = $('#proNo').val();
    	if($("#proNo").val()!=""){
            <c:forEach items="${ pList }" var="p">
            	if('${p.proNo}' == proNo){
					if($("input[name=sortation]:checked").val() == "입고"){
						$("#price").val('${p.inPrice}'*num);
					}else if($("input[name=sortation]:checked").val() == "출고"){
						$("#price").val('${p.outPrice}'*num);
						$("#stock").text('${p.stock}');
					}
    			}
			</c:forEach>
    	}
	}
	function check() {
		var name=document.newInout;
		console.log(($("#stock").text()-name.quantity.value));
		console.log($("#stock").text());
		if(name.inoutDate.value==""){
			alert("날짜를 선택해주세요.");
			return false;
		}if(name.sortation.value==""){
			alert("입출고를 선택해주세요.");
			return false;
		}if(name.proNo.value==""){
			alert("상품을 선택해주세요.");
			return false;
		}if(name.sortation.value=="출고"&&name.cliNo.value==""){
			alert("출고거래처를 선택해주세요.");
			return false;
		}if(name.quantity.value==""){
			$(name.quantity).attr("placeholder","가격을  입력해주세요");
			name.quantity.focus();
			return false;
		}if(name.sortation.value=="출고"&&($("#stock").text()-name.quantity.value)<0){
			alert("재고가 부족합니다.");
			return false;
		}if(confirm("추가하시겠습니까?")){
			return true;
		}
		return false;
	}
	</script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.select.min.js"></script>
</body>
</html>