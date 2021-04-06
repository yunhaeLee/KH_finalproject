  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<!-- Favicon icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
     	
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/deskapp/vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/deskapp/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/deskapp/vendors/styles/style.css">

<style>


	div.addMsgArea {
	   text-align: center;
	   display: inline-block;
	   padding: 20px;
		
	}

</style>
</head>

<body class="">
 
   <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
   <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
   
    
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
		<!-- 메인레버 -->
	<div id="wrapper">

		<!-- 컨텐츠 영역 -->
		<div class="container-fluid">
		
		<!-- 타이틀 영역 -->
        
            
            <div class="card chat-card">
                    <div class="card-header">
                        <h5>메신저</h5>
                        <div class="card-header-right">  
                        </div>
                    </div>
                    
                    
     <!-- 메신저 카드 영역 -->               
                    <div class="card-body">	
					<div class="row no-gutters">
						<div class="col-lg-3 col-md-4 col-sm-12">
						
							<div class="chat-list bg-light-gray" style="width:400%;">
								<div class="chat-search">
									<span class="ti-user"></span>
									<input type="text" placeholder="사원 목록입니다.">
								</div>
								
								<div class="notification-list chat-notification-list customscroll">
								<!-- 전체 사원 리스트 -->
								 <c:forEach items="${list}" var="emp">
								
							     <div class="msgEmpList">
									<ul>
										<li> 
											 <a href="" data-id="${emp.empNo}" data-toggle="modal" data-target="#insertMsg" >
												<img src="${pageContext.request.contextPath}/resources/upload_files/${emp.changeName}">
												<h3 class="clearfix" id="empName" name="empName">${emp.empName} ${emp.empPosition}</h3>
												<p id="deptName" name="deptName">${emp.deptName}</p>
											</a>
										</li>
									</ul>
									</div>
									</c:forEach>
								</div>
								
								<!-- 사원 리스트 끝 -->
						</div> <!-- div class="chat-list bg-light-gray" -->
							
						</div>
						

					</div>
                        </div> <!-- 카드 바디 영역 -->
              
                        
         <!-- 메세지 모달  -->
         <div class="modal fade bd-example-modal-lg" tabindex="-1" id="insertMsg"
            role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
               <div class="modal-content">
                  <div class="modal-body">
							
							<div class="chat-detail">
								<div class="chat-profile-header clearfix">
								
									<div class="left">
										<div class="clearfix">
											<div class="chat-profile-photo">
													<img id="changeName" name="changeName">
											</div>
											<div class="chat-profile-name">
												<h3 style="color:#8069AE;" id="empName" name="empName"></h3>
												<span id="deptName" name="deptName"></span>
											</div>
										</div>
									</div>
								</div>
								
								<!-- 메세지 리스트 출력 영역 -->
								<div class="chat-box">
								<div class="chat-desc customscroll">
									<ul id="msgAreaList">
									</ul>
			
								</div>	<!-- 메세지 리스트 출력 영역 끝 -->
									
									<!-- 메세지 전송 영역 -->
									<div class="chat-footer">
										<div class="file-upload"><a href="#"><i class="fa fa-paperclip"></i></a></div>
										<div class="chat_text_area">
											<textarea id="msgContent" name="msgContent" placeholder="메세지를 입력해주세요."></textarea>
											
												<input type="hidden" id="msgSender" name="msgSender" value="${loginUser.empNo}" class="form-control form-control-user">
												<input type="hidden" id="msgReceiver" name="msgReceiver">
												<input type="hidden" id="chatNo" name="chatNo">
											
										</div>
										<div>
										<div class="addMsgArea" id="addMsgArea">
			                                <button class="btn btn-primary btn-icon" id="addMsgBtn">
			                                    <i class="feather icon-message-circle"></i>
			                                </button>
			                       	 	</div>
			                       	 	</div>
									</div> <!-- 메세지 전송 영역 끝 -->
									
								</div>
						
						</div> <!-- 메세지 Area 끝 -->
						
		<script>
		

		
    	$(function(){
    		selectMsgList();
    		
    		$("#addMsgBtn").click(function(){
        		var chatNo = $("#chatNo").val();
        		console.log(chatNo);

    			if($("#msgContent").val().trim().length != 0){
    				
    				$.ajax({
    					url:"minsert.ma",
    					type:"post",
    					data:{chatNo:chatNo,
    						  msgContent:$("#msgContent").val(),
    						  msgSender:$("#msgSender").val(),
    						  msgReceiver:$("#msgReceiver").val()},
    					success:function(result){
    						if(result > 0){
    							$("#msgContent").val("");
    							selectMsgList();
    						}else{
    							alert("메세지 전송 실패");
    						}
    					},error:function(){
    						console.log("메세지 작성 ajax 통신 실패");
    					}
    				});
    				
    			}else{
    				alert("메세지 내용을 입력하세요.");
    			}
    			
    		});
    	});
    	
    	function selectMsgList(){
    		var chatNo = $("#chatNo").val();
    		console.log("메세지 리스트 채팅방 : " + chatNo);
    		
    		$.ajax({
    			url:"mlist",
    			data:{chatNo:chatNo},
    			type:"POST",
    			success:function(msgList){
    				var value="";
    				console.log(msgList);
    				
    				$.each(msgList, function(i, msg){
   
    					if("${loginUser.empNo}" == msg.msgSender){
    						value += "<li class='clearfix admin_chat'><span class='chat-img'>" +
    						"<img src='${pageContext.request.contextPath}/resources/upload_files/${sessionScope.loginUser.changeName}'></span>";
    					}else{
    						value += "<li class='clearfix'><span class='chat-img'><img src='${pageContext.request.contextPath}/resources/upload_files/"
    						+ msg.profile + "'></span>";
    					}
    					
    					value += "<div class='chat-body clearfix'><p>" + msg.msgContent +
    					    "<div class='chat_time'>" + msg.msgDate + "</div></div></li>";
    				});
    				  $("#msgAreaList").html(value);

    			},error:function(){
    				console.log("메세지 리스트 조회용 ajax 통신 실패");
    			}
    		});
    	
    	}

  
    </script>		
						</div>
                 
                  </div>
               </div>
            </div>
            </div>
         <!-- 모달 끝  -->
                        
         
                        
 
			
    <br>

	</div> <!--지우지 마세요    div class="row"  -->
	</div> <!--지우지 마세요   div class="pcoded-content"  -->
	</div> <!--지우지 마세요    div class="pcoded-main-container"  -->
	
	
	</div><!-- [ Main Content ] 메인화면 끝 -->
	

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
   
 
    $('#insertMsg').on('show.bs.modal', function (event) {
    	
    	var empNo = $(event.relatedTarget).data('id');
    	console.log(empNo);
    	
    	
    	$.ajax({
            type:"POST",  
            url:"selectMsg",  
            async:false,
            data:{empNo:empNo},
            success:function(emp){
                $("#insertMsg #empName").html(emp.empName);
                $("#insertMsg #deptName").html(emp.deptName);
                $("#insertMsg #empPosition").html(emp.empPosition);
                $("#insertMsg #changeName").attr("src", "${pageContext.request.contextPath}/resources/upload_files/" + emp.changeName);
                
                $("#insertMsg #msgReceiver").val(emp.empNo);
                $("#insertMsg #chatNo").val(emp.chatNo);
                
                
            },   
             error:function(e){  
                 console.log(e.responseText);  
             }
      		});
    	
    		selectMsgList();
    		
    		
     });
   
    

    </script>
    
    
<!-- JS -->

  	<script src="${pageContext.request.contextPath}/resources/deskapp/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/resources/deskapp/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/deskapp/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/resources/deskapp/vendors/scripts/layout-settings.js"></script>
  
</body>
</html>