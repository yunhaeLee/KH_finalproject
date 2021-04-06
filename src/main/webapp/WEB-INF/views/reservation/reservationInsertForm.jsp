<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link
	href='${pageContext.request.contextPath}/resources/fullcalendar/assets/css/fullcalendar.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/resources/fullcalendar/assets/css/fullcalendar.print.css'
	rel='stylesheet' media='print' />
 <style>
.roomSelect{
	padding: 3rem 7rem 3rem 7rem;
}
#calendar {
  padding: 5rem 12rem 5rem 12rem;
}
.fc .fc-ltr{
	height:600px;
}
#rComment{
	border: 1px solid #ced4da;
}
select {
  width: 200px;
  padding: .6em .5em;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #999;
  border-radius: 0px;
}
select::-ms-expand {
  /* for IE 11 */
  display: none;
}
.cards{
	background-color: #B8ACD0 !important;
	border-color: #B8ACD0 !important;
	color: #fff !important;
}
.rcards{
background-color:rgba(184, 172, 208, 0.5)!important;
cursor:default !important;
}
.selectCards{
background-color: #B87AD0 !important;
border-color: #B87AD0 !important;

}
#myRlist{
	cursor:pointer !important;
}
.hide{
	display:none;
}
 </style>
</head>

<body class="">
   <jsp:include page="../common/sidebar.jsp"/>
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
                            <li class="breadcrumb-item"><a href="index.jsp"><i class="feather icon-home"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <!-- [ breadcrumb ] end -->
  	<script>
		var rNo="";
		var selectDate = "";
		var selectTime = [];
		var empNo ='${loginUser.empNo }';
	</script>
  
<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->
<div class="row">
	<div class="col-sm-10 mx-auto">
		<div class="card" style="min-height: 100vh;" >
			<div class="card-header">
				<h3>회의실예약</h3>
			</div>
            <div class="card-body" >
            	<div class="roomSelect">
                	<select id="meetingroom" class="form-select form-select-lg" aria-label=".form-select-lg example">
                    	<option value="">--회의실선택--</option>
                    	<c:forEach items="${ rList }" var="r">	
                           	<option value="${ r.roomNo }">${ r.roomName }</option>
					    </c:forEach>
                    </select>
                   
                   	<button type="button" data-toggle="modal" data-target="#myReservation" class="btn btn-primary" style="float:right">내 예약보기</button>
                </div> 
                <hr style="border: 3px #B8ACD0 solid; width:88%; border-radius: 2em;">
                <div id="calendarWrapper">
			    	<div id="calendar">
			        </div>
                </div>
			</div>
		</div>
	</div>
</div> <!--지우지 마세요    div class="row"  -->
</div> <!--지우지 마세요   div class="pcoded-content"  -->
</div> <!--지우지 마세요    div class="pcoded-main-container"  -->
<!-- [ Main Content ] 메인화면 끝 -->


	<script>
	$(document).ready(function(){
		$("#meetingroom").val("");
		
	});
	
	$("#meetingroom").change(function() {
		$("#calendar").children().remove();
		$("#rInfo").remove();
		if($("#meetingroom option:selected").val()!=""){
			rNo = $("#meetingroom option:selected").val();
			<c:forEach items="${ rList }" var="r">
			if(${r.roomNo}==rNo){
				$("#meetingroom").after(' <span id="rInfo">최대인원 : ${r.limitCount}명 &nbsp;&nbsp;&nbsp;위치 : ${r.location}</span>')
			}
		</c:forEach>
			
			calrendarView();
			$("#calendar").hide();
			$("#calendar").fadeIn(1000);
		}
			//if(date!=""){
			//rSelectDateFun(date);
			//}
	});
	
	function calrendarView(){
		var today = new Date();
		var yesterDate = new Date();
		yesterDate.setDate(yesterDate.getDate()-1);
		
		var calendar = $('#calendar').fullCalendar( {
			editable : false,
			firstDay : 0, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable : true,
			defaultView : 'month',
			dayClick: function(date, allDay, jsEvent, view) {
	            //날짜 받아옴!
				if(yesterDate > date){
					alert("이미 지난 날짜는 선택할 수 없습니다.");
				}else if(get_date_str(today) == get_date_str(date)){
					alert("당일예약은 회사에 문의해주세요.");
				}else{
		            selectDate=get_date_str(date);
		            console.log(selectDate);
		            selectDateRes();
		           $("#addReservation").modal("show");  
				}
	          }
		
	      });	
	}
	function get_date_str(date)
	{
	    var sYear = date.getFullYear();
	    var sMonth = date.getMonth() + 1;
	    var sDate = date.getDate();
	    sMonth = sMonth > 9 ? sMonth : "0" + sMonth;
	    sDate  = sDate > 9 ? sDate : "0" + sDate;
	    return sYear +"-"+ sMonth +"-"+ sDate;
	}
	</script>
	
	
