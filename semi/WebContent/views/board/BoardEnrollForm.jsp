<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>

<!DOCTYPE html>
<html>

<div class="card shadow mb-4">
	<div class="card-header py-3">우리마을 게시글</div>

	<div class="card-body">

		<div class="container">

			<form id="insertForm" action="<%=contextPath%>/insert.bo" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" placeholder="title" id="title" name="title">
				</div>



				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="summernote"
						name="content"></textarea>
				</div>

				<div class="mb-3">
					<label for="formFileMultiple" class="form-label">파일첨부</label> <input class="form-control" type="file" 	id="formFileMultiple"  name="upfile">
				</div>


				<button type="submit" class="btn btn-primary">글쓰기 등록</button>
				<button type="reset" class="btn btn-danger">취소하기</button>
			</form>
		</div>
		<script>
			
		</script>

	</div>



	<!-- card-body end -->
</div>



<script>
	/*$('#summernote').summernote(
			{
				placeholder : "내용을넣어주세요",
				tabsize : 2,
				height : 120,

				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]*/
			});
</script>


<%@ include file="../common/footer.jsp"%>