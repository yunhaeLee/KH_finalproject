<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


 <!-- Favicon icon -->
 <link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
   
<link href='${pageContext.request.contextPath}/resources/fullcalendar/assets/css/fullcalendar.css' rel='stylesheet' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/board/assets/css/style.css" />

<style>
	.btn-primary {
	    color: #fff;
	    background-color: #B8ACD0;
	    border-color: #B8ACD0;
	}
	
	.btn-primary:hover {
	    color: #fff;
	    background-color: #8069AE;
	    border-color: #8069AE;
	}
	
	.btn-primary:focus, .btn-primary.focus {
	    color: #fff;
	    background-color: #8069AE;
	    border-color: #8069AE;
	    box-shadow: 0 0 0 0rem rgba(98, 147, 255, 0.5);
	}
	
	.btn-primary.disabled, .btn-primary:disabled {
	    color: #fff;
	    background-color: #B8ACD0;
	    border-color: #B8ACD0;
	}
	
	.btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active,
	  .show > .btn-primary.dropdown-toggle {
	    color: #fff;
	    background-color: #8069AE;
	    border-color: #8069AE;
	}
	
		
		

	:root {
		--aside-width: 17.625rem;
		}
		
	.cate{
	 	background-color: #B8ACD0;
	
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
   		
	
	span.mycal {
	width: 100%;
	height: 100%;
	overflow: hidden;
	padding: 5px 10px 5px 10px;
    margin-left: -1px;
    height: 100%;
    background-color: #A0CEDE;
    color: #fff;
	}
	
	span.deptcal {
	width: 100%;
	height: 100%;
	overflow: hidden;
	padding: 5px 10px 5px 10px;
    margin-left: -1px;
    height: 100%;
    background-color: #88C2B6;
    color: #fff;
	}
	
	
	span.allcal {
	width: 100%;
	height: 100%;
	overflow: hidden;
	padding: 5px 10px 5px 10px;
    margin-left: -1px;
    height: 100%;
    background-color: #FAD451;
    color: #fff;
	}
	
	span.holical {
	width: 100%;
	height: 100%;
	overflow: hidden;
	padding: 5px 10px 5px 10px;
    margin-left: -1px;
    height: 100%;
    background-color: #F8B2A7;
    color: #fff;
	}

	
	
</style>
</head>
 
<body class="">
 
   <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
   <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
   
   
<!--?????? ?????? ???????????? -->
   <div class="pcoded-main-container">
     <div class="pcoded-content">
     
        
   <!-- [ breadcrumb start ????????????????????? ????????? ?????????????????? -->
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
  
  
	<!-- [ Main Content ] ?????????????????? ?????? ?????? ???????????? -->
	<!-- ???????????? -->
	<div id="wrapper">

		<!-- ????????? ?????? -->
		<div class="container-fluid">
		
		<!-- ????????? ?????? -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h5>?????????</h5>
            </div>
            
                   
                    	<div>
                    	
                   <!-- ?????? ?????? div -->
                    	
                   <div class="left">
                   <div class="card-body" align="center">
						
						 <!-- ?????? ?????? -->
						 
						<a href="" class="btn  btn-primary btn-lg"  data-toggle="modal" data-target="#addCalendar">
						<span class="icon text-white-50">
						<i class="fas fa-plus"></i>
						</span>
						<span class="text" style="color: white">&nbsp;????????????</span>
						</a>
						<br><br>
						
						<ul class="pcoded-submenu">
						<li>
							<p class="title">
								<span class="mycal">?????? ??????</span>
							</p>
						</li>
						<li>
							<p class="title">
								<span class="deptcal">?????? ??????</span>
							</p>
						</li>
						<li>
							<p class="title">
								<span class="allcal">?????? ??????</span>
							</p>
						</li>
						<li>
							<p class="title">
								<span class="holical">?????? ??????</span>
							</p>
						</li>
					</ul>
					
						
					</div>
					</div>  <!-- left div ??? -->
						
						
						
						<!-- ????????? -->
						<div class="right" align="left">
						
		                <div class="pd-20 card-box mb-30" align="center">
		               	<div id="calendarWrapper">
			           		<div id="calendar">
			           		</div>
               			<br>
        				</div>
						</div>
						</div>
						
	<!-- ?????? ?????? ?????? -->
	<div class="modal fade" id="addCalendar">  
	        <div class="modal-dialog modal-lg modal-dialog-centered">
	            <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">?????? ??????</h5>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>
	           
	             <div class="modal-body">
					<form name="insertCalendar" action="cinsert.ca" method="post">
					<h6>?????? ???????????? ??????</h6>
					<div><select name="calCate" id="calCate" class="form-control form-control-sm" style="width:20%;"  >
							<option value="">??????</option>
		                     <option value="10" style="color : black;">?????? ??????</option>
		                     <option value="20" style="color : black;">?????? ??????</option>
                  	</select></div>
                  	<br>
					<h6>?????? ?????? ??????</h6>
					<div>
						<input type="datetime-local" id="calSDates" name="calSDates" class="form-control form-control-user" style="width:100%;" >
					</div>
						<br>
					<h6>?????? ?????? ??????</h6>
					<div>
						<input type="datetime-local" id="calEdates" name="calEDates" class="form-control form-control-user" style="width:100%;" >
					</div>
					<br>
						<h6>??????</h6>
	                    <input type="text" class="form-control mr-sm-2" id="calTitle" name="calTitle" placeholder="???????????? ??????????????????."> <br>
	                    <h6>?????? ?????????</h6>
	                    <input type="text" class="form-control mr-sm-2" id="calContent" name="calContent" placeholder="?????? ???????????? ??????????????????.">
	                    
	                     <input type="hidden" id="empNo" name="empNo" value="${loginUser.empNo}" class="form-control form-control-user">
						<div class="modal-footer">
						<br><br><br>
							<button type="submit" class="btn btn-primary">??????</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
	                	</div>
					</form>	
					
				</div>
	            </div>
	        </div>
	    </div> <!-- ?????? ??? -->
	    
	<!-- ?????? ???????????? ?????? ?????? -->
	
	<div class="modal fade" id="viewCalendar">  
	        <div class="modal-dialog modal-lg modal-dialog-centered">
	            <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">?????? ??????</h5>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>
	           
	             <div class="modal-body">
					<form name="updateCalendar" action="cupdate.ca" method="post">
					<input type="hidden" id="calNo" name="calNo">
					<input type="hidden" id="empNo" name="empNo">
					<input type="hidden" id="calCate" name="calCate">
					<input type="hidden" id="calType" name="calType">
					<input type="hidden" id="calColor" name="calColor">
					<input type="hidden" id="status" name="status">
					
					<h6>?????? ?????? ??????</h6>
					<div>
						<input type="datetime-local" id="calSDates" name="calSDates" class="form-control form-control-user" style="width:100%;">
					</div>
						<br>
					<h6>?????? ?????? ??????</h6>
					<div>
						<input type="datetime-local" id="calEDates" name="calEDates" class="form-control form-control-user" style="width:100%;">
					</div>
					<br>
						<h6>??????</h6>
	                    <input type="text" class="form-control mr-sm-2" id="calTitle" name="calTitle"> <br>
	                    <h6>?????? ?????????</h6>
	                    <input type="text" class="form-control mr-sm-2" id="calContent" name="calContent">
	                    
						<div class="modal-footer">
						<br><br><br>
							<button type="submit" class="btn btn-primary">??????</button>
							</form>	
							 <!-- ????????? ??? -->
							 <form name="deleteCalendar" action="cdelete.ca" method="post">
							<input type="hidden" name="calNo" id="calNo">
							<button type="submit" class="btn btn-danger">??????</button>
	    					</form>
							
	                	</div>
					
					
				</div>
	            </div>
	        </div>
	       
		   
	   			
					
	    </div> <!-- ?????? ???????????? ?????? ?????? ??? -->

						
                      </div>
                  </div>
			</div>
			
				
		  
        </div>
		
	</div> <!--????????? ?????????    div class="row"  -->
	</div> <!--????????? ?????????   div class="pcoded-content"  -->
	</div> <!--????????? ?????????    div class="pcoded-main-container"  -->
	
	
	<!-- [ Main Content ] ???????????? ??? -->
	
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
    $(document).ready(function(){
    	

	var calendar = $('#calendar').fullCalendar( {
		plugins: ['interaction'],
		header : {
			left : 'month'
		},
		editable : false,
		firstDay : 0, //  1(Monday) this can be changed to 0(Sunday) for the USA system
		selectable : true,
		defaultView : 'month',
		allDaySlot : false,
		selectHelper : true,
		timeFormat                : 'HH:mm',
		editable                  : true,
		
		/* ?????? ????????? */
		events : [ 
			<c:forEach items="${list}" var="ca">
			<c:if test="${ca.empNo eq loginUser.empNo or ca.calCate eq 30 or ca.calCate eq 40}">
			{
			id : '${ca.calNo}',
			title : '${ca.calTitle }',
			description : '${ca.calContent}',
			start : '${ca.calSDates}',
			end : '${ca.calEDates}',
			type : '${ca.calCateName}',
			backgroundColor: '${ca.calColor}',
			textColor: '#ffffff'
			}, 
			</c:if>
			</c:forEach>
		 ], 
		 
		select: function (startDate, endDate, jsEvent, view) {

		    $(".fc-body").unbind('click');
		    $(".fc-body").on('click', 'td', function (e) {

		      $("#contextMenu")
		        .addClass("contextOpened")
		        .css({
		          display: "block",
		          left: e.pageX,
		          top: e.pageY
		        });
		      return false;
		    });

		    var today = moment();

		  },

		 /* ?????? ????????? ?????? ??? ??????????????? */
		  eventClick: function (event, jsEvent, view) {
			  
			  var cano = event.id;
			  console.log(cano);

		            $.ajax({
		               type:"POST",  
		               url:"selectCalendar", 
		               async:false,
		               data:{calNo:cano},
		               success:function(ca){
		            	   console.log(cano);
		            	  
		                   $("#viewCalendar #calNo").val(ca.calNo);
		                   $("#viewCalendar #empNo").val(ca.empNo);
		                   $("#viewCalendar #cateName").val(ca.cateName);
		                   $("#viewCalendar #calTitle").val(ca.calTitle);
		                   $("#viewCalendar #calContent").val(ca.calContent);
		                   $("#viewCalendar #calSDates").val(ca.calSDates);
		                   $("#viewCalendar #calEDates").val(ca.calEDates);
		                   
		                   $("#viewCalendar #empNo").val(ca.empNo);
		                   $("#viewCalendar #calCate").val(ca.calCate);
		                   $("#viewCalendar #calType").val(ca.calType);
		                   $("#viewCalendar #calColor").val(ca.calColor);
		                   $("#viewCalendar #status").val(ca.status);
		                   
		               },
		               
		               error:function(e){  
		                   console.log(e.responseText); 

		               }
		        		});   
		            
		            $("#viewCalendar").modal("show");

		  },
		  
		 
		 
		dayClick: function(date, allDay, jsEvent, view) {        
	           $("#addCalendar").modal("show");
          }

      });
	
		calendar.render();
	
    });
    
   
    </script>
    <script
	src='${pageContext.request.contextPath}/resources/fullcalendar/assets/js/jquery-ui.custom.min.js'
	type="text/javascript"></script>
	<script
	src='${pageContext.request.contextPath}/resources/fullcalendar/assets/js/fullcalendar.js'
	type="text/javascript"></script>
	
</body>
</html>