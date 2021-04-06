<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String today = sdf.format(date);
%>
<%@ include file="../common/header.jsp"%>


<div class="card shadow mb-4">
	<div class="card-header py-3">
	<h2>Q&A 등록  &nbsp; <i class="fas fa-edit" style="font-size: 20px;"></i><h2>
	
	</div>

	<div class="card-body">

		<div class="container">
			
			<form action="<%= contextPath %>/insert.qo" method="post">
			<form action="" method="post">
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" placeholder="title" id="title" name="title">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="summernote" name="content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">글쓰기 등록
				&nbsp; <i class="fas fa-check" style="font-size: 20px;"></i></button>
			</form>
		</div>
		
		
		<script>
			$(document).ready(function() {
				$('#summernote').summernote({
					placeholder : 'content',
					minHeight : 370,
					maxHeight : null,
					focus : true,
					lang : 'ko-KR'
				});
			});
		</script>


	</div>


	<!-- card-body end -->
</div>



<%@ include file="../common/footer.jsp"%>


    