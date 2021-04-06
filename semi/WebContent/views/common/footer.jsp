<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>


  <%
  
  Member loginUser2 = (Member)session.getAttribute("loginUser"); 
  int mno=0;	
  
  if(loginUser2!=null){
		 mno=loginUser2.getM_no();
  
	} 
  %>  
  <script type="text/javascript">
  
	  
	  $(function(){
		
		<% if(loginUser2!=null){ %>  //로그인 했을 때
		 mno=<%=mno%>;
		 
		 
		 getChatRoomList();
			
	
		 chatListWS=new WebSocket("ws://localhost:8090/semi/chatList");
		 chatWS=new WebSocket("ws://localhost:8090/semi/chat"); //채팅방 접속 
			// WebSocket 서버와 접속이 되면 호출되는 함수
			chatListWS.onopen = function(message) {
				chatListWS.send(mno);
			};
			// WebSocket 서버와 접속이 끊기면 호출되는 함수
			chatListWS.onclose = function(message) {
			
			};
			// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
			chatListWS.onerror = function(message) {
			
			};
			// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
			chatListWS.onmessage = function(message) {
				handleChatRoomMessage(message.data);

			
			}; 
			
			 chatWS.onmessage=function(message){
				 handleChatMessage(message.data);
			 };
		  
		  <% }%>
	  });
  
  
  </script>  
					</div>
				<!-- end container-fluid -->
				
				
			      <!-- Footer-->
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                           <h1 class="text-uppercase mb-4">PUMASSI</h1>
                        <p class="lead mb-0">
                            (주)방구석 개발자
                            <br />
                           	<small>김한별 | 윤우진 | 이윤해 | 남궁수영</small>
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h1 class="text-uppercase mb-4">  <i class="fas fa-tools"></i> &nbsp; 
                        								<i class="fas fa-laptop-house"></i> &nbsp;
                        								<i class="fas fa-handshake"></i> &nbsp;
                        								<i class="fas fa-store"></i> &nbsp;
                        													</h1>
        

                    </div>
                    <!-- Footer About Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">문의사항</h4>
                        <p class="lead mb-0">
                        			 
						                        품앗이 이용 중 <br>
						                        궁금하신 점이 있으신가요?<br>
										Q&A를 이용해주세요!<br>
										최선을 다해 도와드리겠습니다.<br>
                            
                            
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container">
            <small>품앗이는 통신판매중개자이며 통신판매의 당사자가 아닙니다.따라서 품앗이는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다</small><br>
            <small>Copyright 2021 © Pumassi  All rights reserved</small></div>
        </div>
 
					
			</div>
			<!-- end content -->
 	
        </div>
		<!-- end content-wrapper -->
		
 	    <div id="sidebar-wrapper" class="bg-sidebar">	
		    
		   
		
		<div id="sidebar" >
		    <!-- 	Sidebar -->
	    	<ul class="navbar-nav  sidebar sidebar-dark accordion" id="accordionSidebar">
				<div id="sidebar-header-wrapper" class="d-flex">
				

	     		 <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
			        	    	
			        
			        <div class="sidebar-brand-icon rotate-n-15">
			          
			          	<i class="fas fa-comment-dots"></i>
			        </div>
		        	<div class="sidebar-brand-text mx-3">채팅</div>
	      		</a>
	      		</div>
			     <!-- Divider -->
			     <hr class="sidebar-divider my-0">
	      		
	   		    <!--  Nav Item - Total -->
			   	 <li class="nav-item active hoverStyle" data-crno='+list[i].crno+'>
			   	 <div  class="firstRow color-white"><i class="fas fa-caret-right"></i><span>&nbsp;&nbsp;&nbsp;채팅방이름</span><button  class="btn float-right color-white chatRoomRemoveBtn"><i class="fas fa-times "></i></button></div>
			   	<div  class="secondRow"> <div class="firstCol"><span class="lastChat">&nbsp;&nbsp;&nbsp; 마지막 채팅내용</span></div><div class="secondCol"><span class="float-right chatUnreadCount">300</span></div></div>
			   	 
			   	 
			   </li>
	
	 
	    	</ul>
	    	
	    	
    	
    	</div>
    	<!-- sidebar end -->
    	
  		<div id="sidebar2" >
		    <!-- 	Sidebar -->
	  	<ul class="navbar-nav  sidebar sidebar-dark accordion" > 
				<div id="sidebar-header-wrapper" class="d-flex">
				
				<div class="align-items-center d-flex" id="leftBtn">
					<button id="exitChatBtn" class="btn color-white" ><i class="fas fa-arrow-left " ></i></button>	
				</div>
	     		 <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
			        	    	
			  
		        	<div class="sidebar-brand-text mx-3" id="chatRoomName">채팅</div>
	      		</a>
	      		</div>
			     <!-- Divider -->
			     <hr class="sidebar-divider my-0">
	      		

						
			     
					
			 		<div  id="chatView">
						<div class="chatDiv">
							<span class="myChat float-right">안녕하세요^^fkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfk</span><br>
							<span class="time float-right">2020/01/02 23:08</span><span class="unread float-right">1</span>
						</div>
						<div class="chatDiv">
							<span class="otherChat float-left">반가워요!!fkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfk</span><br>
							<span class="time float-left">2020/01/02 23:08</span>
						</div>

					</div>
					<div id="chatSend">
						<textarea id="chatWriteArea" class="form-control"></textarea>
						<button id="chatSendBtn" class="btn btn-primary" disabled>Send</button>
					</div> 
				
	
	 
	    	 </ul> 
	    	
	    	
    	
    	</div>
    	<!-- sidebar2 end -->
	</div>
	<!--sidebar-wrapper end
	-->
	</div> 
	<!-- end Page Wrapper -->
       
    
    
    
 
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
        </div>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script> <!-- 경로 바꿔야할곳 -->
        <script src="assets/mail/contact_me.js"></script> 
        <!-- Core theme JS-->
        <script src="<%=request.getContextPath() %>/resources/js/scripts.js"></script> <!-- js 바꿔야할곳-->
		  <script  src="<%=request.getContextPath()%>/resources/js/chat.js"></script>

</body>
</html>