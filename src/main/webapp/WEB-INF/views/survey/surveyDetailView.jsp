<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
		:root {
		--aside-width: 17.625rem;
		}
		
		a.app-pc-only.app-article-meta-item {
		
			color: #868E96;
		
		}
		
		div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
        
    	}
    
    	div.right {
        
        float: right;
        box-sizing: border-box;
        
   		}
		
	</style>
</head>

<!-- BODY START -->
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
               <h5>설문</h5>
            </div>
            

	<!-- 게시글 제목 영역 -->
	
	<div class="app-board-article-head">
	<div class="app-board-container">
	<!-- <img src="" alt=""> -->
	<h1 class="tw-font-bold tw-text-3xl md:tw-text-xl">설문 디테일뷰 테스트</h1>
	<div class="tw-flex tw-items-end">
	<div class="app-board-article-profile tw-flex tw-items-center">
	<div class="app-profile-image app-avatar">
	<img src="${pageContext.request.contextPath}/resources/ablePro/assets/images/user/profile.png" alt="Profile" /> </div>
		<div class="tw-flex-1 app-profile-body">

	<a class="tw-flex tw-items-center tw-font-bold tw-text-sm link member_4 author">오수현</a>
	<div class="app-article-meta">
	<el-tooltip content="2021-02-04 01:33:27">
	<div class="app-article-meta-item">2021.02.04</div>
	</el-tooltip>
	<div class="app-article-meta-divider"> ・ </div>
	<div class="app-article-meta-item">조회 수 1</div>
	<div class="app-article-meta-divider"> ・ </div>
	<a href="#comment" class="app-pc-only app-article-meta-item">댓글 0</a>
	</div>
	</div>
	</div> <div class="tw-flex-1"></div>
	</div>
	</div>
	</div>
	<div class="app-board-container tw-flex tw-items-center tw-pt-5">
	
	<div class="tw-flex-1"></div>
	</div>
	
	<!-- 본문 영역 -->
	<div class="app-board-container app-article-container">
	
	<div class="app-article-content app-clearfix">
		<div class="document_138_4 rhymix_content xe_content">
			<span>설문 안내 조사 내용</span>
			<br>
			<span>설문 기간</span>
			<br>
			<span>설문 질문</span>
			<br>
			<span>설문 내용</span>
			<br>
		</div>
		
	
	<!-- 비율용 -->
		<div class="tw-flex tw-pt-8">
			<div class="tw-flex-1">
			
			<!-- 글삭제 -->
			<div class="left">
			<a href="sdelete.so" class="app-button app-button-rounded">
						<span class="text" style="color: #383A3C">설문 삭제</span>
			</a>
			</div>
			</div>
		</div>
	</div>

	</div>
	
	
	<!-- 설문 답변 제출로 넘어가기 -->
	
	<div class="app-article-footer">
	
	<div class="app-article-vote">
		<div class="card-body">
			<a href="ssubmission.so" class="btn btn-primary btn-icon-split">
					<span class="icon text-white-50">
						<i class="fas fa-plus"></i>
					</span>
					<span class="text" style="color: white">&nbsp;설문 제출</span>
			</a>
		</div>
	</div>
	</div>
		

	
	
	
	<!-- 댓글 영역 -->

   
   	
   
	<div class="app-board-comment-target" id="comment"></div>
		<div class="app-comment-header app-board-container tw-flex tw-items-center">
			<div class="tw-font-bold tw-text-base tw-mr-2" >댓글</div>
			    <div class="tw-text-sm">
			      <span class="tw-text-gray-700">총 </span>
			      <span class="tw-text-primary tw-text-gray-700">count</span><span class="tw-text-gray-700">개</span>
			    	
			    </div>
			</div>
	  <br>
		  
	  <!-- 등록되는 댓글 영역 -->
		<ul id="app-board-comment-list" class="app-board-comment-list">
		  <li id="comment_227" class="app-comment-item app-clearfix ">
		    	<div class="tw-flex-1 tw-pl-4">
		       		<div class="tw-flex tw-items-center tw-flex-wrap">
			    		<div class="tw-flex tw-items-center tw-text-sm tw-font-bold ">
			   		 		<span class="tw-flex tw-items-center">오수현</span> 
			 			 </div>
		      
		    		</div>
			            <div class="app-comment-content tw-py-3">
			              	<div class="comment_227_0 rhymix_content xe_content">댓글 테스트입니다.</div>
			         	</div>
				</div>
			</li>
		</ul> 
		<ul id="app-board-comment-list" class="app-board-comment-list">
		  <li id="comment_227" class="app-comment-item app-clearfix ">
		    	<div class="tw-flex-1 tw-pl-4">
		       		<div class="tw-flex tw-items-center tw-flex-wrap">
			    		<div class="tw-flex tw-items-center tw-text-sm tw-font-bold ">
			   		 		<span class="tw-flex tw-items-center">이윤해</span> 
			 			 </div>
		      
		    		</div>
			            <div class="app-comment-content tw-py-3">
			              	<div class="comment_227_0 rhymix_content xe_content">댓글 테스트입니다.</div>
			         	</div>
				</div>
			</li>
		</ul> 
		<ul id="app-board-comment-list" class="app-board-comment-list">
		  <li id="comment_227" class="app-comment-item app-clearfix ">
		    	<div class="tw-flex-1 tw-pl-4">
		       		<div class="tw-flex tw-items-center tw-flex-wrap">
			    		<div class="tw-flex tw-items-center tw-text-sm tw-font-bold ">
			   		 		<span class="tw-flex tw-items-center">노연우</span> 
			 			 </div>
		      
		    		</div>
			            <div class="app-comment-content tw-py-3">
			              	<div class="comment_227_0 rhymix_content xe_content">댓글 테스트입니다.</div>
			         	</div>
				</div>
			</li>
		</ul>
		<ul id="app-board-comment-list" class="app-board-comment-list">
		  <li id="comment_227" class="app-comment-item app-clearfix ">
		    	<div class="tw-flex-1 tw-pl-4">
		       		<div class="tw-flex tw-items-center tw-flex-wrap">
			    		<div class="tw-flex tw-items-center tw-text-sm tw-font-bold ">
			   		 		<span class="tw-flex tw-items-center">김영찬</span> 
			 			 </div>
		      
		    		</div>
			            <div class="app-comment-content tw-py-3">
			              	<div class="comment_227_0 rhymix_content xe_content">댓글 테스트입니다.</div>
			         	</div>
				</div>
			</li>
		</ul>   
      
      
	<!-- 댓글 작성폼 영역 -->
	<div class="app-comment-write">
	<div class="tw-flex">
	<textarea id="comment-textarea" class="app-textarea" style="resize: none"></textarea>
	<textarea id="editor-138" name="content" style="display: none;"></textarea>
	</div>
	<br>
	 		<div>
			 	<div class="right">
			        <a href="rinsert.bo" class="app-button app-button-rounded app-button-xs primary">
						<span class="text" style="color: white">댓글 등록</span>
					</a>
				</div>
				<div class="left">
			        <a href="slist.so" class="app-button app-button-rounded app-button-xs primary">
						<span class="text" style="color: white">목록</span>
					</a>
				</div>
			</div>
	</div>
	
	</div> <!-- 댓글 영역-->

	
	
	</div> <!-- div class="container-fluid" -->
	</div> <!-- div class="wrapper" -->
	</div> <!--지우지 마세요    div class="row"  -->
	</div> <!--지우지 마세요   div class="pcoded-content"  -->
	</div> <!--지우지 마세요    div class="pcoded-main-container"  -->
	
	
	<!-- [ Main Content ] 메인화면 끝 -->

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	

	
	</body>
	</html>