<div class="modal fade" id="addReservation">  
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
		<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">예약 시간</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
            <div class="modal-body">
				<form name="resInsert" action="insertRes.re" method="post" autocomplete="off" onsubmit="return check();">
					<div class=" mb-4">
					 	<input type="hidden" name ="empNo" id="empNo" value="">
					 	<input type="hidden" name ="roomNo" id="roomNo" value="">
					 	<input type="hidden" name ="resDateS" id="resDateS" value="">
					 	<input type="hidden" name ="staTime" id="staTime" value="">
					 	<input type="hidden" name ="endTime" id="endTime" value="">
					 	<label class=" mr-sm-2">시간선택 :</label>
	                    <div class="btn-group mb-1" style="margin-left:2rem;">
	    				</div>
	    			</div>
					<label for="resTitle" class="mr-sm-2">회의명 :</label> <!-- 오른쪽 마진 .5rem 크기만큼 -->
	                <input type="text" class="form-control mr-sm-2" id="resTitle" name="resTitle"> <br> <!--  form-control 아래쪽 마진 -->
	                <label for="resContent" class="mr-sm-2">설명 : </label>
	                <textarea  rows="5" class="form-control mb-2 mr-sm-2" id="resContent" name="resContent" ></textarea>
					<div class="modal-footer">
	                    <button type="submit" class="btn btn-primary">예약하기</button>
	                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
	                </div>
				</form>	
			</div>
        </div>
    </div>
</div>
    
    
    <script>
    function selectDateRes(date){
		$(".btn-group").children().remove();
		for(var i =9; i<=18; i++){
			 $(".btn-group").append('<div class="cards btn" id="card'+i+'"><span>'+i+'</span>시</div>');
		}

		$.ajax({
			type:"POST",
			url: "selectDateRes.re",
			data:{selectDate:selectDate,
				  rNo:rNo},
			success:function(resList){
				for(var i = 0; i<resList.length;i++){
					for(var j = resList[i].staTime; j <= resList[i].endTime;j++){
						
						$("#card"+j).removeClass("cards").addClass("rcards");
					}
				}
			},
			error:function(e){  
	            console.log(e.responseText);  
	        }
		});
	}
	
	$(document).on('click',".cards",function(){
		var st=$(this).children('span').text();
		if($(".btn").is(".selectCards")){
			if($("#card"+(st-1)).is(".selectCards")||$("#card"+(Number(st)+1)).is(".selectCards")){
				$(this).addClass("selectCards").removeClass("cards");
			}else{
				alert("시간 선택은 연속적으로만 가능합니다.");
			}
		}else{
			$(this).addClass("selectCards").removeClass("cards");
		}
			//console.log($(this).is(".selectCards"));
	});
	$(document).on('click',".selectCards",function(){
		var st=$(this).children('span').text();
		if($("#card"+(st-1)).is(".selectCards")&&$("#card"+(Number(st)+1)).is(".selectCards")){
			alert("중간시간은 취소 할 수 없습니다.");
		}else{
			$(this).removeClass("selectCards").addClass("cards");
		}
		
	});
	$(document).on('click',".rcards",function(){
	  	alert("이미 예약된 시간입니다.");
	});
	
	function check(){
		var count=0;
		selectTime=[];
		if($(".btn").is(".selectCards")===false){
			alert("시간을 선택해주세요.");
			return false;
		}if($("#resTitle").val()==""){
			$("#resTitle").attr("placeholder","제목을 입력해주세요.");
			$("#resTitle").focus();
			return false;
		}if($("#resContent").val()==""){
			$("#resContent").attr("placeholder","내용을 입력해주세요.");
			$("#resContent").focus();
			return false;
		}
		$("#empNo").val(empNo);
		$("#roomNo").val(rNo);
		$("#resDateS").val(selectDate);
		for(var i = 9; i<=18; i++ ){
			if($("#card"+i).is(".selectCards")){
				selectTime[count]= i;
				count++;
			}
		}
		$("#staTime").val(Math.min.apply(null,selectTime));
		$("#endTime").val(Math.max.apply(null,selectTime));
		return true;
	}
    </script>
    
    
