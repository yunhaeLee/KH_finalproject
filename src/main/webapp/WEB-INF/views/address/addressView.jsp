<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

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
                            <li class="breadcrumb-item"><a href="#!">My Portal</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  
  
<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->
<div class="row">
 
 
 
 
 <!-- [ stiped-table ] start -->
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>주소록</h5>
                        <span class="d-block m-t-5">
                        <div class="card-body">
                        <input type="email" class="form-control" id="Email" aria-describedby="emailHelp" value="123">
                        	<br>
                        	<button type="button" class="btn  btn-secondary">검색하기</button>
                        	<a href ="insert.add"><button type="button" class="btn  btn-primary">추가하기</button></a>
                        	<a href="detail.add"><<button type="button" class="btn  btn-primary">임시상세</button></a>
                        	
                        </div>
                        </span>
                        
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>휴대폰번호</th>
                                        <th>이메일</th>
                                        <th>회사이름</th>
                                        <th>직급</th>
                                        <th>내선전화</th>
                                        <th>부서</th>
                                        <th>회사주소</th>
                                        <th>메모</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>010-1111-2222</td>
                                        <td>qwerty@naver.com</td>
                                        <td>주 참맛</td>
                                        <td>대리</td>
                                        <td>070-123-5444</td>
                                        <td>홍보부</td>
                                        <td>경기도 성남시 이매동 효성아파트1406-504</td>
                                        <td>대머리이고 나이많아 보이고 커피를 좋아한다.</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>010-1111-2222</td>
                                        <td>qwerty@naver.com</td>
                                        <td>주 참맛</td>
                                        <td>대리</td>
                                        <td>070-123-5444</td>
                                        <td>홍보부</td>
                                        <td>경기도 성남시 이매동 효성아파트1406-504</td>
                                        <td>대머리이고 나이많아 보이고 커피를 좋아한다.</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>010-1111-2222</td>
                                        <td>qwerty@naver.com</td>
                                        <td>주 참맛</td>
                                        <td>대리</td>
                                        <td>070-123-5444</td>
                                        <td>홍보부</td>
                                        <td>경기도 성남시 이매동 효성아파트1406-504</td>
                                        <td>대머리이고 나이많아 보이고 커피를 좋아한다.</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>010-1111-2222</td>
                                        <td>qwerty@naver.com</td>
                                        <td>주 참맛</td>
                                        <td>대리</td>
                                        <td>070-123-5444</td>
                                        <td>홍보부</td>
                                        <td>경기도 성남시 이매동 효성아파트1406-504</td>
                                        <td>대머리이고 나이많아 보이고 커피를 좋아한다.</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>010-1111-2222</td>
                                        <td>qwerty@naver.com</td>
                                        <td>주 참맛</td>
                                        <td>대리</td>
                                        <td>070-123-5444</td>
                                        <td>홍보부</td>
                                        <td>경기도 성남시 이매동 효성아파트1406-504</td>
                                        <td>대머리이고 나이많아 보이고 커피를 좋아한다.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ stiped-table ] end -->





 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->


    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>