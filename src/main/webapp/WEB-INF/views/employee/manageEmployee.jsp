<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* Styles for wrapping the search box */
.main {
   width: 50%;
   left-margin: 5px;
}
.card-body {
  margin: 0rem 2rem 3rem 2rem;
}
#employeeList td,th{
   padding:0.75rem !important;
   }
.dt-center {
    text-align: center;
}
</style>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/ablePro/assets/css/plugins/dataTables.bootstrap4.min.css">
</head>

<body class="">


   <jsp:include page="/WEB-INF/views/common/adminSidebar.jsp"></jsp:include>
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
                        <li class="breadcrumb-item"><a href="adminMain.jsp"><i
                              class="feather icon-home"></i></a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <!-- [ breadcrumb ] end -->


         <!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->
         <div class="row">


            <!-- 사원관리 테이블  시작 -->

            <div class="col-lg-10 mx-auto">
               <div class="card">
                  <div class="card-header">
                     <h3>사원관리</h3>
                  </div>
                  <div class="card-body">
                     <div class="dt-responsive table-responsive">
                        <table id="employeeList" class="table  table-hover nowrap">
                           <thead>
                              <tr>
                                 <th style="width:15%">이름</th>
                                 <th style="width:20%">사번</th>
                                 <th style="width:20%">부서</th>
                                 <th style="width:10%">직위</th>
                                 <th style="width:10%">상태</th>
                                 <th style="width:25%">상세보기</th>
                              </tr>
                           </thead>
                           
                        </table>
                     </div>
                  </div>
               </div>
            </div>
            <!-- 사원관리 테이블 끝 -->
         </div>
         <!--지우지 마세요    div class="row"  -->
         <!-- 사원상세보기  모달시작  -->
         <div class="modal fade bd-example-modal-lg" tabindex="-1" id="detailEmp"
            role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
               <div class="modal-content">
                  <div class="modal-header">
                     <h3>상세보기</h3>
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
                  <div class="modal-body">
                       
                           <table class="table table-bordered table-detail">	
                              <tr>
                                 <td style="width: 15%">이름</td>
                                 <td style="width: 35%" id="empName"></td>
                                 <td style="width: 15%">사번</td>
                                 <td style="width: 35%" id="empNo1"></td>
                              </tr>
                              <tr>
                                 <td>부서</td>
                                 <td id="deptName"></td>
                                 <td>직급</td>
                                 <td id="empPosition"></td>
                              </tr>
                              <tr>
                                 <td style="width: 10%">입사일</td>
                                 <td style="width: 25%" id="joinDate"></td>
                                 <td style="width: 10%">개인번호</td>
                                 <td style="width: 25%" id="phone"></td>
                              </tr>
                              <tr>
                                 <td style="width: 10%">내선번호</td>
                                 <td style="width: 25%" id="officePhone"></td>
                                 <td style="width: 10%">이메일</td>
                                 <td style="width: 25%" id="email"></td>
                              </tr>
                              <tr>
                                 <td style="width: 10%">주소</td>
                                 <td colspan="3" id="address"></td>
                              </tr>

                              <tr>
                                 <td><button type="button" class="btn-sm  btn-danger"
                                       onclick="endFunction()" style="width:100%;">퇴사처리</button></td>
                                 <td colspan="3" id="entTd"></td>
                              </tr>
                           </table>
                            <form name="updateEmpForm" action="updateEmpForm" method="post" autocomplete="off">
								<input type="hidden" id="empNo" name="empNo">
                      			<div class="modal-footer">
                     				<button class="btn btn-primary " type="submit" style="float: right">
                        			<i class="fas fa-file-signature"></i>수정하기</button>
								</div>
                       		</form>

                        <!-- jQuery와 Postcodify를 로딩한다. 주소입력 -->
                        <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
                        <script>
                        	function endFunction() {
                        		if($('#entDate').val() !=""){
	                        		if(confirm("퇴사를 진행하시겠습니까?")){
	                        			$.ajax({
	                        	              type:"POST",  
	                        	              url:"updateEntDate",  
	                        	              async:false,
	                        	              data:{entDateS:$('#entDate').val(),
	                        	            		empNo:$("#empNo1").html()
	                        	              },
	                        	              success:function(result){
	                        	            	  if(result > 0){
		                                        	  alert("퇴사 처리가 완료 되었습니다.");
		                                        	  location.reload();
	                        	            	  }else{
	                        	            		  alert("퇴사 실패!");
	                        	            	  }
	                        	            },   
	                        	            error:function(e){  
	                        	               console.log(e.responseText);  
	                        	           }
	                        	      	});
	                        		}
	                        	}else{
	                        		alert("퇴사일자를 선택하세요!!");
	                        	}

                        	}
                     	</script>
                     </div>
                  </div>
               </div>
            </div>
         <!-- 상세보기  모달끝  -->
      </div>
      <!--지우지 마세요   div class="pcoded-content"  -->
   </div>
   <!--지우지 마세요    div class="pcoded-main-container"  -->
   <!-- [ Main Content ] 메인화면 끝 -->

   <script>
    
   $(document).ready(function() {
        var table=$('#employeeList').DataTable({
            columnDefs: [
                { orderable: false, targets: [1,5] },
                { searchable: false, targets: [4,5]},
                { className : "dt-center", targets:"_all"}
              ],
              dom: 'frtip',
              order: [[ 0, 'asc' ]],
              ajax : {
                  url :"selectEmpList.do"
                  ,type : "POST"
                  ,dataType : "JSON"
                  },
              columns : [
                 {data: "empName"},
                 {data: "empNo"},
                 {data: "deptName"},
                 {data: "empPosition"},
                 {data: "status",
                     render: function(data, type, row){
                           if(type=='display'){
                        	   if(data=='Y'){
                        		   data="재직중";
                        	   }else{
                        		   data="퇴사";
                        	   }
                           }
                           return data;
                       }},
                 {data: null,
                    render: function(data, type, row){
                          if(type=='display'){
                              data = '<i class="fas fa-clipboard-list" /><a href=""data-toggle="modal" data-id="'+row['empNo']+'" data-target="#detailEmp">상세보기</a>';
                          }
                          return data;
                      }}
                 
                 //{data: null, defaultContent: "<i class='fas fa-clipboard-list' /><a href=''data-toggle='modal' data-id='' data-target='#detailEmp'>상세보기</a>"}
                
              ]
    
        });
        
        $('#detailEmp').on('show.bs.modal', function (event) {
           $.ajax({
              type:"POST",  
              url:"selectEmployee",  
              async:false,
              data:{empNo:$(event.relatedTarget).data('id')},
              success:function(emp){
                  $("#empName").html(emp.empName);
                  $("#empNo").val(emp.empNo).html();
                  $("#empNo1").html(emp.empNo);
                  $("#deptName").html(emp.deptName);
                  $("#empPosition").html(emp.empPosition);
                  $("#joinDate").html(emp.joinDateS);
                  $("#phone").html(emp.phone);
                  $("#officePhone").html(emp.officePhone);
                  $("#email").html(emp.email);
                  $("#address").html(emp.address);
                  $("#address").html(emp.address);
                  entStatus(emp.entDateS); 
                  
              },   
              error:function(e){  
                  console.log(e.responseText);  
              }
       		});
        });   
        
        
   });
   function entStatus(entDate){
	   $(".modal-body button").attr("disabled",false);
	   $('#entTd').children().remove();
       $('#entTd').text("");
       console.log(entDate);
	   if(typeof entDate!="undefined"){
		  $("#entTd").html(entDate);
     	  $(".modal-body button").attr("disabled",true);
	   }else{
		   $("#entTd").append('<input type="date" id="entDate"'
	               +'name="entDate" class="form-control form-control-user"'
	                   +'style="width: 30%;">');
	   }
   }
   </script>
   <script
      src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/jquery.dataTables.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.buttons.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/buttons.bootstrap4.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.responsive.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/responsive.bootstrap4.js"></script>


   <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>