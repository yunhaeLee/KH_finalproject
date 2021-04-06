<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
li {
	display: list-item;
}

body {
	background-color: #EAEAEA;
}

section {
	padding-top: 40px;
	background-color: white;

	margin-right:10%;
}
.card-header{
font-size: 25px;


}

.newtodoform {
	text-align: right;
}

.newtodo {
	margin-right: 10px;
}

#project-app .depth01>li {
	margin-right: 10px;
	width: 33%
}

#project-app {
	width: 90%;
	margin: 0;
	margin-left: 10%;
}

.depth01, .depth02 {
	padding: 0;
	list-style: none;
	margin-left:10%;
	margin: 0;
}

.depth01 {
	display: flex;
}

#app-block {
	background-color: #B8ACD0;
	width: auto;
	height:160px;
}

#title-block {
	background-color: #3DB7CC;
}

.data, h2 {
	margin: 0;
	margin-bottom: 10px;
	padding: 15px;
}

h2 {
	color: white;
	font-size: 25px;
}

p {
	margin: 0;
}

.titled {
	font-size: 15px;
}

.subd {
	font-size: 10px;
}

#spot {
 font-size: 15px;
 ackground-color: #00ff0000;
 border-style:none;
 
}
</style>
</head>

<body class="">

	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"></jsp:include>
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
								<li class="breadcrumb-item"><a href="index.jsp"><i	class="feather icon-home"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- [ breadcrumb ] end -->


			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-header">
							<h5 class="m-0 font-weight-bold ">TODO+</h5>
						
						</div>


						<section>

							<!-- <div id="button-app">
			<form action="adtodo" accept-charset="utf-8" method="post"
				class="newtodoform">
				<input class="newtodo" type="submit" value="새로운 todo 등록"
					name="newtodo">
			</form>
		</div> -->




							<nav id="project-app">

								<ul class="depth01">


									<div class="col-sm-4">
										<div class="card bg-light">
											<div class="card-header">Todo  	 <a  href=""  data-toggle="modal" data-target="#insertTodo"><i class="fas fa-plus-square text-gray-800 "></i></a></div>
											<div class="card-body">
												<div class="urgent">
										          
													<ul class="depth02">
                                                        <c:if test="${ fn:length(todolist)>0}">
								                        <c:forEach items="${todolist}" var="item">
								                        <c:if test="${item.status eq 'T'}">
								                        
								                        	 <c:if test="${item.empNo eq loginUser.empNo }">
														<li>
														
															<div class="data" id="app-block" data-toggle="modal" data-target="#detailTodo"  data-id="${item.todoNo}" >
															<div align="right"> <button type="button" class="btn btn-primary"  onclick="postFormSubmit(2)"><i  class="fas fa-trash-alt" id="spot"></i></button> <button   class="btn btn-primary"   onclick="postFormSubmit(1)"><i class="fas fa-arrow-right" id="spot"></i></button></div>
															 <div align="right">  </div>
																<p class="titled">제목:${item.todoTitle }</p>
															    <p class="titled">내용:${item.todoContent}  </p>														     
													           <p class="subd">기한:${item.todoDoneDate} </p>
													            
													         
													       
													      
													            
													            <form id="postForm" action="" method="post">
																	<input type="hidden" name="tno" value="${ item.todoNo }">
																	</form>
																<script>
																	function postFormSubmit(num){
																		var postForm = $("#postForm");
																		
																		if(num == 1){
																			postForm.attr("action", "doingTodo.do");
																		}else{
																			
																			
																			postForm.attr("action", "deleteTodo.do");
																	
																		}
																		postForm.submit();
																		locaction.reload();
																	}
																</script>


															</div>
														</li>
														
														
															</c:if>
															</c:if>	
                                                  </c:forEach>
                                                  	
												</c:if>
												
													</ul>
												
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="card bg-light">
											<div class="card-header">Doing</div>
											<div class="card-body">
												<div class="urgent">
													<ul class="depth02">
                                                              <c:if test="${ fn:length(todolist)>0}">
								                        <c:forEach items="${todolist}" var="item">
								                        <c:if test="${item.status eq 'N'}">
								                 
														<li>
														<div class="data" id="app-block" data-toggle="modal" data-target="#detailTodo"  data-id="${item.todoNo}" >
															<div align="right"> <button type="button" class="btn btn-primary"  onclick="postFormSubmits(2)"><i  class="fas fa-trash-alt" id="spot"></i></button> <button   class="btn btn-primary"   onclick="postFormSubmits(1)"><i class="fas fa-arrow-right" id="spot"></i></button></div>
																<p class="titled">제목${item.todoTitle }</p>
																
																<p class="titled">내용:${item.todoContent} </p>
												
													               <p class="subd">기한:${item.todoDoneDate} </p>
													               
													          
													            
													            <form id="postForms" action="" method="post">
																	<input type="hidden" name="tno" value="${ item.todoNo }">
																	</form>
																<script>
																	function postFormSubmits(num){
																		var postForms = $("#postForms");
																		
																		if(num == 1){
																			postForms.attr("action", "doneTodo.do");
																		}else{
																		
																			postForms.attr("action", "deleteTodo.do");
																	
																		}
																		postForms.submit();
																		
																	}
																</script>

															</div>
														</li>
														</c:if>	
															
                                                  </c:forEach>
												</c:if>	
													</ul>
												</div>
											</div>
										</div>
									</div>

												<div class="col-sm-4">
										<div class="card bg-light">
											<div class="card-header">Done</div>
											<div class="card-body">
												<div class="urgent">
													<ul class="depth02">
                                                              <c:if test="${ fn:length(todolist)>0}">
								                        <c:forEach items="${todolist}" var="item">
								                        <c:if test="${item.status eq 'D'}">
								                          <c:if test="${item.empNo eq loginUser.empNo }">
														<li>
														<div class="data" id="app-block" data-toggle="modal" data-target="#detailTodo"  data-id="${item.todoNo}" >
														<div align="right"> <button type="button" class="btn btn-primary"  onclick="deletetodo();"><i  class="fas fa-trash-alt" id="spot"></i> </button></div>
														
																<p class="titled">제목:${item.todoTitle }</p>
														
																<p class="titled">내용:${item.todoContent} </p>
															
																
																		<p class="subd">기한:${item.todoDoneDate} </p>
													            
													            <form id="deletetodo" action="" method="post">
																	<input type="hidden" name="tno" value="${ item.todoNo }">
																	</form>
																	<script>
																	function deletetodo(){
																		var deletetodo = $("#deletetodo");
																			deletetodo.attr("action", "deleteTodo.do");
																		    deletetodo.submit();
																	}
																</script>

															</div>
														</li>
															</c:if>	
															</c:if>	
                                                  </c:forEach>
												</c:if>	
													</ul>
												</div>
											</div>
										</div>
									</div>




								</ul>
							</nav>
						</section>

					</div>
				</div>
	
		   <!-- todo 넣기 모달시작  -->       
                       <div id="insertTodo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalPopoversLabel">할일을 추가해주세요</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<form  id="insertTodo" method="post" action="insertTodo.do">
									<div class="modal-body">
										<h5>제목을 입력해 주세요</h5>
										<input type="text" id="todoTitle" class="form-control" name="todoTitle" required>
										<hr>
									    <h5>마감날짜</h5>
									    <input type="datetime-local" id="todoDoneDate" name="todoDoneDate" class="form-control form-control-user">
										<hr>
									
										<h5>할일내용 </h5>
										<textarea class="form-control" required name="todoContent" id="todoContent" rows="8" style="resize:none;"></textarea>
								        
									    <input type="hidden" id="empNo" name="empNo" value="${loginUser.empNo}" class="form-control form-control-user">
										<hr>
									</div>
									
									<div class="modal-footer">
										<button type="button" class="btn  btn-secondary" data-dismiss="modal">Close</button>
										<button type="submit" class="btn  btn-primary" id="addTodo">저장</button>
									</div>
									</form>
								</div>
							</div>
							
							</div>
   <!-- todo 모달끝  -->   
   
   
   		   <!-- todo 상세보기 모달  -->       
                       <div id="detailTodo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" >
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalPopoversLabel">할일상세보기</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<form  id="updateTodo.do" method="post" action="updateTodo.do">
									<div class="modal-body">
										<h5>제목을 입력해 주세요</h5>
										<input type="text" id="todoTitle" class="form-control" name="todoTitle"  required>
										<hr>
									    <h5>마감날짜</h5>
									    <input type="datetime-local" id="todoDoneDate" name="todoDoneDate" class="form-control form-control-user">
										<hr>
									
										<h5>할일내용 </h5>
										<textarea class="form-control" required name="todoContent" id="todoContent" rows="8" style="resize:none;"></textarea>
								        
									    <input type="hidden" id="empNo" name="empNo" value="${loginUser.empNo}" class="form-control form-control-user">
										<input type="hidden" id="todoNo" name="todoNo">
										<hr>
									</div>
									
									<div class="modal-footer">
									
										<button type="submit" class="btn  btn-primary" id="addTodo">수정</button>
																</form>
										<button type="button" class="btn  btn-secondary" data-dismiss="modal">Close</button>
									</div>
			
								</div>
							</div>
							
							</div>
   <!-- todo 상세보기 모달   -->   
   
   
   

  
  </div>

		<!--지우지 마세요    div class="row"  -->
	</div>
	<!--지우지 마세요   div class="pcoded-content"  -->
	</div>
	<!--지우지 마세요    div class="pcoded-main-container"  -->
	<!-- [ Main Content ] 메인화면 끝 -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	 <script>
    $(document).ready(function(){
    	
    	
    
    	$('#detailTodo').on('show.bs.modal', function (event) {
    
    		
		            $.ajax({
		               type:"POST",  
		               url:"selectTodo.do", 
		               async:false,
		               data:{todoNo:$(event.relatedTarget).data('id')},
		               success:function(t){
		            	   
		            	
		            	  
		                   $("#detailTodo #todoTitle").val(t.todoTitle);
		                   $("#detailTodo #todoDoneDate").val(t.todoDoneDate);
		                   $("#detailTodo #todoContent").val(t.todoContent);
		                   $("#detailTodo #todoNo").val(t.todoNo);
		                   $("#detailTodo #todoTitle").html(t.todoTitle);
		                   $("#detailTodo #todoDoneDate").html(t.todoDoneDate);
		                   $("#detailTodo #todoContent").html(t.todoContent);
		                   
		               },   
		               error:function(e){  
		                   console.log(e.responseText);  
		               }
		        		});
		         });
    	
    	  });
</script>
	
	
</body>
</html>