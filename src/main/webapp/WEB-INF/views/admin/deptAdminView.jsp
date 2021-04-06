<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/plugins/dataTables.bootstrap4.min.css">
 <style>
 .dept1 {
  float:left;
  width:45%;
  margin:auto;
  padding-left:3rem;

 }
 .dept2 {
  float:right;
  width:45%;
  margin:auto;
  padding-right:3rem;
 }
 
 .table td, .table th {
	border-top: none !important;
	border-bottom : 1px solid #e2e5e8;
	
}

  .btn-primary{
	background-color: #B8ACD0 !important;
    border-color: #B8ACD0 !important;
}
.btn{
	padding:0.5rem 0.95rem !important;
}
.nowrap, #detailD{
   line-height: 15px!important;
   }
.dt-center {
    text-align: center;
}
 </style>
</head>

<body class="">
   <jsp:include page="../common/adminSidebar.jsp"/>
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
                            <li class="breadcrumb-item"><a href="adminMain.jsp"><i class="feather icon-home"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  
  
<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->
<div class="row">
 <div class="col-md-10 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h3>부서관리</h3>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="dt-responsive dept1 ">
                            <table id="deptMain" class="table table-hover nowrap">
                                <thead>
                                    <tr>
                                  		<th style="width: 30%;">부서코드</th>
                                        <th style="width: 40%;">부서명</th>
                                        <th style="width: 30%;">자세히보기</th>
                                    </tr>
                                </thead>
                            </table>
                            </div>
                            <div class="dept2 dt-responsive">
                            <table id="deptSub" class="table table-hover nowrap">
                                <thead>
                                     <tr>
                                  		<th style="width: 20%;">부서코드</th>
                                        <th style="width: 35%;">부서명</th>
                                        <th style="width: 15%;">구성원</th>
                                        <th style="width: 30%;">자세히보기</th>
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
 <div class="modal fade" id="mainAdd">  
        <div class="modal-dialog modal-md modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">상위부서추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
				<form name="newMain" action="insertDept" method="post" autocomplete="off" onsubmit="return check(1);">
					<table id ="addMain" class="table table-bordered  "  align="center">
                    	<tr>
                    		<td style="width:20%">부서명</td>
                            <td><input type="text" name = "deptName" id="deptName" class="form-control form-control-sm" style="width:60%"></td>
                        </tr>
                        <tr>
                    		<td style="width:20%">부서코드</td>
                            <td><input type="text" name = "deptCode" id="deptCode" class="form-control form-control-sm" style="width:60%" readonly></td>
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
     <div class="modal fade" id="subAdd">  
        <div class="modal-dialog modal-md modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">하위부서추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
				<form name="newSub" action="insertDept" method="post" autocomplete="off" onsubmit="return check(2);">
					<table id ="addSub" class="table table-bordered  "  align="center">
                    	<tr>
                    		<td style="width:20%" >상위부서명</td>
                            <td id="deptMain"></td>
                        </tr>
                    	<tr>
                    		<td style="width:20%">부서명</td>
                            <td><input type="text" name = "deptName" id="deptName" class="form-control form-control-sm" style="width:60%"></td>
                        </tr>
                        <tr>
                    		<td style="width:20%">부서코드</td>
                            <td><input type="text" name = "deptCode" id="deptCode" class="form-control form-control-sm" style="width:60%" readonly></td>
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
    <div class="modal fade" id="detailDept">  
        <div class="modal-dialog modal-sm modal-dialog-centered" >
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="title"></h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
					<table id ="detailD" class="table "  align="center">
						<thead>
							<tr>
								<th style="width: 30%">사원명</th>
								<th style="width: 45%">사번</th>
								<th style="width: 25%">직급</th>
							</tr>
						</thead>
                    	<tbody>
                    	
                    	</tbody>
					</table>
				</div>
            </div>
        </div>
    </div>
