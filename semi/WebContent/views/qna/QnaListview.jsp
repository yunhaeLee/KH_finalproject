<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.kh.qna.model.vo.*"%>
<% 
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
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
	<h2>Q&A   &nbsp; <i class="fas fa-bullhorn" style="font-size: 30px;"></i></h2>
	</div>

	<div class="card-body">



			<nav class="navbar navbar-light bg-light" id="navibar1">

				
			<% if(loginUser != null){ %>
         	<a href="enrollForm.qo" class="btn btn-primary float-right" >글쓰기
         	 &nbsp; <i class="fas fa-pen" style="font-size: 20px;"></i></a>
         	<% } %>
			</nav>
	
			<table class="table table-striped table-hover listArea">
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">글제목</th>
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
					<% for(Qna q : list){ %>
					<tr>
							<td scope="row"><%= q.getQnaNo() %></td>
							<td><%= q.getQnaTitie() %></td>
							<td><%= q.getQnaWriter() %></td>
							<td><%= q.getQnaCount() %></td>
							<td><%= q.getQnaDate() %></td>
					</tr>
						<%} %>
				<%} %>
					
				</tbody>
			</table>

	  <br>
	   <br>
	   	
	   <br>
	   <br>
<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=contextPath%>/list.qo?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= contextPath %>/list.qo?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button disabled> <%= p %> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath %>/list.qo?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else { %>
			<button onclick="location.href='<%= contextPath %>/list.qo?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
			<!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%=contextPath%>/list.qo?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div> 


		<br><br>

	
		<script>
		<%if (!list.isEmpty()) {%>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				var qno = $(this).children().eq(0).text();
				
			
				location.href="<%= contextPath %>/detail.qo?qno=" + qno;
			});
		});
		<% } %>
		</script>


	</div>


	<!-- card-body end -->
</div>



<%@ include file="../common/footer.jsp"%>

    