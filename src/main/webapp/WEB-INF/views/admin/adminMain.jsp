<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	ul.name_tag li {
	display: inline-block;
    float: left;
    margin: 0 4px 4px 0;
    height: 30px!important;
    background: #fff!important;
    border-radius: 30px!important;
    border: 1px solid #d5d5d5!important;
    line-height: 27px!important;
    padding: 0px 8px;
    color: #777;
	}
	ul.name_tag li.creat {
    border: 0!important;
    background: transparent!important;
    padding: 0!important;
   }
   .table td{
   line-height: 35px!important;
   }
   ul.name_tag{
   padding-inline-start:0px;
   margin-top:3px;
   }
   .table a{
   color:#000;
   }
   .table a:hover{
		cursor:pointer
}
   .a_tag{
   color: #777 !important;
   }
   ul.ztree {margin: 1rem 0.2rem;
   			 padding : 2rem 1rem; 
   			 border: 1px solid #617775;
   			 width:250px;height:360px;
   			 overflow-x:auto;}
   .ztree li a.curSelectedNode{
   background-color:#fff !important;
   border:1px #fff solid !important;
   font-family:bold !important;
   }
</style>
</head>

<body class="">
 
   <jsp:include page="../common/adminSidebar.jsp"/>
   <jsp:include page="../common/topbar.jsp"/>
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
                            <li class="breadcrumb-item"><a href="adminMain.ad"><i class="feather icon-home"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  
  
<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->


 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->

    <jsp:include page="../common/footer.jsp"/>
</body>

</html>