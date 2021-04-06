<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.report.model.vo.Report,java.text.SimpleDateFormat"%>
<%@ include file ="../common/header.jsp" %>
<%
	Report r=(Report)request.getAttribute("report");
	String pagee=(String)request.getAttribute("page");
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String date=sdf.format(r.getReportDate());
	int type=r.getReportType();
	
	
%>
       <script>
       	$(function(){
       		
       		
       		
       		var delBtn=$("#delBtn");
       		var getBtn=$("#getBtn");
       		<% if(type==1){ %>
       			console.log("111");
       			delBtn.text("댓글 삭제하기");
       			getBtn.text("댓글 조회하기");
       			
     			getBtn.on("click",function(){
     				
     				
      				$.ajax({
      					url:"getReply",
      					type:"get",
      					data:{rno :<%=r.getReportObjNo()%>},
      					success:function(reply){
      						$("#replyWriter").val(reply.replyWriter);
      						$("#replyContent").val(reply.replyContent);
      						$("#replyDate").val(reply.createDate);
      						
      						$("#replyModal").modal("show");
      					},
      					error:function(){
      						console.log("댓글 가져오기 실패");
      					}
      					
      					
      					
      				});
      				
     				
      				
      				
            	}); 
     			
     			
 				delBtn.on("click",function(){
 					if(confirm("정말로 삭제하시겠습니까?")){
	      				$.ajax({
	      					url:"delReply",
	      					type:"get",
	      					data:{rno :<%=r.getReportObjNo()%>},
	      					success:function(){
	      						alert("댓글 삭제 성공");
	      					},
	      					error:function(){
	      						alert("댓글 삭제 실패");
	      					}
	      					
	      					
	      					
	      				});	
 					}
      				
 				}); 
     
       		<% }else if(type==2){ %>
	   			delBtn.text("게시글 삭제하기");
	   			getBtn.text("게시글 조회하기");
       		
    			getBtn.on("click",function(){
            		
    				window.open('<%=request.getContextPath()%>/getBoard?bno=<%=r.getReportObjNo()%>', '_blank'); 

     				
      				
            	}); 
				delBtn.on("click",function(){
					if(confirm("정말로 삭제하시겠습니까?")){
      				$.ajax({
      					url:"delBoard",
      					type:"get",
      					data:{bno :<%=r.getReportObjNo()%>},
      					success:function(){
      						alert("게시글 삭제 성공");
      					},
      					error:function(){
      						alert("게시글 삭제 실패");
      					}
      					
      					
      					
      				});	
					}
 				}); 
       		
       		
       		<% }else if(type==3){ %>
	   			delBtn.text("사용자 블랙리스트 추가하기");
	   			getBtn.remove();
	   			
	   			$.ajax({
	   				
	   				url:"getUserInfo",
	   				data: {mno:<%=r.getReportObjNo()%>},
	   				type:"get",
	   				success : function(userInfo){
	   					var name=userInfo.m_name;
	   					var count =userInfo.report_count;
	   					
	   					var insideText="회원 이름 : "+name+"/ 신고 횟수 : "+count;
	   					$("#userInfo").text(insideText);
	   					
	   					$("#userInfo").css("margin-right","10px");
	   					
	   				},
	   				error : function(){
	   					console.log("회원정보 가져오기 실패");
	   				}
	   				
	   				
	   				
	   				
	   			});
	   			
				delBtn.on("click",function(){
					if(confirm("정말로 블랙리스트에 추가하겠습니까?")){
      				$.ajax({
      					url:"blacklist",
      					type:"get",
      					data:{mno :<%=r.getReportObjNo()%>},
      					success:function(){
      						alert("블랙리스트 추가 성공");
      					},
      					error:function(){
      						alert("블랙리스트 추가 실패");    				

      					}
      					
      					
      					
      				});	
					}
 				}); 
       		
       		<% }%>
       	
       	});
       	
  
        </script>            



	        <div class="card shadow mb-4">
                  <div class="card-header py-3">
                       신고조회    
                       
                   </div>                      
                    
                  <div class="card-body">
          
                  
                  	
                  		<div class="form-group">
                  			<label for="reportNo" class="form-label">신고번호</label>
                  			<input class="form-control" id="reportNo" name="reportNo" type="text" readonly value="<%=r.getReportNo()%>">
                  		
                  		</div>
                  		
                  		                 	
                  		<div class="form-group">
                  			<label for="reportMem" class="form-label">신고한 사용자</label>
                  			<input class="form-control" id="reportMem" name="reportMem" type="text" readonly value="<%=r.getMemNo()%>">
                  		
                  		</div>
                  		
                  		<div class="form-group">
                  			<label for="reportCategory" class="form-label">카테고리</label>
                  			<input class="form-control" id="reportCategory" name="reportCategory" type="text" readonly value="<%=r.getReportCategory()%>">
                  		
                  		</div>
                  		<div class="form-group">
                  			<label for="reportCategory" class="form-label">내용</label>
						  <textarea class="form-control" id="reportCategory" name="reportCategory" rows="3" readonly ><%=r.getReportContent()%></textarea>
                  		</div>
                  		
                  		                 		
                  		<div class="form-group">
                  			<label for="reportDate" class="form-label">신고 날짜</label>
                  			<input class="form-control" id="reportDate" name="reportDate" type="text" readonly value="<%=date%>">
                  		
                  		</div>
                  			<label id="userInfo"></label>
                  		  <button class="btn btn-primary" id="getBtn"></button>
                  		  <button class="btn btn-danger" id="delBtn" ></button>	
                  		  <button class="btn btn-danger float-right" id="reportDelBtn" onclick="location.href='<%=request.getContextPath()%>/delReport?page=<%= pagee %>&rno=<%=r.getReportNo()%>'">신고 삭제</button>
                  		  <button class="btn btn-secondary float-right" onclick="location.href='<%=request.getContextPath()%>/list.re?page=<%= pagee %>'" >목록으로</button>	
                  		  
    
                </div>       
			 <!-- card-body end -->
           </div>
   			<!-- card end -->
 
		<div class="modal" id="replyModal" tabindex="-1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">댓글 조회</h5>
	                   <button class="close closeModal" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
	                    </button>	      
	          </div>
		      <div class="modal-body">

				        <div class="form-group">
                  			<label for="replyWriter" class="form-label">댓글 작성자</label>
                  			<input class="form-control" id="replyWriter" name="reportMem" type="text" readonly value="">
                  		
                  		</div>	
                 		<div class="form-group">
                  			<label for="replyContent" class="form-label">댓글 내용</label>
						  <textarea class="form-control" id="replyContent" name="replyContent" rows="3" readonly ></textarea>
                  		</div>
	                 	<div class="form-group">
                  			<label for="reportDate" class="form-label">댓글 작성 날짜</label>
                  			<input class="form-control" id="replyDate" name="replyDate" type="text" readonly value="">
                  		
                  		</div>

		      </div>
		      <div class="modal-footer">
		      </div>
		    </div>
		  </div>
		</div>



<%@ include file ="../common/footer.jsp"%>