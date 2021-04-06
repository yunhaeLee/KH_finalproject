<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.notice.model.vo.*"%>
<%
	Notice n = (Notice) request.getAttribute("notice");
%>
<%@ include file="../common/header.jsp"%>



<div class="card shadow mb-4">
	<div class="card-header py-3"><h2>공지사항 상세보기</h2></div>

	<div class="card-body">
         	<div class="btn3" style="margin-left:70%;">
			<%
				if (loginUser != null && loginUser.getM_no()  == n.getNoticeWriterNo()) {
			%>
			<button class="btn btn-primary" id="updateBtn" onclick="updateForm();">수정
			 &nbsp; <i class="fas fa-edit" style="font-size: 20px;"></i></button>
			<button class="btn btn-danger" id="delBtn" onclick="deleteNotice();">삭제
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
			       <th colspan="3" style="text-align:center"><%= n.getNoticeTitle() %></th>
			    </tr>
			       </thead>
			    <tbody>  
			    <tr>
			      <td style="width:20%; text-align:left">작성자 :</td>
			      <td colspan="2" style="text-align:left"><%= n.getNoticeWriter() %></td>
			    </tr>
			    <tr>
			      <td style="width:20%; text-align:left">작성일자 : </td>
			      <td colspan="2" style="text-align:left"><%= n.getCreateDate() %></td>
			    </tr>
			    
			    
			     <tr>
			      <td style="width:20%; text-align:left">내용 : </td>
			      <td colspan="2" style=" height:500px; text-align:left"><%= n.getNoticeContent() %>
			
			      </td>
			      
			    </tr>
			  
			</tbody> 
			</table>
			 
			
			</div>


		</div>


		<form action="" id="postForm" method="post">
			<input type="hidden" name="nno" value="<%= n.getNoticeNo() %>">
		</form>
			<script>
			function updateForm(){
				$("#postForm").attr("action", "<%=contextPath%>/updateForm.no");
				$("#postForm").submit();
			}
			
			function deleteNotice(){
				
				 if (confirm("정말 삭제하시겠습니까?"))
		   	     $("#postForm").attr("action", "<%=contextPath%>/deleteN.no");
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
				onclick="location.href='<%=contextPath%>/list.no?currentPage=1';">목록으로
				&nbsp; <i class="fas fa-list" style="font-size: 20px;"></i></button>

		</div>

		

	</div>


	<!-- card-body end -->
</div>
<!-- card end -->





<%@ include file="../common/footer.jsp"%>