<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.notice.model.vo.*" %>
<%
Notice n =(Notice)request.getAttribute("notice"); 
%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html>
<html>

<div class="card shadow mb-4">
	<div class="card-header py-3">
	<h2>공지사항 수정  &nbsp; <i class="fas fa-edit" style="font-size: 30px;"></i></h2></div>

	<div class="card-body">

		<div class="container">

			<form id="updateForm" action="<%=contextPath%>/update.no"" method="post">
			<input type="hidden" name="nno" value="<%= n.getNoticeNo() %>">
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" placeholder="title" id="title" name="title" value="<%= n.getNoticeTitle() %>">
				</div>



				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="summernote"
						name="content"><%= n.getNoticeContent() %></textarea>
				</div>


				<button type="submit" class="btn btn-primary">글수정 
				&nbsp; <i class="fas fa-pen" style="font-size: 20px;"></i></button>
				<button type="reset" class="btn btn-danger">취소하기
				&nbsp; <i class="fas fa-undo" style="font-size: 20px;"></i></button>
			</form>
		</div>
		<script>
			
		</script>

	</div>



	<!-- card-body end -->
</div>
    