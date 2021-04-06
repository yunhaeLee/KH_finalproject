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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/tree/zTreeStyle.css">
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
                            <li class="breadcrumb-item"><a href="adminMain.jsp"><i class="feather icon-home"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  
  
<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->
<div class="row">
<div class="col-md-10 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h3>권한관리</h3>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width:15%">메뉴명</th>
                                        <th style="width:20%">상세</th>
                                        <th style="width:65%">운영자/관리자/마스터</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

 </div> <!--지우지 마세요    div class="row"  -->
            </div> <!--지우지 마세요   div class="pcoded-content"  -->
            </div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->

<!-- 사원선택 모달 -->
<div class="modal fade" id="oganization">  
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">사원선택</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
              <input type="hidden" id="adminNo" name="adminNo" value=""/>
				<ul id="treeDemo" class="ztree"></ul>
			</div>
			<div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
            </div>
            </div>
        </div>
    </div>
    
    
    <script>
    var treeData;
    
	$(document).ready(function(){
		<c:forEach items="${ adminList }" var="ad">
    	$('tbody').append('<tr><td>${ad.adminName}</td>'
    			+'<td>${ad.adminInfo}</td>'
    			+'<td> <ul class="name_tag" id="${ad.adminNo}"></ul></td></tr>');
		</c:forEach>
		selectAuth();
		$('#oganization').on('show.bs.modal', function (event) {
			var code = $(event.relatedTarget).data('id');
			$(".modal-body #adminNo").val(code);
			selectTree();
		});
		selectTree();
		
	});
    
    
    function deleteAuth(authNo){
    	var authNo = authNo;
    	$.ajax({
	        type:"POST",  
	        url:"deleteAuthority",  
	        async:false,
	        data:{authNo:authNo},
	        success:function(result){
	            if(result > 0){
	            	selectAuth();
	            }else{
            		alert("권한 삭제에 실패하셨습니다.");	
            		}
	        },   
	        error:function(e){  
	            console.log(e.responseText);  
	        }
		});
    }
    //권한 사원 추가하는 foreach
    	function selectAuth(){
    		$("ul.name_tag").children().remove();
	    	$.ajax({
	    		type:"POST",  
				url:"selectAuthList",
				async:false,
				success:function(authList){
					 $.each(authList, function(i, au){
						$('#'+au.adminNo).append(
					    	'<li class="'+ au.authNo +'"> <span class="name" value="'+au.empNo+'">'+au.empName+'</span>'
					        +'<a href="#" onclick="deleteAuth(\''+au.authNo+'\');"  class="a_tag">'
					    	+'<span class="pcoded-micon"><i class="feather icon-x "></i></span>'
					    	+'</a></li>');
					});
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
	    	<c:forEach items="${ adminList }" var="ad">
	    	$('#${ad.adminNo}').append('<li class="creat add_admin">'
	    	+'<a data-toggle="modal" data-target="#oganization" class="a_tag" data-id="${ad.adminNo}">'
	    	+'<span class="pcoded-micon"><i class="feather icon-plus m-l-5"></i></span>'
	    	+'<span class="txt">운영자 추가</span> '
	    	+'</a> </li>');
	    	</c:forEach>		 
    	}
  	 	
    var setting = {
			view: {
				showLine: false,
				showIcon: showIconForTree
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick
			}
		};


		function showIconForTree(treeId, treeNode) {
			return !treeNode;
		};
		
		function onClick(event, treeId, treeNode, clickFlag) {
			if(treeNode.id.indexOf("D")==-1){
				$.ajax({
			        type:"POST",  
			        url:"insertAuthority",  
			        async:false,
			        data:{adminNo:$(".modal-body #adminNo").val(),
						empNo:treeNode.id},
			        success:function(result){
			            if(result > 0){
			            	if(result==1){
			            		$("#oganization").modal("hide");
			            		selectAuth();
			            	}else{
			            		alert("이미 권한이 있는 사원입니다.");
			            	}	
			            }else{
		            		alert("권한 추가에 실패하셨습니다.");		            	}
			        },   
			        error:function(e){  
			            console.log(e.responseText);  
			        }
			 });
			}
			
			
		}
		
		function selectTree(){
			 $.ajax({
			        type:"POST",  
			        url:"treeList",  
			        async:false,
			        success:function(data){
			            treeData = data;
			        },   
			        error:function(e){  
			            console.log(e.responseText);  
			        }
			 });
			$.fn.zTree.init($("#treeDemo"), setting, treeData);
		}
		
		

    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/tree/jquery.ztree.core-3.5.js"></script>
</html>