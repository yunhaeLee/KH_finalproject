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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/plugins/dataTables.bootstrap4.min.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ablePro/assets/css/plugins/select.dataTables.min.css">

<style>
	#buttons button{
		margin: 5em;
		display: inline-block;
		margin-left: auto;
		margin-right: auto;
	}
	#buttons{
		display: inline-block;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	
	span.txt{
	 	 color: #383A3C;
	}
	
	span.txt:hover {
    color: #B8ACD0;
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
	  padding: 0px 0px 20px 0px;
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
	
	div.left {
	 	width: 30%;
        float: left;
        box-sizing: border-box;
        
    	}
    
    	div.right {
        width: 70%;
        float: right;
        box-sizing: border-box;
        
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
               <h3>설문</h3>
            </div>
            
            
			
			
		<div>
		
		<!-- left -->
		<div class="left">
          		
			
                    <div class="table-responsive">
                        <div class="card-body" align="center">
				
				<!-- 설문 등록 -->
					<a href="sinsertForm.so" class="btn  btn-primary btn-lg">
					<span class="icon text-white-50">
						<i class="fas fa-plus"></i>
					</span>
					<span class="text" style="color: white">&nbsp;설문등록</span>
					</a>
					<br><br>
					
		<ul class="pcoded-submenu">
				<li>
					<p class="title">
						<a href="" data-category="progress">
							<span class="txt" title="진행중인 설문">진행중인 설문</span>
						</a>
					</p>
				</li>
				<li>
					<p class="title">
						<a href="" data-category="finished">
							<span class="txt" title="마감된 설문">마감된 설문</span>
						</a>
					</p>
				</li>
				<li>
					<p class="title">
						<a href="" data-category="my">
							<span class="txt" title="내가 만든 설문">내가 만든 설문</span>
						</a>
					</p>
				</li>
			</ul>
</div>
                      </div>
                  
		</div>
		
		
           	<!-- 컨텐츠 영역 -->
				<br>
				<div class="right">
				<div class="dataTables_wrapper container">
				
			<table id="surveyList" class="table table-hover row-border  nowrap">
               <thead>
	                <tr>
	                <th id="sNo" style="width: 10%;">번호</th>
	                <th id="sStatus" style="width: 10%;">상태</th>
	               	<th id="sTitle" style="width: 25%;">제목</th>
	               	<th id="sDate" style="width: 30%;">설문 기간</th>
	                <th id="sWriter" style="width: 15%;">작성자</th>
	                </tr>
	           </thead>
            
 
            <tbody role="alert">
            <c:forEach items="${ list }" var="s">
            <tr>
	            <td>${s.surNo}</td>
	            <td>${s.status}</td>
	            <td><span id="txt">${s.surTitle}</span>
	            <td>${s.surStart} ~ ${s.surEnd}</td>
	            <td>${s.surWriter}</td>
            </tr>
            </c:forEach>	
            </tbody>
            
            </table>
		</div>
        </div>
        
         <!-- 페이지 영역  
              <br><br>
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
               </div> -->
               
        <br>
        </div>
        </div>
        
        
        
        </div> <!-- left right -->
		</div>
	</div> <!--지우지 마세요    div class="row"  -->
	</div> <!--지우지 마세요   div class="pcoded-content"  -->
	</div> <!--지우지 마세요    div class="pcoded-main-container"  -->
	
	
	<!-- [ Main Content ] 메인화면 끝 -->
	

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
    $(document).ready(function() {
		var table = $('#surveyList').DataTable({
			columnDefs: [
				{ orderable: false, targets: [1,2,3,4]},
				{ searchable: false, targets: [0,1]}
              ],
              dom: '<"float-right">t<"float-left"f><"float-right"p>'
          	
	    });
		
	});
    
    $(function(){
		$("#surveyList tbody tr").click(function(){
			location.href="sdetail.so?sno=" + $(this).children().eq(0).text();
		});
	});
    
   
	</script>
    
<!-- JS -->
	<script src="${pageContext.request.contextPath}/resources/board/assets/js/boardjs.css"></script>
 	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/plugins/dataTables.select.min.js"></script>
</body>
</html>