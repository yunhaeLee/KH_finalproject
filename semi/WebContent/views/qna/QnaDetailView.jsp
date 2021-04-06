<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.qna.model.vo.*"  %>
<%
	Qna q = (Qna)request.getAttribute("qna");
	Reply r = (Reply)request.getAttribute("reply");
%>
<%@ include file="../common/header.jsp"%>



<div class="card shadow mb-4">
	<div class="card-header py-3"><h2>Q&A 상세보기 </h2></div>

	<div class="card-body">
         	<div class="btn3" style="margin-left:70%;">
			<%
				if (loginUser != null && loginUser.getM_no()  == q.getQnaWriterNo()) {
			%>
			<button class="btn btn-primary" id="updateBtn" onclick="updateForm();">수정
			 &nbsp; <i class="fas fa-edit" style="font-size: 20px;"></i></button>
			<button class="btn btn-danger" id="delBtn" onclick="deleteQna();">삭제
			 &nbsp; <i class="fas fa-trash-alt" style="font-size: 20px;"></i></button>
			<%
				}
			%>

		</div> <br>
		<div class="container">
			<div class="row ">
			
			<table class= "table table-striped" style="text-align:center;boarder:1px solid #dddddd" >
			    <thead>
			    <tr>
			    	<th style="width:20%; text-align:left">제목 </th>
			       <th colspan="3" style="text-align:center"><%= q.getQnaTitie() %></th>
			    </tr>
			       </thead>
			    <tbody>  
			    <tr>
			      <td style="width:20%; text-align:left">작성자 : </td>
			      <td colspan="2" style="text-align:left"><%= q.getQnaWriter() %></td>
			    </tr>
			    <tr>
			      <td style="width:20%; text-align:left">작성일자 : </td>
			      <td colspan="2" style="text-align:left"><%= q.getQnaDate() %></td>
			    </tr>
			    
			    
			     <tr>
			      <td style="width:20%; text-align:left">내용 : </td>
			      <td colspan="2" style=" height:500px; text-align:left"><%= q.getQnaContent() %>
			
			      </td>
			      
			    </tr>
			  
			</tbody> 
			</table>
			 
			
			</div>


		</div>


		<form action="" id="postForm" method="post">
			<input type="hidden" name="qno" value="<%= q.getQnaNo() %>">
		</form>
			<script>
			function updateForm(){
				$("#postForm").attr("action", "<%=contextPath%>/updateForm.qo");
				$("#postForm").submit();
			}
			
			function deleteQna(){
				
				 if (confirm("정말 삭제하시겠습니까?"))
		   	     $("#postForm").attr("action", "<%=contextPath%>/deleteQ.qo");
				 $("#postForm").submit();
			}
		</script>
		 <!-- 추천/신고/채팅버튼 -->
         <div class="btn1"  style="margin-left:1150px;">
         	<button class="btn btn-lg border-0  " id="sidebarBtn"  >
			<i class="far fa-thumbs-up" style="font-size: 30px;"></i>
			 </button> 
           	<button class="btn btn-lg border-0  " id="sidebarBtn"  >
			</i> <i class="fas fa-angry" style="font-size: 30px; "></i>
            </button>
            
           	<button class="btn btn-lg border-0  " id="sidebarBtn" >
            <i class="far fa-comment-dots" style="font-size: 30px;"></i>  
            </button>
         </div>

		<div class="btn1" align="center">
			<button class="btn btn-secondary"
				onclick="location.href='<%=contextPath%>/list.qo?currentPage=1';">목록으로
				&nbsp; <i class="fas fa-list" style="font-size: 20px;"></i></button>

		</div>
		<br><br>
		
<!-- 댓글 관련 영역 -->
	<div class="replyArea">
		<!-- 댓글 작성하는 div -->
	
			
				<% if(loginUser != null && loginUser.getId().equals("admin")){ %>
					
				<div class="input-group mb-3" style="width:800px; margin-left:25%;">
				
				
				  <textarea class="form-control" id="replyContent"  style="resize:none; text-align:left;"  rows="3" placeholder="댓글을 작성해주세요"></textarea>	  
			
				 <button type="submit" class="btn btn-primary mb-3"id="addReply"> 등록</button>
				</div>
				
				<% }else { %>
				<div class="input-group mb-3" style="width:800px; margin-left:25%;">
				<textarea class="form-control" id="replyContent"  style="resize:none; text-align:center;"  rows="3" placeholder="관리자만 댓글이 가능합니다."></textarea>
					</div>
				<% } %>

		<!-- 댓글 리스트들 보여주는 div -->
		<div id="replyListArea" >
			<table class="table" id="replyList" align="center"  style="width:800px;">
			 <thead>
			     <tr>
				  
				    </tr>
			 	</thead>
		   </table>
		</div>
	</div> 
	
	
	<script>
	  $(function(){
		 selectReplyList(); 
		 $("#replyList").on("click","#delRQBtn",function(){
			if(confirm("정말 삭제하시겠습니까?")){
				var qno = $(this).data("qno");
				$.ajax({
					url : "delReply.qo",
					type : "get",
					data : {qno:qno},
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
			var qId=<%=q.getQnaNo()%>;
			
			$.ajax({
				url:"qinsert.qo",
				type:"post",
				data:{
					content:content,
					qId:qId
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
			url:"qlist.qo",
			data:{qId:<%=q.getQnaNo()%>},
			type:"get",
			success:function(list){
				console.log(list);
				var value = "";
				for(var i in list){
					value += '<tr>' + 
								'<td width="100px" height="150px" ">작성자 <br>' + list[i].replyWriter+'<br>'+'<div style=" font-size:5px; color:#7CAA7A;">' +list[i].createDate+'</div>' + '</td>' +
								'<td width="200px" height="150px">' + list[i].replyContent + '</td>' + '<td width="100px" >' ; 
						if(list[i].replyWriterNo==<%=loginUser.getM_no()%>){				
						value += '<button class="btn btn-danger" id="delRQBtn" data-qno ="'+list[i].replyId +'" style="width:50px; font-size:5px;"> 삭제 </button>';
						}
						value+='<button class="btn btn-lg border-0  replyReportQBtn" data-qno="'+list[i].replyId+'"></i> <i class="fas fa-angry" style="font-size: 25px; "></i></button>' +'</td></tr>';
						
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

<%@ include file="../common/footer.jsp"%>