<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page
	import="java.util.ArrayList,com.kh.board.model.vo.*"%>

<%
	Board b = (Board) request.getAttribute("b");
Attachment at = (Attachment) request.getAttribute("at");

%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세조회</title>

          <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet" /> <!--css 링크 바꿀부분-->
         <script src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js" ></script>
</head>
<body>
	<div class="card shadow mb-4">
	<div class="card-header py-3"><h2>게시판상세보기<h2></h2></div>

	<div class="card-body">
			
			
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
								href="<%=request.getContextPath()%>/resources/board_upfiles/<%=at.getChangeName()%>"><%=at.getOriginName()%></a>
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
							<p ><img width="300px" height="250px" src="<%=request.getContextPath()%>/resources/board_upfiles/<%=at.getChangeName()%>" class="mg-fluid">  </p>
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
		<!-- container -->
		<button class="btn btn-lg btn-secondary float-right" onclick="self.close();">닫기</button>
		</div>
	</div>
</body>
</html>