<script>
	$(document).ready(function() {
		$(".dept2").hide();
        var table1=$('#deptMain').DataTable({
              dom: '<"float-left"B>rt',
              columnDefs: [
	                { orderable: false, targets: [2] },
	                { className : "dt-center", targets:"_all"}
	              ],
            buttons: [{
                text: '상위부서추가',
                className: 'btn-primary',
                action: function(e, dt, node, config) {
                	$("#addMain #deptCode").val('D'+table1.rows().count());
                	$("#mainAdd").modal("show");
                },
            }],
            ajax : {
                url :"deptMainList"
                    ,type : "POST"
                    ,dataType : "JSON"
                    },
                columns : [
                   {data: "deptCode"},
                   {data: "deptName"},
                   {data: null,
                      render: function(data, type, row){
                            if(type=='display'){
                            	
                                data = '<i class="fas fa-clipboard-list" /><a href="#" onclick="subList(\''+row['deptCode']+'\',\''+row['deptName']+'\'); return false;">상세보기</a>';
                            }
                            return data;
                        }}
                ]
        });
       
	});
	function subList(deptCode, deptName){
		console.log(deptCode);
		$(".dept2").hide();
		var table2=$('#deptSub').DataTable({
			destroy : true,
	            columnDefs: [
	                { orderable: false, targets: [2,3] },
	                { className : "dt-center", targets:"_all"}
	              ],
	              dom: '<"float-left"B>rt',
	              language: {
	            	  zeroRecords:    "하위부서가 존재하지 않습니다."
	              },
	            buttons: [{
	                text: '하위부서추가',
	                className: 'btn-primary',
	                action: function(e, dt, node, config) {
	                	$("#addSub #deptMain").html(deptName);
	                	if(table2.rows().count().toString().length > 1){
	                		$("#addSub #deptCode").val(deptCode+(table2.rows().count()+1));
	                	}else if(deptCode=='D99'){
	                		$("#addSub #deptCode").val(deptCode);
	                	}else{
	                		$("#addSub #deptCode").val(deptCode+'0'+(table2.rows().count()+1));
	                	}
	                	
	                	$("#subAdd").modal("show");
	                }
	            }],
	            ajax : {
	                url :"deptSubList"
	                    ,type : "POST"
	                    ,data : {deptCode:deptCode}
	                    ,dataType : "JSON"
	                    },
	                columns : [
	                   {data: "deptCode"},
	                   {data: "deptName"},
	                   {data: "empCount"},
	                   {data: null,
	                      render: function(data, type, row){
	                            if(type=='display'){
	                                data = '<i class="fas fa-clipboard-list" /><a href=""data-toggle="modal" data-name="'+row['deptName']+'" data-code="'+row['deptCode']+'" data-target="#detailDept">구성원보기</a>';
	                            }
	                            return data;
	                        }}
	                ]
	           
	        });
		$(".dept2").fadeIn(1000);
	}
	$('#detailDept').on('show.bs.modal', function (event) {
		$("#detailD tbody").children().remove();
		$("#title").text($(event.relatedTarget).data('name')+" : 구성원목록");
		$.ajax({
    		type:"POST",  
			url:"deptEmpList",
			async:false,
			data:{deptCode:$(event.relatedTarget).data('code')},
			success:function(empList){
				
				 $.each(empList, function(i, emp){
					$('#detailD').append(
				    	'<tr> <td>'+emp.empName+'</td> <td>'+emp.empNo+'</td> <td>'+emp.empPosition+'</td></tr>' );
				});
			},
			error:function(){
				console.log("ajax 통신 실패");
			}
		});
	});
	function check(num){
		if(num==1){
			var name=document.newMain;
		}else{
			var name=document.newSub;
		}
		if(name.deptName.value==""){
			$(name.deptName).attr("placeholder","부서명을 입력해주세요");
			name.deptName.focus();
			return false;
		}else{
			return true;
		}
	}
	</script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.responsive.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/responsive.bootstrap4.js"></script>

    
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
	                                    