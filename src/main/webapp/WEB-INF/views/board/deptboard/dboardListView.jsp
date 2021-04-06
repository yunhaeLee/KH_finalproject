<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

 <!-- Favicon icon -->
 <link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
   	
<!-- CSS -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/board/assets/css/style.css" />
<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/board/assets/js/boardjs.css"></script>

	<style>
	
	div.left {
	 
        float: left;
        box-sizing: border-box;
    	}
    
    	div.right {

        float: right;
        box-sizing: border-box;
   		}
	
	:root {
		--aside-width: 17.625rem;
		}
		
	.cate{
	 	background-color: #B8ACD0;
	
	}
	
	.pagination {
	  display: inline-block;
	  margin-left: auto;
	  margin-right: auto;
	  padding: 10px 0px 0px 0px;
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
	
	
	.app-board-category{
	display:flex;
	padding-left:1.5rem;
	margin-bottom:1rem;
	white-space:nowrap;
	overflow-x:auto
	}
	
	@media (max-width:1024px){
	.app-board-category{
	margin:1rem
	}
	}
	
	.app-board-category>li{
	position:relative;
	margin-right:2rem
	}
	
	.app-board-category>li>a{
	display:inline-flex;
	justify-content:center;
	align-items:center;
	padding:1rem 0;
	color:var(--color-gray-600);
	font-size:0.875rem;
	font-weight:400;
	border-bottom:2px solid transparent;
	transition:250ms
	}
	
	.app-board-category>li>a .app-document-count{
	display:none;
	margin-left:0.5rem;color:var(--color-gray-600);font-size:0.75rem}
	
	.app-board-category>li>a:hover{
	color:var(--color-gray-700)}
	
	.app-board-category>li.active>a{
	color:var(--color-gray-900);
	font-weight:600;
	border-bottom-color:var(--color-gray-900)
	}
	
	.app-board-category .app-category-child{
	position:absolute;
	left:0;
	z-index:10;
	display:none;
	padding-top:0.5rem;
	min-width:180px}
	
	.app-board-category .app-category-child>ul{padding:0}
	
	.app-board-category .app-category-child>ul>li{
	background-color:var(--color-card-background);
	border-radius:var(--border-radius-2);
	box-shadow:var(--box-shadow-1)}
	
	.app-board-category .app-category-child>ul>li>a{
	display:block;
	padding:0.875rem 1rem;
	color:var(--color-black);
	font-size:0.875rem;transition:250ms}
	
	.app-board-category .app-category-child>ul>li>a:hover{background-color:var(--color-gray-200)}
	
	.app-board-category .app-category-child>ul>li.app-ative>a{font-weight:600}
	
	.app-board-category>li:hover>.app-category-child{display:block}

	</style>
</head>

<body>
  
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
                          <li class="breadcrumb-item"><a href="clist.bo">커뮤니티</a></li>
                         <li class="breadcrumb-item"><a href="dlist.bo">부서 게시판</a></li>
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
               <h5><br>${loginUser.deptName} 게시판</h5>
               <input type="hidden" name="deptCode" id="deptCode" value="${loginUser.deptCode}">
               <!--글쓰기 버튼  -->
                <div class="right">
                <a href="dinsertForm.bo" class="btn btn-primary btn-icon-split">
					<span class="icon text-white-50">
						<i class="fas fa-plus"></i>
					</span>
					<span class="text" style="color: white">&nbsp;글쓰기</span>
				</a>
				<br>
				</div>
            </div>
            
            
    <!-- 리스트 영역 -->
    	


	<div class="app-board-section">
	

	<!-- 카테고리 영역 -->
		<div class="card-body">
		<ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
			<li class="nav-item">
				<a class="nav-link active text-uppercase" id="all-tab" data-toggle="tab" href="" role="tab" aria-controls="all" aria-selected="true">전체</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-uppercase" id="notice-tab" data-toggle="tab" href="" role="tab" aria-controls="notice" aria-selected="false">공지</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-uppercase" id="alarm-tab" data-toggle="tab" href="" role="tab" aria-controls="alarm" aria-selected="false">알림</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-uppercase" id="star-tab" data-toggle="tab" href="" role="tab" aria-controls="star" aria-selected="false">긴급</a>
			</li>
		</ul>
		</div>


    <!-- 리스트 영역 -->
  	<!-- 로그인한 유저와 부서 코드가 같은 리스트만 출력되도록 -->
 
    <c:forEach items="${list}" var="db">
     <div class="dboardList">
     <input type="hidden" value="${db.dboardNo}">
    <ul class="app-board-template-list">
        <li>
            <a class="tw-flex-1">
	        <div class="tw-flex-1">
	          	<div class="app-list-title tw-flex-wrap">
	          		<span> [${db.dboardCategory}]
	            	<span class="tw-mr-1">${db.dboardTitle}</span>
	            	</span>
				</div>
	          
	          <div class="app-list-meta">
	             <span>
	              <div class="app-list-member" style="color: #;">
	                	<div class="app-avatar" style="width: 1.25rem; height: 1.25rem;">
	                 		<div class="member_4 tw-inline-flex tw-items-center">${db.dboardWriterName}</div>
	              		</div>
				</div>
	            </span>        
				<span>${db.dboardDate}</span>                    
	                                                                  
	            <span>
			               <span class="tw-mr-1">조회</span>
			               <span>${db.count}</span>
			            </span>            
	         </div>
         
        	</div> <!--   <div class="tw-flex-1"> -->
        	<!-- 댓글 count -->
		    <div class="app-list-comment">${ db.replyCount }</div>
        	</a>
    	</li>
    </ul>
    </div>
    </c:forEach>
    	
   
 	
	<div class="card-body">
	    
		<br><br><div> <!-- 하단 영역 --> 
		
		<!-- 서치 버튼 
				<div class="left">&nbsp;
					<label><input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dboardList" name="searchKey" id="searchKey"></label>
					<a href="dsearch.bo" class="app-button app-button-rounded app-button-xs primary">
						<span class="text" style="color: white">검색</span>
					</a>
				</div>
		-->
		  
        		
       <!-- 페이징 영역 -->
       <div class="right">
  		<div id="pagingArea">
  		
         <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="dlist.bo?currentPage=${ pi.currentPage-1 }"><div class="feather icon-chevron-left"></div></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href=""><div class="feather icon-chevron-left"></div></a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="dlist.bo?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="dlist.bo?currentPage=${ pi.currentPage+1 }"><div class="feather icon-chevron-right"></div></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="dlist.bo?currentPage=${ pi.currentPage+1 }"><div class="feather icon-chevron-right"></div></a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
             </div>
		        
		
				

				
        </div> <!-- 하단 영역 -->
			
			<br><br>	
        
  	
          </div>
  
  
            </div>
          </div>			
				

		</div>

	
	
	</div> <!--지우지 마세요    div class="row"  -->
	</div> <!--지우지 마세요   div class="pcoded-content"  -->
	</div> <!--지우지 마세요    div class="pcoded-main-container"  -->
	
	
	<!-- [ Main Content ] 메인화면 끝 -->

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
    

    $(function(){
		$(".dboardList").click(function(){
			location.href="ddetail.bo?dno=" + $(this).children().eq(0).val();
		});
	});
    
   
	</script>
    
<!-- JS -->
	<script src="${pageContext.request.contextPath}/resources/board/assets/js/boardjs.css"></script>
 	
    
</body>
</html>