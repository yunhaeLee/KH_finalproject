<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

.cate{
 	background-color: #B8ACD0;

}

.pagination {
  display: inline-block;
  margin-left: auto;
  margin-right: auto;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: rgb(2, 1, 13);
  color: white;
}


 a:link { color: gray; text-decoration: none;}
 a:visited { color: gray; text-decoration: none;}
 a:hover {text-decoration: none;}

.bContents:hover {
	background: rgb(250,250,250);
}
</style>
</head>

<body class="">
  
   <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
   <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
  
   
<!--메인 화면 전체시작 -->
   <div class="pcoded-main-container">
     <div class="pcoded-content">
      
        
   <!-- [ breadcrumb start 부트스트랩에서 사이트 이동하는기능 -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10"></h5>
                        </div>
                        <ul class="breadcrumb">
                          <li class="breadcrumb-item"><a href="index.jsp"><i class="feather icon-home"></i></a></li>
                          <li class="breadcrumb-item"><a href="dlist.bo">부서 게시판</a></li>
                          <li class="breadcrumb-item"><a href="clist.bo">커뮤니티</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  
  
	<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->
	

	 
	<!-- 메인레버 -->
	<div id="wrapper">

		<!-- 컨텐츠 영역 -->
		<div class="container-fluid">
		
		<!-- 타이틀 영역 -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              
               <h5>부서 게시판</h5>
            </div>
            
        <!-- 리스트 영역 -->
            <div class="card-body">
	            <div style="margin-bottom: 1em;">
	            	<form action="notice.do" autocomplete="off" style="display: inline-block; width:50%;">
	              		<input type="search" name="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable" style="display: inline-block; width: 50%">
	              		<input type="submit" class="btn" value="검색" style="border: 1px solid lightgray">
	              		<input type="hidden" name="cate" value="${cate}">
	              		<c:set var="search" value="${search}"/>
					<c:if test="${!empty search}">
						<p>"${search}"에 대한 검색결과 입니다.</p>
					</c:if>
	           		</form>
	           		<div style="display: inline-block; width:40%; float: right;">
	           			<select id="selectbox" name="dataTable_length" name="cate" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm" style="width:40%; float: right;">
		           			<option value="countDesc">조회수 높은순</option>
		           			<option value="DateDesc">최신 게시물 순</option>
		           			<option value="DateASC">오래된 게시물 순</option>
	           			</select>
	           			<script type="text/javascript">
	           				$(document).ready(function(){
	           					var cate = "${cate}";
	           					$("#selectbox").val(cate).prop("selected",true);
	           				});
	           			
	           				$("#selectbox").change(function(){
	           					var cate = $("#selectbox option:selected").val();
	           					var search = "${search}";
	           					var page = "${page}";
	           					
	           					window.location.href="notice.do?search="+search+"&page="+page+"&cate="+cate;
	           				});
	           			</script>
	           		</div>
	       	</div>
              <div class="table-responsive" style="clear: both;">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>게시번호</th>
                      <th>제목</th>
                      <th>조회수</th>
                      <th>게시자</th>
                      <th>게시일</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>게시번호</th>
                      <th>제목</th>
                      <th>조회수</th>
                      <th>게시자</th>
                      <th>게시일</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<!-- 상단 노출수  -->
                  	<c:forEach var="i" items="${important}" >
                  	<c:url var="bdetail" value="bdetail.do">
                  		<c:param name="cate" value="${cate}"/>
                  		<c:param name="search" value="${search}"/>
                  		<c:param name="bNo" value="${i.bNo}"/>
                  		<c:param name="page" value="${ pi.currentPage }"/>
                  	</c:url>
						<tr style="background-color: rgb(220,220,220); font-weight: bold;">
							<td>${i.bNo}</td>
							<td><i class="as fa-fw fa fa-bullhorn"> </i>
							
							<td>${i.bCount}</td>
							<td>${i.empName}</td>
							<td>${i.bDate}</td>
						</tr>
					</c:forEach>
					<!-- 일반 노출부  -->
					<c:forEach var="n" items="${normal}" >
					<c:url var="bdetail" value="bdetail.do">
						<c:param name="cate" value="${cate}"/>
                  		<c:param name="search" value="${search}"/>
                  		<c:param name="bNo" value="${n.bNo}"/>
                  		<c:param name="page" value="${ pi.currentPage }"/>
                  	</c:url>
					<tr class="bContents">
						<td>${n.bNo}</td>
						
						<td>${n.bCount}</td>
						<td>${n.empName}</td>
						<td>${n.bDate}</td>
					</tr>
					</c:forEach>
                  </tbody>
                </table>
                <!--글쓰기 버튼  -->
                <c:if test="${loginEmp.empStatus eq 'A' }">
                <a href="ninsertForm.bo" class="btn btn-primary btn-icon-split">
					<span class="icon text-white-50">
						<i class="fas fa-check"></i>
					</span>
					<span class="text" style="color: white">글쓰기</span>
				</a>
				</c:if>
								<!-- 페이지 영역  -->
               	<div class="row" style="width: 90%; margin-left: 5%;">
               		<div class="pagination">

							<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#!">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#!">1</a></li>
								<li class="page-item"><a class="page-link" href="#!">2</a></li>
								<li class="page-item"><a class="page-link" href="#!">3</a></li>
								<li class="page-item"><a class="page-link" href="#!">Next</a></li>
							</ul>
						</nav>
						
					
					</div>
               </div>
				
              </div>
            </div>
          </div>			
				

		</div>

	
	
	</div> <!--지우지 마세요    div class="row"  -->
	</div> <!--지우지 마세요   div class="pcoded-content"  -->
	</div> <!--지우지 마세요    div class="pcoded-main-container"  -->
	
	
	<!-- [ Main Content ] 메인화면 끝 -->

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
</body>
</html>