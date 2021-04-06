<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.kh.board.model.vo.*" %>
  
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
%> 	
	
<%@ include file="../common/header.jsp"%>

<div class="card shadow mb-4">
	<div class="card-header py-3">
				<h2  >우리마을 게시판</h2>
</div>

	<div class="card-body">
		
	
		<% if(loginUser != null){ %>
         	<a href="enrollForm.bo" class="btn btn-primary float-right" >글쓰기</a>
         	<% } %>

		
        <br><br>

	
			<table class="table table-striped table-hover listArea" >
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">글제목</th>
						<th scope="col">지역</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				
				
				<tbody>
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr><%}else{ %>
					<% for(Board b : list){ %>
					<tr>
						<td scope="row"><%= b.getBoardNo() %></td>
						<td><%= b.getBoardTitle() %></td>
						<td><%= b.getRegion1()%>&nbsp;<%= b.getRegion2()%></td>
						<td><%= b.getBoardWriter() %></td>
						<td><%= b.getReadCount() %></td>
						<td><%= b.getCreateDate() %></td>
					</tr>
						<%} %>
				<%} %>
				</tbody>
			</table>


	   
	   <br>
	   <br>
	   <br>
	   <br>
	   
	<!-- 페이징바 만들기 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button disabled> <%= p %> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath %>/list.bo?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else { %>
			<button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
			<!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div> 
		<br><br>
		

	
	<script>
		<%if (!list.isEmpty()) {%>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				var bno = $(this).children().eq(0).text();
				//console.log(nno);
				
				// 쿼리 스트링을 이용하여 get방식으로(url 노출) 글번호를 server로 전달
				location.href="<%= contextPath %>/detail.bo?bno="+ bno;
			});
		});
		<%} %>
		
		
		
	</script>
	



	</div>


	<!-- card-body end -->
</div>



<%@ include file="../common/footer.jsp"%>






