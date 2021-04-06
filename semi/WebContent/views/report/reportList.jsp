<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.report.model.vo.Report
    ,java.util.ArrayList,java.text.SimpleDateFormat,com.kh.common.PageDto"
    
    
    %>
 
<%@ include file ="../common/header.jsp" %>

<%
	ArrayList<Report> list=(ArrayList<Report>)request.getAttribute("list");
	PageDto dto=(PageDto)request.getAttribute("pageDto");
	
	int endPage=dto.getEndPage();
	int curPage=dto.getCurPage();
	int startPage=dto.getStartPage();

%>

	        <div class="card shadow mb-4">
                  <div class="card-header py-3">
                      <h2> 신고리스트   </h2>  
                       
                   </div>                      
                    
                  <div class="card-body">
          
                  	<table class="table table-bordered table-hover"  width="100%" cellspacing="0">
                  		<thead>
                  			<tr>
                  			<th width="100px">신고 번호</th><th>타입</th><th>카테고리</th><th>신고한 사용자</th><th>신고 날짜</th>
                  			</tr>
                  		</thead>
                  		<tbody>
                  		
 
 			
 						<%if(!list.isEmpty()) { 
              				String type="";
              			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
              			String date="";
 						
 						%>

                  			<% for(Report r : list) {
                  			
                  			
                  				
                  				if(r.getReportType()==1){
                  					type="댓글";
                  					
                  				}else if(r.getReportType()==2){
                  					type="일반게시글";
                  				}else if(r.getReportType()==3){
                  					type="사용자";

                  				}
                  			
                  			 date =sdf.format(r.getReportDate());
                  			
                  			%> 
                 		<tr>
                  		<td><%= r.getReportNo() %></td><td><%=type%></td><td><%=r.getReportCategory() %></td><td><%=r.getMemNo() %></td><td><%=date%></td>
                  		
                  		</tr>
                  	
                  			<%} %>
                  		<%} else{ %>
                  			<tr>
                  			<td colspan="5">조회된 리스트가 없습니다.</td>
                  			</tr>	
                  		<%}  %>
                  		</tbody>
                  	
                  	</table>
                  	<nav aria-label="Page navigation example">
					  <ul class="pagination">
					  <%if(dto.isPrev()){ %>
					    <li class="page-item">
					      <a class="page-link" href="<%=request.getContextPath()%>/list.re?page=<%= startPage-1 %>" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <%} %>
					    
					    <%for(int i=dto.getStartPage()  ; i<=dto.getEndPage() ;i++){ 
					    
					    	if(i==dto.getCurPage()){
					    %>
					 		<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/list.re?page=<%=i%>"><%=i%></a></li>
					 		
					    <% } else{ %>
					    <li class="page-item "><a class="page-link" href="<%=request.getContextPath()%>/list.re?page=<%=i%>"><%=i%></a></li>
					   
					    <% }
					    	} %>
					    <%if(dto.isNext()){ %>
					    <li class="page-item">
					      <a class="page-link" href="<%=request.getContextPath()%>/list.re?page=<%= endPage+1 %>" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					     <%} %>
					  </ul>
					</nav>
                  		
     
                </div>       
			 <!-- card-body end -->
           </div>
   			<!-- card end -->
                    
	<script>
	$(function(){
		$("tbody>tr").on("click",function(){
			
			var rno=$(this).children().eq(0).text();
			location.href="<%=request.getContextPath()%>/detail.re?rno="+rno+"&page="+<%=curPage%>;
		});
		
	});
		
	
	</script>


<%@ include file ="../common/footer.jsp" %>