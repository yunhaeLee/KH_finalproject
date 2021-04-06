<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page
	import="java.util.ArrayList,com.kh.board.model.vo.*, com.kh.shop.model.vo.*"%>

<%
	Board b = (Board) request.getAttribute("b");
Attachment at = (Attachment) request.getAttribute("at");
Reply r = (Reply) request.getAttribute("r");
%>

<%@ include file="../common/header.jsp"%>



<div class="card shadow mb-4">
	<div class="card-header py-3"><h2>게시판상세보기<h2></h2></div>

	<div class="card-body">

		<br>

		<form action="" id="postForm" method="post">
			<input type="hidden" name="bno" value="<%=b.getBoardNo()%>">
		</form>
		<script>
			function updateForm(){
				$("#postForm").attr("action", "<%=contextPath%>/updateForm.bo");
				$("#postForm").submit();
			}
			
			function deleteBoard(){
				
				 if (confirm("정말 삭제하시겠습니까?"))
		   	     $("#postForm").attr("action","<%=contextPath%>/deleteB.bo");
				$("#postForm").submit();
			}
		</script>

		<div class="container">
			<div class="row ">

				<table class="table table-striped"
					style="text-align: center; boarder: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="text-align: center"><%=b.getBoardTitle()%></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%; text-align: left">작성자|</td>
							<td colspan="2" style="text-align: left"><%=b.getBoardWriter()%>
											<!-- 신고-->
								<button class="btn" id="userReportBtn">
									</i> <i class="fas fa-angry" ></i>
								</button>
								<!-- 채팅-->
								<% if(loginUser.getM_no()!= b.getBoardWriterNo()){%>
								<button class="btn" id="chatBtn" data-mno2="<%=b.getBoardWriterNo() %>" data-mname="<%=b.getBoardWriter()%>">
									<i class="far fa-comment-dots" ></i>
								</button>
								<%} %>
							</td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: left">지역|</td>
							<td colspan="2" style="text-align: left"><%= b.getRegion1()%>&nbsp;<%= b.getRegion2()%></td>
						</tr>
						
						<tr>
							<td style="width: 20%; text-align: left">작성일자|</td>
							<td colspan="2" style="text-align: left"><%=b.getCreateDate()%></td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: left">첨부파일|</td>
							<td colspan="2" style="text-align: left">
								<%
									if (at != null) {
								%> <a download="<%=at.getOriginName()%>"
								href="<%=contextPath%>/resources/board_upfiles/<%=at.getChangeName()%>"><%=at.getOriginName()%></a>
								<%
									} else {
								%> 첨부파일이 없습니다. <%
									}
								%>
							</td>
						</tr>

						<tr>
							<td style="width: 20%; text-align: left">내용|</td>
							<td colspan="2" style="height: 500px; text-align: left">
							<%if(at !=null) {%> 
							<p ><img width="300px" height="250px" src="<%=contextPath%>/resources/board_upfiles/<%=at.getChangeName()%>" class="mg-fluid">  </p>
                            <p><%=b.getBoardContent()%></p>
                            </td>
                           	<%
									} else {
								%><p><%=b.getBoardContent()%></p> <%
									}
								%>
						</tr>

					</tbody>
				</table>

			</div>
			<!-- row -->

		</div>
		<!-- container ---->





 		<div>
 			<%
				if (loginUser != null && loginUser.getM_no()==b.getBoardWriterNo()) {
			%>
			<button class="btn btn-primary float-left" id="updateBtn"
				onclick="updateForm();">수정</button>
			<button class="btn btn-danger float-left" id="delBtn" onclick="deleteBoard();">삭제</button>
			<%
				}
			%>
 		
 		<!--button class="btn btn-lg border-0  float-right" id="likeBtn">
				<i class="far fa-thumbs-up" style="font-size: 30px;"></i>
			</button> -->
			
	
 		
 		</div>


		<div class="btn2" align="center">
			<button class="btn btn-secondary"
				onclick="location.href='<%=contextPath%>/list.bo?currentPage=1';">목록으로</button>
		</div>
		<br> <br>


	
		
			
				
				<% if(loginUser != null){ %>
					
				<div class="input-group mb-3" style="width:800px; margin-left:25%; background:#f7f7f7;">
				
				
				  <textarea class="form-control" id="replyContent"  style="resize:none; text-align:left;"  rows="3" placeholder="댓글을 작성해주세요"></textarea>	  
			
				 <button type="submit" class="btn btn-primary mb-3"id="addReply" > 등록</button>
				</div>
				
				<% }else{ %>
				<div class="input-group mb-3" style="width:800px; margin-left:25%;">
				<textarea class="form-control" id="replyContent"  style="resize:none; text-align:center;"  rows="3" placeholder="로그인 후  댓글을 작성해 주세요"></textarea>
					</div>
				<% } %>




	<!-- 댓글 관련 영역 -->
	<div class="replyArea">
		<!-- 댓글 작성하는 div -->
	
		
		
		
		<!-- 댓글 리스트들 보여주는 div -->
		<div id="replyListArea" >
			<table class="table" id="replyList" align="center"  style="width:800px;">
			 <thead>
			     <tr>
				  
				    </tr>
			 	</thead>
				<!-- <tr>
					<td width="100px">admin</td>
					<td width="330px">댓글작성내용</td>
					<td width="150px">2020년 1월 23일</td>
				</tr>
				<tr>
					<td width="100px">user01</td>
					<td width="330px">댓글작성내용</td>
					<td width="150px">2020년 1월 22일</td>
				</tr>
				<tr>
					<td width="100px">test01</td>
					<td width="330px">댓글작성내용</td>
					<td width="150px">2020년 1월 20일</td>
				</tr> -->
			
			</table>

			</div>
	</div> 
 
 <!--게시글 신고 모달  -->
	<div class="modal" id="boardReportModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">게시물 신고</h5>
                 </div>
	      <div class="modal-body">
  		       
                             		
	            <div class="form-group">
				  <label  class="form-label">신고이유</label>
					<select class="form-control reportCategory"  name="reportCategory">
						<option  value="">----</option>
						<option value="사기글 같아요">사기글 같아요</option>
						<option value="증복 게시글">증복 게시글</option>
						<option value="기타사유(내용을 적어주세요)">기타사유(내용을 적어주세요)</option>
						
					</select>
	
				</div>		
                             		
                             		
                  <div class="form-group">
					  <label  class="form-label">내용</label>
					  <textarea class="form-control reportContent" name="reportContent" rows="3"></textarea>
				</div>
				
				
			     <button class="btn btn-primary"  id="boardReportModalSendBtn">보내기</button>	                              
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="boardReportModalHideBtn">닫기</button>
                          
                
	      </div>
	    
	    </div>
	  </div>
	</div>

 <!-- 사용자 신고 모달  -->
	<div class="modal" id="userReportModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">사용자 신고</h5>
                 </div>
	      <div class="modal-body">
  		       
                             		
	            <div class="form-group">
				  <label  class="form-label">신고이유</label>
					<select class="form-control reportCategory"  name="reportCategory">
						<option value="">----</option>
						<option value="비매너 사용자예요">비매너 사용자예요</option>
						<option value="욕설을 해요">욕설을 해요</option>
						<option value="성희롱 발언을 해요">성희롱 발언을 해요</option>
						<option value="기타사유(내용을 적어주세요)">기타사유(내용을 적어주세요)</option>

					</select>
	
				</div>		
                             		
                             		
                  <div class="form-group">
					  <label  class="form-label">내용</label>
					  <textarea class="form-control reportContent" name="reportContent" rows="3"></textarea>
				</div>
				
				
			     <button class="btn btn-primary"  id="userReportModalSendBtn">보내기</button>	                              
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="userReportModalHideBtn">닫기</button>
                          
                
	      </div>
	    
	    </div>
	  </div>
	</div>
 <!--댓글 신고 모달  -->
	<div class="modal" id="replyReportModal" tabindex="-1" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">댓글 신고</h5>
                 </div>
	      <div class="modal-body">
  		       
                             		
	            <div class="form-group">
				  <label  class="form-label">신고이유</label>
					<select class="form-control reportCategory"  name="reportCategory">
						<option value="">----</option>
						<option value="욕설이 포함되어있어요">욕설이 포함되어있어요</option>
						<option value="성희롱이 포함되어있어요">성희롱이 포함되어있어요</option>
						<option value="다른 사람에게 혐오감을 줘요">다른 사람에게 혐오감을 줘요</option>
						<option value="증복 댓글">증복 댓글</option>
						<option value="기타사유(내용을 적어주세요)">기타사유(내용을 적어주세요)</option>
						
					</select>
	
				</div>		
                             		
                             		
                  <div class="form-group">
					  <label  class="form-label">내용</label>
					  <textarea class="form-control reportContent" name="reportContent" rows="3"></textarea>
				</div>
				
				
			     <button class="btn btn-primary"  id="replyReportModalSendBtn">보내기</button>	                              
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="replyReportModalHideBtn">닫기</button>
                          
                
	      </div>
	    
	    </div>
	  </div>
	</div>



	<script>
	  $(function(){
		 selectReplyList(); 

		
		$("#replyList").on("click","#delRBtn",function(){
			
			if(confirm("정말 삭제하시겠습니까?")){
				var rno=$(this).data("rno");
  				$.ajax({
  					url:"delReply",
  					type:"get",
  					data:{rno :rno},
  					success:function(){
  						alert("댓글 삭제 성공");
  						selectReplyList(); 
  					},
  					error:function(){
  						alert("댓글 삭제 실패");
  					}
  					
  					
  					
  				});	
			}
			
			
		});
		 
		$("#addReply").click(function(){
			var content =$("#replyContent").val();
			var bId=<%=b.getBoardNo()%>;
			
			$.ajax({
				url:"rinsert.bo",
				type:"post",
				data:{
					content:content,
					bId:bId
				},
				success:function(){

					
					
					
						selectReplyList();
						$("#replyContent").val("");
						
				

				},
				error:function(){
					console.log("ajax 통신실패");
				}
			});
		}); 
		 
	  });
	  function selectReplyList(){
		  $("#replyList").empty();
		  $.ajax({
			url:"rlist.bo",
			data:{bId:<%=b.getBoardNo()%>},
			type:"get",
			success:function(list){
				console.log(list);

			
				var value = "";
				for(var i in list){
					value += '<tr>' + 
								'<td width="100px" height="150px" ">작성자|<br>' + list[i].replyWriter+'<br>'+'<div style=" font-size:5px; color:#7CAA7A;">' +list[i].createDate+'</div>' + '</td>' +
								'<td width="200px" height="150px">' + list[i].replyContent + '</td>' + 
								'<td width="100px" >' ;
								
						if(list[i].replyWriterNo==<%=loginUser.getM_no()%>){		
					value+=	'<button class="btn btn-danger" id="delRBtn" data-rno="'+list[i].replyId+'"  style="width:50px; font-size:5px;"> 삭제 </button>';
						}
					
					value+='<button class="btn btn-lg border-0  replyReportBtn" data-rno="'+list[i].replyId+'"></i> <i class="fas fa-angry" style="font-size: 25px; "></i></button>' +'</td></tr>';
			
				
				
				}				
				
				   $("#replyList").html(value);
				
				
	
			},
			error:function(){
				console.log("댓글실패 ");
			}
			  
		  });
	  }
	</script>




		</div>
		<!-- card-body end -->
	</div>
	<!-- card end -->