<div class="modal fade" id="myReservation">  
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
		<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">예약 시간</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>  <!-- 다이얼로그 닫기 -->
            </div>
            <div class="modal-body">
				<table id="rList" class="table table-hover row-border  nowrap">
	                <thead>
	                    <tr>
	                        <th style="width: 25%;">날짜</th>
	                        <th style="width: 35%;">회의명</th>
	                        <th style="width: 20%;">회의실</th>
	                        <th style="width: 20%;">시간</th> 
	                    </tr>
	                </thead>
	          	    <tbody>
	                    
	                 
	                </tbody>
                </table>
			</div>
		</div>
	</div>
</div>
	<script>
	function myReservation(){
		$("#rList tbody").children().remove();
		$.ajax({
			type:"POST",
			url: "selectMyRes.re",
			data:{empNo:empNo},
			dataType: "JSON",
			success:function(resList){
				for(var i = 0; i<resList.length;i++){
					$("#rList tbody").append(
							'<tr id="myRlist"><td>'+resList[i].resDateS+'</td><td>'+resList[i].resTitle+'</td><td>'
							+resList[i].roomName+'</td><td>'+resList[i].staTime+':00 ~'+(Number(resList[i].endTime)+1)+':00</td></tr>');
					$("#rList tbody").append('<tr class="hide"><td colspan="5">'+
                	'<span>회의실 장소 : </span><span>'+resList[i].location+'</span>'+
                	'<p><button type="button" class="btn btn-sm btn-danger" onclick="deleteRes('+resList[i].resNo+')" style="float:right">예약취소</button></p>'+
                	'<span>회의 내용 : </span><span style="padding-top:1rem; white-space:pre;">'+resList[i].resContent+'</span></td></tr>');
				}
			},
			error:function(e){  
	            console.log(e.responseText);  
	        }
		});
	}
	$("#myReservation").on('show.bs.modal',function(e){
		myReservation();
	}); 
	$(document).on("click","#rList #myRlist",function(event){
		console.log($(this).closest('tr').next('tr'));
		$(this).closest('tr').next('tr').toggleClass("hide");

	});
	function deleteRes(resNo){
		console.log(resNo);
		$.ajax({
			type:"POST",
			url:"deleteReservation.re",
			data:{resNo:resNo},
			success:function(result){
				if(result>0){
					alert("예약이 취소되었습니다.");
					myReservation();
				}else{
					alert("예약취소가 실패하였습니다.")
				}
			},
			error:function(e){  
	            console.log(e.responseText);  
	        }
		});
	}
	$('.modal').on('hidden.bs.modal', function (e) {
		$(this).find('form')[0].reset()
	});
	</script>
   
    
    <jsp:include page="../common/footer.jsp"/>
    
    <!-- <script
	src='${pageContext.request.contextPath}/resources/fullcalendar/assets/js/jquery-1.10.2.js'
	type="text/javascript"></script> -->
	<script
	src='${pageContext.request.contextPath}/resources/fullcalendar/assets/js/jquery-ui.custom.min.js'
	type="text/javascript"></script>
	<script
	src='${pageContext.request.contextPath}/resources/fullcalendar/assets/js/fullcalendar.js'
	type="text/javascript"></script>
</body>
</html>
	                                    