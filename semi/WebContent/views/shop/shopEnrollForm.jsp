<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ page import="com.kh.member.model.vo.*"%>
<%
Member m =(Member)request.getAttribute("loginUser");

%>
<div class="card shadow mb-4">
	<div class="card-header py-3">


		<h2 class="mb-3" align="center">가게등록</h2>
		<!-- 헤더부분 -->
	</div>


	<div class="card-body">

     	
			<form id="shopInsertForm" action="insert.sh" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="writer" value="<%= loginUser.getM_no() %>">
            


			<table align="center" class="table" style="width: 800px; margin-top:auto;">
				<tbody>
					<tr>
						<td>가게상호</td>
						<!-- required : 필수 -->
						<td><input type="text" class="form-control" maxlength="10"
							name="shopName" required></td>
						
					</tr>
					<br>
					<tr>
						<td width="200px"><label class="form-label">가게소개</label></td>
						<td><textarea type="text" class="form-control"
								maxlength="300" name="shopintro" style="height: 200px"
								required></textarea></td>

					</tr>

					<br>

					<tr>
						<td>연락처</td>
						<td><input type="tel" class="form-control" maxlength="11"
							name="phone" placeholder="(-없이)01022222222"></td>
						
					</tr>

			
					<tr>
						<td><label class="form-label">상세주소 </label></td>
						<td><input type="text" class="form-control" maxlength="30"
							name="shopdetaillocation" placeholder="시,구,동,번지,호수 까지 적어주세요"required></td>

					</tr>
					<br>
					<br>

					<tr>
						<td>가게이미지</td>
						<td></td>

					</tr>
				</tbody>
			</table>

			<div id=imgarea style="margin-left: 42%;">
				<td><h5>가게대표사진</h5><img id="titleImg" width="150" height="120" border="1px"></td>
				<td><img id="contentImg1" width="150" height="120" border="1px"></td>
				<td><img id="contentImg2" width="150" height="120"></td>
				<td><img id="contentImg3" width="150" height="120"></td>
			</div>





			<div id="fileArea">
			   
		        <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" > 
				<input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
				<input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
				<input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
			</div>
			<br>
			<br>



			<div align="center">


				<button type="submit" class="btn btn-primary btn-primary"
					id="joinBtn" >홍보하기</button>

			</div>

		</form>


	</div>
	<!-- 바디부분 끝 -->
</div>
<!-- 카드 끝 -->


<script>
	$(function() {
		$("#fileArea").hide();
		$("#titleImg").click(function(){
			$("#file1").click();
		});
		$("#contentImg1").click(function() {
			$("#file2").click();
		});
		$("#contentImg2").click(function() {
			$("#file3").click();
		});
		$("#contentImg3").click(function() {
			$("#file3\4").click();
		});
	});

	function loadImg(inputFile, num) {// 이미지 미리보기 
		//inputFile : 현재 변화가 생긴 input type = "file"
		//num : 조건문을 활용 하기 위해 전달받은 매개변수

		console.dir(inputFile);

		if (inputFile.files.length == 1) {//file이 존재 할경우 
			var reader = new FileReader();// 파일을 읽어들이 FileReader객체를 생성 

			reader.readAsDataURL(inputFile.files[0]);//파일을 읽어주는 메소드  --> 해당 파일을 읽어서 url을 부여 (문자열로 저장 )

			reader.onload = function(e) {//파일 읽기가 다완료 되면 실행할 메소드 
				switch (num) {

				case 1 : $("#titleImg").attr("src", e.target.result); break;
				case 2:
					$("#contentImg1").attr("src", e.target.result);
					break;
				case 3:
					$("#contentImg2").attr("src", e.target.result);
					break;
				case 4:
					$("#contentImg3").attr("src", e.target.result);
					break;
				}
			};

		}
	}
</script>










<%@ include file="../common/footer.jsp"%>

