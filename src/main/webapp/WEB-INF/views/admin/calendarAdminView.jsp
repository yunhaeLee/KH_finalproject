<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style>
#calendarList td,th{
	padding:0.75rem !important;
	}	
.select-checkbox:before {
    margin-top: 0px !important;
}
.btn-primary{
	background-color: #B8ACD0 !important;
    border-color: #B8ACD0 !important;
}
.btn{
	padding:0.5rem 0.95rem !important;
	margin-bottom:1rem !important;
}
 .modal-content .table td{
   line-height: 35px!important;
   }
.table-hover>tbody>tr:hover{
	cursor:pointer
}
 </style>
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
                        <h3>일정관리</h3>
                    </div>
                    <div class="card-body">
                        <div class="dt-responsive table-responsive">
                            	<table id="calendarList" class="table table-hover row-border  nowrap">
	                                <thead>
	                                    <tr>
	                                    <th id="check" style="width: 7%; text-align: center;">
	                                    <input type="checkbox" name="all_selected"></th>
	                                    <th  id="cDate" style="width: 25%;">날짜</th>
	                                    <th  id="cTitle" style="width: 58%;">제목</th>
	                                    <th  id="cType" style="width: 10%;">휴일여부</th>
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
<div class="modal fade" id="calendarAdd">  
        <div class="modal-dialog modal-md modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">일정추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
				<form name="newCalender" action="insertCalendar" method="post" autocomplete="off">
					<table class="table table-bordered  "  align="center">
                    	<input type="hidden" name="empNo" class="form-control form-control-sm" value="${sessionScope.loginUser.empNo}">
                    	<tr>
                        	<td style="width:20%">시작날짜</td>
                            <td><input type="date" name="calSDates"  class="form-control form-control-sm" style="width:50%"></td>
                        </tr><tr>
                        	<td style="width:20%">끝날짜</td>
                            <td><input type="date" name="calEDates"  class="form-control form-control-sm" style="width:50%"></td>
                        </tr> <tr>
                            <td style="width:20%">제목</td>
                            <td><input type="text" name="calTitle"  class="form-control form-control-sm" style="width:80%"></td>
                        </tr><tr>
                            <td style="width:20%">휴일여부</td>
                            <td><input type="radio" name="calCate" id="holiday" value="30">
                    			 <label for="lift">전사일정</label> &nbsp;&nbsp;
                    			 <input type="radio" name="calCate" id="anniversary" value="40">
                    			 <label for="lunar">휴일</label></td>
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
		var table = $('#calendarList').DataTable({
			columnDefs: [
				{
		            className: 'select-checkbox',
		            targets:   0
		        },
                { orderable: false, targets: [0]},

              ],
              select: {
		            style:    'multi',
		            selector: 'td:first-child'
		        },
		        order: [[ 1, 'asc' ]],
              dom: '<"float-left"B>rtp',
	        buttons: [{
	            text: '추가',
	            className: 'btn-primary',
	            action: function(e, dt, node, config) {
	            	$("#calendarAdd").modal("show");
	            }
	        },{
	            text: '삭제',
	            className: 'btn-danger',
	            action: function(e, dt, node, config) {
	            	var calNos = [];
	            	var rows = table.rows('.selected').data();
	            	for(var i = 0;i<rows.length;i++){
	            		calNos[i]=rows[i]['calNo'];
	            		
	            	} console.log(calNos);
	            	window.location='deleteCalendar?calNos='+calNos;
	            }
	        }],language: {
          	  zeroRecords:    "일정이 존재하지 않습니다."
            },
	        ajax : {
				url :"selectCalendarList"
                ,type : "POST"
                ,dataType : "JSON"
                },
            columns : [
            	 {data: null,
                		render: function(data, type, row){
                     	if(type=='display'){
                         	data = '<td></td>';
                             }
                             return data;
                         }},
                {data: "calSDates",
                     		render: function(data, type, row){
                             	if(type=='display'){
                             		if(data!=row['calEDates']){
                             			data = data+' ~ '+row['calEDates']
                             		}
                            	}
                			return data;
         		}},
                {data: "calTitle"},
                {data: "calCateName"}
                ]
	    });
		$('input[name=all_selected]').on('click', function(){
			if ($(this).is( ":checked" )) {
				table.rows(  ).select();
			} else {
				table.rows(  ).deselect();
			}
			});
	});
	

	
	</script>
    <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.select.min.js"></script>
</body>
</html>
	                                    