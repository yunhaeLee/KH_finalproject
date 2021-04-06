<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>

	             
            <div class="card shadow mb-4">
                  <div class="card-header py-3">
                            
                         헤더부분
                   </div>                      
                    
                  <div class="card-body">
                  
                  <button data-toggle="modal" data-target="#portfolioModal1" class="btn btn-danger" >포트폴리오 모달</button><br>
                  <button  class="btn btn-primary" id="defaultModalBtn">기본모달</button><br>
                  
                  
                  		바디부분 <i class="fas fa-air-freshener"></i>아이콘넣을수 있는 태그 font awsome 사이트 방문-icon 
                  
                  		<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label">Email address</label>
						  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
						</div>
						<div class="mb-3">
						  <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
						  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"><i class="far fa-comment-dots"></i></textarea>
						</div>
                   
                  </div>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  
                  
          
        
                       
			 <!-- card-body end -->
           </div>
   			<!-- card end -->
                    
                   
                   
   <!-- DropDown 예시 -->                  
<div class="dropdown ">
  <a class="btn btn-warning dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false">
    Dropdown link
  </a>

  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
    <li><hr></li>
    <li><a class="dropdown-item" href="#">Something else here</a></li>
  </ul>
</div>
             
                   
                   
                   
                    
                    
            <script>
            	$("#defaultModalBtn").on("click",function(){
            		$("#defaultModal").modal("show");
            	});
            
            </script>        
                    
                    
                    
        <!--  Modals-->
        
        
        <!-- Portfolio Modal 1-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal1Label">Log Cabin</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/portfolio/cabin.png" alt="" />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                                    <button class="btn btn-primary" data-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<!-- 기본모달 -->
	
	<div class="modal" id="defaultModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Modal title</h5>
                   <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>	      </div>
	      <div class="modal-body">
	        <p>Modal body text goes here.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>

	
<%@ include file ="footer.jsp" %>