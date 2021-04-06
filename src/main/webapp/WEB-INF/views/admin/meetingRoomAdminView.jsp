<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <style>
.btn{
	padding:0.4rem 1rem !important;
}
.table-hover>tbody>tr:hover{
		cursor:pointer
}

#roomList  td, th {
	padding: 0.75rem !important;
   }
.form-control[readonly]{
	background-color: #fff !important;
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
                            <li class="breadcrumb-item"><a href="adminMain.jsp"><i class="feather icon-home"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  
  
<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->
<div class="row">
<div class="col-lg-10 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h3>회의실현황</h3>
                    </div>
                    <div class="card-body table-border-style">
                    <div class="dt-buttons btn-group flex-wrap">
                    	<button class="btn btn-primary" data-toggle="modal" data-target="#roomAdd" type="button">추가</button> </div>
                        <div class="table-responsive">
                            <table id="roomList" class="table table-hover">
                                <thead>
                                    <tr>
                                  		<th style="width: 7%;">NO</th>
                                        <th style="width: 28%;">회의실명</th>
                                        <th style="width: 35%;">위치</th>
                                        <th style="width: 10%;">최대인원수</th>
                                        <th style="width: 20%;">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ rList }" var="r" varStatus="status">
                                	<tr>
                                		<input type="hidden" id="roomNo" value="${r.roomNo }">
                                        <td>${ status.count }</td>
                                        <td>${ r.roomName }</td>
                                        <td>${ r.location }</td>
                                        <td>${ r.limitCount }명</td>
                                        <c:choose>
                                        	<c:when test="${r.status eq 'Y'}">
                                        		<td>사용중</td>
                                        	</c:when>
                                        	<c:when test="${r.status eq 'S'}">
                                        		<td>사용중지</td>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<td>폐쇄</td>
                                        		<input type="hidden" id="deleteDate" value="${r.closureDate }">
                                        	</c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
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
	<div class="modal fade" id="roomAdd">  
        <div class="modal-dialog modal-md modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">회의실 추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
				<form name="newRoom" action="insertRoom.r" method="post" autocomplete="off">
					<table class="table table-bordered  "  align="center">
                    	<tr>
                        	<td style="width:20%">회의실</td>
                            <td><input name="roomName" id="roomName" type="text" class="form-control form-control-sm" style="width:80%"></td>
                        </tr><tr>
                            <td style="width:20%">위치</td>
                            <td><input name="location" id="location" type="text" class="form-control form-control-sm" style="width:80%"></td>
                        </tr><tr>
                             <td style="width:20%">최대인원수</td>
                             <td><input name="limitCount" id="limitCount" type="text" class="form-control form-control-sm"style="width:25%;float:left"><span>명</span></td>
                        </tr>
					</table>
					<div class="modal-footer">
                    	<button type="submit" class="btn btn-primary">추가하기</button>
                    	<button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
                	</div>
				</form>	
			</div>
            </div>
        </div>
    </div>

<div class="modal fade" id="roomDetail">  
        <div class="modal-dialog modal-md modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">회의실 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
             <div class="modal-body">
				<form name="detailRoom" action="updateRoom.r" method="post" autocomplete="off" onsubmit="return check();">
					<input type="hidden" name = "roomNo" id="roomNo" value="">
					<table class="table table-bordered  table-detail"  align="center">
                    	<tr>
                        	<td style="width:20%">회의실</td>
                            <td><input name="roomName" id="roomName" type="text" class="form-control form-control-sm" style="width:80%"></td>
                        </tr><tr>
                            <td style="width:20%">위치</td>
                            <td><input name="location" id="location" type="text" class="form-control form-control-sm" style="width:80%"></td>
                        </tr><tr>
                             <td style="width:20%">최대인원수</td>
                             <td><input name="limitCount" id="limitCount" type="text" class="form-control form-control-sm"style="width:25%;float:left"><span>명</span></td>
                        </tr><tr>
                             <td style="width:20%">상태</td>
                             <td id="dStatus"></td>
                             <input type="hidden" name="status" id="status" value="">
                        </tr>
                        
					</table>
					<div class="modal-footer">
                    	<button type="submit" class="btn btn-primary">수정하기</button>
                    	<button type="button" onclick="$('#deleteForm').submit();" class="btn btn-danger" data-dismiss="modal">삭제하기</button>
                	</div>
				</form>	
			</div>
            </div>
        </div>
    </div>
    <form action="deleteRoom.r" method="post" id="deleteForm" onsubmit="return deletecheck();">
   		<input type="hidden" name = "roomNo" id="roomNo" value="">
    </form>
    <script>

    $("#roomList tr").click(function(){
    	//$("#productList td:nth-child(2)").text("");
    	var td = $(this).children();
    	$("#roomDetail #roomNo").val(td.eq(0).val());
    	$("#deleteForm #roomNo").val(td.eq(0).val());
        $("#roomDetail #roomName").val(td.eq(2).text());
        $("#roomDetail #location").val(td.eq(3).text());
        $("#roomDetail #limitCount").val(td.eq(4).text().slice(0,-1));
        $('#dStatus').children().remove();
        $('#dStatus').text("");
        if(td.eq(5).text()=="폐쇄"){
        	$("#roomDetail input").prop('readonly', true);
			$("#roomDetail .modal-footer button").attr('disabled',true).hide();
			$('#dStatus').append('폐쇄됨    (폐쇄날짜 : '+td.eq(6).val()+')');
        }else{
        	$("#roomDetail input").prop('readonly', false);
        	$("#roomDetail .modal-footer button").attr('disabled',false).show();
        	 if(td.eq(5).text()=="사용중"){
             	$('#dStatus').append(
             		'<input name="using" id="using" type="checkbox" value="" checked class="mr-2"/>사용중');
     		}else{
     			$('#dStatus').append(
     				'<input name="using" id="using" type="checkbox" value="" class="mr-2"/>사용중');
     		}
        }	
        $("#roomDetail").modal("show");
    });
    function check(){
    	if($("#roomDetail #using").is(':checked')){
        	$("#roomDetail #status").val('Y');
        }else{
        	$("#roomDetail #status").val('S');
        }
    	return true;
    	
    }
    function deletecheck(){
    	if(confirm("폐쇄 후 복구가 불가능 합니다. 그래도 삭제하시겠습니까?")) {
    		return true;
    	}
    	return false;
    }
    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
	                                    