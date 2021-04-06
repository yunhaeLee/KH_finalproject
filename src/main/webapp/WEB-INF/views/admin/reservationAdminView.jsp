<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style>
.btn-primary{
	background-color: #B8ACD0 !important;
    border-color: #B8ACD0 !important;
}
.btn{
	padding : 0.5rem 0.95rem !important;
	margin-bottom : 1rem !important;
}
 </style>
 
  <!-- Favicon icon -->
 <link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
   	
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/board/assets/css/style.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/plugins/dataTables.bootstrap4.min.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/plugins/select.dataTables.min.css">

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
	<div class="col-sm-12">
    	<div class="card">
        	<div class="card-header">
            	<h3>예약확인</h3>
            </div>
            <div class="card-body">
            	<div class="dt-responsive table-responsive">
                	<table id="reservationList" class="table table-hover row-border  nowrap">
	                	<thead>
	                    	<tr>
	                        	<th style="width: 18%;">날짜</th>
	                          	<th style="width: 17%;">회의실</th>
	                         	<th style="width: 30%;">회의명</th>
	                          	<th style="width: 13%;">예약자</th>
	                    		<th style="width: 16%;">시간</th>
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
<div class="modal fade" id="resDetail">  
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
        <!-- Modal Header -->
  	     	<div class="modal-header">
				<h4 class="modal-title">상세보기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
			</div>
			<div class="modal-body">
				<form name="clientUpdate" action="updateClient" method="post" autocomplete="off" onsubmit="return check();">
					<table class="table table-detail "  align="center">
	                    <tr>
		                    <td style="width:7%">예약시간</td>
		                    <td style="width:3%;text-align:center">:</td>
		                    <td id="resDate" colspan="4"></td>
		                </tr><tr>
		                    <td>예약자</td>
		                    <td style="text-align:center">:</td>
		                    <td id="empName" style="width:25%"></td>
		                    <td style="width:7%">회의실</td>
		                    <td style="width:3%;text-align:center">:</td>
		                    <td id="roomName"></td>
		                </tr><tr>
		                    <td>회의명</td>
		                    <td style="text-align:center">:</td>
		                    <td id="resTitle"  colspan="4"></td>
		                </tr><tr>
		                    <td>회의내용</td>
		                    <td style="text-align:center">:</td>
		                    <td id="resContent"  colspan="4"></td>
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
	//var table;
	$(document).ready(function() {
		selectList('Y');
		
	});
	function selectList(status){
		var table = $('#reservationList').DataTable({
			destroy : true,
			columnDefs: [
                { orderable: false, targets: [4]},
                { searchable: false, targets: [4]}
              ],
		        order: [[ 0, 'asc' ]],
              dom: '<"float-left"B>frtp',
	
	        buttons: [{
	            text: '예약현황',
	            className: 'btn-primary',
	            action: function(e, dt, node, config) {
	            	$('#reservationList').empty();
	            	selectList('Y');
	            }
	        },{
	            text: '이전예약',
	            className: 'btn-secondary',
	            action: function(e, dt, node, config) {
	            	$('#reservationList').empty();
	            	selectList('N');
	            }
	        }],language: {
          	  zeroRecords: "예약내역이 존재하지 않습니다."
            },
	        ajax : {
	        	type : "POST",
	        	url : "selectReservation",
	        	data:{status:status},
	        	dataType : "JSON"
	        },
	        columns : [
	        	{data:"resDateS"},
	        	{data:"roomName"},
	        	{data:"resTitle"},
	        	{data:"empName"},
	        	{data:null,
	        		render: function(data, type, row){
	        			if(type=='display'){
	        				data = row["staTime"]+'시 ~ '+(Number(row["endTime"])+1)+'시';
	        			}
	        			return data;
	        		}}
	        	
	        ]
	    });
		$('#reservationList tbody').on( 'click', 'tr', function () {
		    
		    var data = table.row( this ).data();
		    console.log(data);
		    $("#resDetail #resDate").html(data['resDateS']+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
		    								+ data['staTime']+"시  ~ "+(Number(data['endTime'])+1)+"시");
		    $("#resDetail #resTime").html();
		    $("#resDetail #empName").html(data['empName']);
		    $("#resDetail #roomName").html(data['roomName']);
		    $("#resDetail #resTitle").html(data['resTitle']);
		    $("#resDetail #resContent").html(data['resContent']);
		    $("#resDetail").modal("show");
		} );
	}
	
	
	</script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.select.min.js"></script>
</body>
</html>
	                                    