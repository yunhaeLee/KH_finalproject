  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <!-- Favicon icon -->
 <link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
 
    
</head>

<body class="       ">
      
   <!-- [ Pre-loader ] start 로딩기능 
   <div class="loader-bg">
      <div class="loader-track">
         <div class="loader-fill">dfdfdf</div>
      </div>
   </div> -->
   
   
   <!-- [ Pre-loader ] End -->
   <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
   <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
   
   <div class="pcoded-main-container">
      <!--메인 화면 전체시작 -->
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
         <div class="row">
         <!-- 근태관리 화면시작 -->
            <div class="col-xl-6 col-md-12">
               <div class="card latest-update-card">
                  <div class="card-header">
                     <h5>근태관리</h5>
                     <div class="card-header-right">
                        <div class="btn-group card-option">
                           <button type="button" class="btn dropdown-toggle"
                              data-toggle="dropdown" aria-haspopup="true"
                              aria-expanded="false">
                              <i class="feather icon-more-horizontal"></i>
                           </button>
                           <ul
                              class="list-unstyled card-option dropdown-menu dropdown-menu-right">
                              <li class="dropdown-item full-card"><a href="#!"><span><i
                                       class="feather icon-maximize"></i> maximize</span><span
                                    style="display: none"><i
                                       class="feather icon-minimize"></i> Restore</span></a></li>
                              <li class="dropdown-item minimize-card"><a href="#!"><span><i
                                       class="feather icon-minus"></i> collapse</span><span
                                    style="display: none"><i class="feather icon-plus"></i>
                                       expand</span></a></li>
                              <li class="dropdown-item reload-card"><a href="#!"><i
                                    class="feather icon-refresh-cw"></i> reload</a></li>
                              <li class="dropdown-item close-card"><a href="#!"><i
                                    class="feather icon-trash"></i> remove</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="card-body">
                     <div class="latest-update-box">
                        <div class="row p-t-30 p-b-30">
                           <div class="col-auto text-right update-meta">
                              <p class="text-muted m-b-0 d-inline-flex">2 hrs ago</p>
                              <i class="feather icon-twitter bg-twitter update-icon"></i>
                           </div>
                           <div class="col">
                              <a href="#!">
                                 <h6>+ 1652 Followers</h6>
                              </a>
                              <p class="text-muted m-b-0">You’re getting more and more
                                 followers, keep it up!</p>
                           </div>
                        </div>
                        <div class="row p-b-30">
                           <div class="col-auto text-right update-meta">
                              <p class="text-muted m-b-0 d-inline-flex">4 hrs ago</p>
                              <i class="feather icon-briefcase bg-c-red update-icon"></i>
                           </div>
                           <div class="col">
                              <a href="#!">
                                 <h6>+ 5 New Products were added!</h6>
                              </a>
                              <p class="text-muted m-b-0">Congratulations!</p>
                           </div>
                        </div>
                        <div class="row p-b-0">
                           <div class="col-auto text-right update-meta">
                              <p class="text-muted m-b-0 d-inline-flex">2 day ago</p>
                              <i class="feather icon-facebook bg-facebook update-icon"></i>
                           </div>
                           <div class="col">
                              <a href="#!">
                                 <h6>+1 Friend Requests</h6>
                              </a>
                              <p class="text-muted m-b-10">This is great, keep it up!</p>
                              <div class="table-responsive">
                                 <table class="table table-hover">
                                    <tr>
                                       <td class="b-none"><a href="#!" class="align-middle">
                                             <img
                                             src="${pageContext.request.contextPath}/resources/ablePro/assets/images/user/avatar-2.jpg"
                                             alt="user image"
                                             class="img-radius wid-40 align-top m-r-15">
                                             <div class="d-inline-block">
                                                <h6>Jeny William</h6>
                                                <p class="text-muted m-b-0">Graphic Designer</p>
                                             </div>
                                       </a></td>
                                    </tr>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="text-center">
                        <a href="#!" class="b-b-primary text-primary">View all
                           Projects</a>
                     </div>
                  </div>
               </div>
            </div>
            <!-- 근태관리화면끝 -->
            
            
            
 <!-- [ Todo-list1 ] start -->
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h5>To Do List</h5>
                    </div>
                    <div class="card-body">
                        <div class="input-group mb-3">
                            <input type="text" name="task-insert" class="form-control add_task_todo" placeholder="Create your task list" required="">
                            <div class="input-group-append">
                                <button class="btn waves-effect waves-light btn-secondary" id="add-btn">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="new-task">
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                                        <span class="custom-control-label">Lorem Ipsum Dolor Sit Amet</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(1);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck2">
                                        <span class="custom-control-label">Industry's standard dummy text ever since the 1500s</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(2);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck3">
                                        <span class="custom-control-label">The point of using Lorem Ipsum is that it has a more-or-less </span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(3);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck4">
                                        <span class="custom-control-label">Contrary to popular belief</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(4);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck5">
                                        <span class="custom-control-label">There are many variations of passages of Lorem Ipsum</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(5);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck6">
                                        <span class="custom-control-label">Sed ut perspiciatis unde omnis iste natus</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(6);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                            <div class="to-do-list mb-3">
                                <div class="d-inline-block">
                                    <label class="check-task custom-control custom-checkbox d-flex justify-content-center">
                                        <input type="checkbox" class="custom-control-input" id="customCheck7">
                                        <span class="custom-control-label"> must explain to you how all this mistaken idea</span>
                                    </label>
                                </div>
                                <div class="float-right"><a onclick="delete_todo(7);" href="#!" class="delete_todolist"><i class="far fa-trash-alt"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Todo-list1 ] end -->
            
          
            <!-- 공지사항게시판 시작 -->
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>공지사항</h5>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                    </div>
                       <!-- 공지사항게시판 끝 -->       
                    
             
                    
                   
        <!-- 캘린더 -->
       
        <div class="col-lg-8 col-md-12">
            <div class="card table-card">
                    <div class="card-header">
                        <h5>캘린더</h5>
                    </div>
                    
                 <div class="pd-20 card-box mb-30">
               <div class="calendar-wrap">
                  <div id='calendar'></div>
               </div>
                  <jsp:include page="/WEB-INF/views/common/calendar.jsp"/>
               </div>
            </div>
        </div>
   
    <!-- 캘린더 일정 -->
                    <div class="card-body text-center">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Calendar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <tr>
                                        <td>getDate();</td>
                                        <td>등록된 일정이 없습니다.</td>
                                    </tr>
                                    <tr>
                                        <td>getDate();</td>
                                        <td>등록된 일정이 없습니다.</td>
                                    </tr>
                                    <tr>
                                        <td>getDate();</td>
                                        <td>등록된 일정이 없습니다.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
</div>
<!-- [ Main Content ] 메인화면 끝 -->

<!-- script 부분 -->

       <script>

function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:30%;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

</script>


       <script src="${pageContext.request.contextPath}/resources/ablePro/assets/js/todo.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>