<script>
$(function(){
	
	var boardModal=$("#boardReportModal");
	var replyModal=$("#replyReportModal");
	var userModal=$("#userReportModal");
	
	
	//게시글신고모달에서 보내기 버튼 클릭했을 때
	$("#boardReportModalSendBtn").on("click",function(){
		
		var category=boardModal.find("option:selected").val();
		var content=boardModal.find(".reportContent").val();
		
		if(!category){
			alert("신고이유를 선택하세요");
			return;
		}
		if(!content){
			alert("신고내용을 입력하세요");
			return;
		}
		if(content.length>199){
			alert("신고내용은 200자 이하로 입력하세요");
			return;
		}
		
		boardModal.find(".reportContent").val("");
		boardModal.find("option").eq(0).attr("selected",true);
		
		var jsonObj={objNo:<%=b.getBoardNo()%>,type:2,category:category,content:content,mno:<%=loginUser.getM_no()%>};
		
		console.log(jsonObj);
		
		sendReport(jsonObj);
		
		boardModal.modal("hide");
		
	});
	//댓글신고모달에서 보내기 버튼 클릭했을 때
	$("#replyReportModalSendBtn").on("click",function(){
		
		var category=replyModal.find("option:selected").val();
		var content=replyModal.find(".reportContent").val();
		
		if(!category){
			alert("신고이유를 선택하세요");
			return;
		}
		if(!content){
			alert("신고내용을 입력하세요");
			return;
		}
		if(content.length>199){
			alert("신고내용은 200자 이하로 입력하세요");
			return;
		}
		
		replyModal.find(".reportContent").val("");
		replyModal.find("option").eq(0).attr("selected",true);
		
		var jsonObj={objNo:replyModal.data("rno"),type:1,category:category,content:content,mno:<%=loginUser.getM_no()%>};
		
		console.log(jsonObj);
		
		sendReport(jsonObj);
		
		replyModal.modal("hide");
		
	});
	
	//사용자신고모달에서 보내기 버튼 클릭했을 때
	$("#userReportModalSendBtn").on("click",function(){
		
		var category=userModal.find("option:selected").val();
		var content=userModal.find(".reportContent").val();
		
		if(!category){
			alert("신고이유를 선택하세요");
			return;
		}
		if(!content){
			alert("신고내용을 입력하세요");
			return;
		}
		if(content.length>199){
			alert("신고내용은 200자 이하로 입력하세요");
			return;
		}
		
		userModal.find(".reportContent").val("");
		userModal.find("option").eq(0).attr("selected",true);
		
		var jsonObj={objNo:<%=b.getBoardWriterNo()%>,type:3,category:category,content:content,mno:<%=loginUser.getM_no()%>};
		
		console.log(jsonObj);
		
		sendReport(jsonObj);
		
		userModal.modal("hide");
		
	});
	
	function sendReport(obj){
		
		
		$.ajax({
			
			url:"insert.re",
			type:"post",
			data:obj,
			success:function(){
				alert("신고 등록 완료");
			},
			error:function(){
				
				console.log("신고 보내기 실패");
			}
			
		
		});
	}
	
	
	
	//모달 보이기 , 숨기기 설정 
	$("#userReportBtn").on("click",function(){
		
		userModal.modal("show");
		
		
	});
	
	$("#replyList").on("click",".replyReportBtn",function(){
		
		var rno=$(this).data("rno");
		replyModal.data("rno",rno);
		
		replyModal.modal("show");
		
		
	});
	
	$("#boardReportBtn").on("click",function(){
		
		boardModal.modal("show");
	
		
	});
	
	$("#boardReportModalHideBtn").on("click",function(){
		
		boardModal.find(".reportContent").val("");
		boardModal.find("option").eq(0).attr("selected",true);
		
		boardModal.modal("hide");
		
		
	});
	
	$("#userReportModalHideBtn").on("click",function(){
		
		
		userModal.find(".reportContent").val("");
		userModal.find("option").eq(0).attr("selected",true);
		userModal.modal("hide");
		
		
	});
	
	$("#replyReportModalHideBtn").on("click",function(){
		replyModal.find(".reportContent").val("");
		replyModal.find("option").eq(0).attr("selected",true);
		replyModal.modal("hide");
		
		
	});

});
</script>

	<%@ include file="../common/footer.jsp"%>