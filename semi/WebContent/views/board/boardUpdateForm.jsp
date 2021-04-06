<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@page import="com.kh.board.model.vo.*" %>
<%
Board b=(Board)request.getAttribute("board"); 
Attachment at =(Attachment)request.getAttribute("at");
%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html>
<html>

<div class="card shadow mb-4">
	<div class="card-header py-3"><h2>우리마을 게시글 수정하기<h2></h2></div>

	<div class="card-body">

		<div class="container">

			<form id="insertForm" action="<%=contextPath%>/update.bo"" method="post" enctype="multipart/form-data">
			<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" placeholder="title" id="title" name="title" value="<%= b.getBoardTitle() %>">
				</div>



				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="summernote"
						name="content"><%= b.getBoardContent() %></textarea>
				</div>

				<div class="mb-3">
					<label for="formFileMultiple" class="form-label">파일첨부</label>
						<% if(at != null){ %> <!-- 기존의 첨부파일이 있었을 경우 -->
							<%= at.getOriginName() %> <br>
							<input type='hidden' name='originFile' value='<%=at.getChangeName()%>'>
							<input type='hidden' name='originFileNo' value='<%=at.getFileNo()%>'>
						<% }%>		
						
					 <input class="form-control" type="file" id="formFileMultiple"    name="upfile">
				</div>
      
				<button type="submit" class="btn btn-primary">글수정 </button>
				<button class="btn btn-danger"onclick="location.href='<%=contextPath%>/list.bo?currentPage=1';">취소하기</button>
		
			</form>
		</div>
		<script>
			
		</script>

	</div>



	<!-- card-body end -->
</div>

