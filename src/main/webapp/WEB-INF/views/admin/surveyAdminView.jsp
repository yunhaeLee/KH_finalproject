<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style>
#surveyList td,th{
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

	#buttons button{
		margin: 5em;
		display: inline-block;
		margin-left: auto;
		margin-right: auto;
	}
	#buttons{
		display: inline-block;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	
	span.txt{
	 	 color: #383A3C;
	}
	
	span.txt:hover {
    color: #B8ACD0;
	}

	:root {
		--aside-width: 17.625rem;
		}
		
	.cate{
	 	background-color: #B8ACD0;
	
	}
	
	.pagination {
	  display: inline-block;
	  margin-left: auto;
	  margin-right: auto;
	  padding: 40px 0px 20px 0px;
	}
	
	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  transition: background-color .3s;
	}
	
	.pagination a.active {
	  background-color: rgb(2, 1, 13);
	  color: white;
	}
	
	 a:link { color: gray; text-decoration: none;}
	 a:visited { color: gray; text-decoration: none;}
	 a:hover {text-decoration: none;}
	
	.bContents:hover {
		background: rgb(250,250,250);
	}
	
	div.left {
	 	width: 30%;
        float: left;
        box-sizing: border-box;
        
    	}
    
    	div.right {
        width: 70%;
        float: right;
        box-sizing: border-box;
        
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
<!--?????? ?????? ???????????? -->
   <div class="pcoded-main-container">
     <div class="pcoded-content">
     
        
   <!-- [ breadcrumb start ????????????????????? ????????? ?????????????????? -->
   
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
  
  
<!-- [ Main Content ] ?????????????????? ?????? ?????? ???????????? -->
<div class="row">
     <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>????????????</h5>
                    </div>
                    <div class="card-body">
                        <div class="dt-responsive table-responsive">
                            	<table id="surveyAdminList" class="table table-hover row-border  nowrap">
	                                <thead>
	                                    <tr>
	                                    <th id="check" style="width: 7%; text-align: center;">
	                                    <input type="checkbox" name="all_selected"></th>
	                                    <th id="sNo" style="width: 5%;">??????</th>
	                                    <th id="sStatus" style="width: 5%;">??????</th>
	                                    <th id="sTitle" style="width: 25%;">??????</th>
	                                    <th id="sDate" style="width: 30%;">?????? ??????</th>
	                                    <th id="sWriter" style="width: 15%;">?????????</th>
	                                    </tr>
	                                </thead>
	                                <tbody>  
	                                <tr>
							            <td></td>
							            <td>57</td>
							            <td>?????????</td>
							            <td>????????? ?????? ??????</td>
							            <td>2021-03-12 (???) 00:00 ~ 2021-03-13 (???) 23:59</td>
							            <td>????????? ????????????</td>
						            </tr>
						            </tbody>
                            	</table>
                        	</div>
                        </div>
                	</div>
            	</div>
 </div> <!--????????? ?????????    div class="row"  -->
            </div> <!--????????? ?????????   div class="pcoded-content"  -->
            </div> <!--????????? ?????????    div class="pcoded-main-container"  -->
<!-- [ Main Content ] ???????????? ??? -->

    
    
    <jsp:include page="../common/footer.jsp"/>
<script>
	$(document).ready(function() {
		var table = $('#surveyAdminList').DataTable({
			columnDefs: [
				{
		            className: 'select-checkbox',
		            targets:   0
		        },
		        
                { orderable: false, targets: [0,2,3,4,5]},

              ],
              select: {
		            style:    'multi',
		            selector: 'td:first-child'
		        },
		        order: [[ 2, 'asc' ]],
              dom: '<"float-left"B>frtp',

	        buttons: [{
	            text: '??????',
	            className: 'btn-primary',
	            action: function(e, dt, node, config) {
	            	$("").modal("show");
	            }
	        },{
	            text: '??????',
	            className: 'btn-secondary',
	            action: function(e, dt, node, config) {
	            	$("").modal("show");
	            }
	        },{
	            text: '??????',
	            className: 'btn-secondary',
	            action: function(e, dt, node, config) {
	            	$("").modal("show");
	            }
	        },{
	            text: '??????',
	            className: 'btn-danger',
	            action: function(e, dt, node, config) {
	            }
	        }]
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
	                                    