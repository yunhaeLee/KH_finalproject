<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>

	
      
                    
                    
            <div class="card shadow mb-4">
                  <div class="card-header py-3">
                            
                         헤더부분
                   </div>                      
                    
                  <div class="card-body">
                  
                  <button data-toggle="modal" data-target="#boardReportModal" class="btn btn-danger" >게시글신고모달</button><br>
                 <button data-toggle="modal" data-target="#replyReportModal" class="btn btn-danger" >댓글신고모달</button><br>
                 <button data-toggle="modal" data-target="#userReportModal" class="btn btn-danger" >사용자신고모달</button><br>
                 
                  
                  
                  
                  		바디부분 <i class="fas fa-air-freshener"></i>아이콘넣을수 있는 태그 font awsome 사이트 방문-icon 
                  
                  		<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label">Email address</label>
						  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
						</div>
						<div class="mb-3">
						  <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
						  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
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
                    
      
                    
        <!--  Modals-->
        
        
        <!-- 게시글 신고 모달-->
        <div class="portfolio-modal modal fade" id="boardReportModal" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
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
                                    <br>
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal1Label">게시글 신고하기</h2>
                                  
                                    
                                    <!-- Portfolio Modal - Text-->
                                   <br>
                                   <form method="post">
                                   		
                                   <div class="form-group">
									  <label for="reportCategory" class="form-label">신고이유</label>
										<select class="form-control" id="reportCategory" name="reportCategory">
											<option>----</option>
											<option>사기글 같아요</option>
											<option>증복 게시글</option>
											<option>기타사유(내용을 적어주세요)</option>
											
										</select>

									</div>		
                                   		
                                   		
                                   <div class="form-group">
									  <label for="reportContent" class="form-label">내용</label>
									  <textarea class="form-control" id="reportContent" name="reportContent" rows="3"></textarea>
									</div>
									     <button class="btn btn-primary" type="submit">
                                      	 		보내기
                                    	</button>	                              
                                   
                                   </form>
                               
                                   
                                   
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- 댓글 신고 모달-->
        <div class="portfolio-modal modal fade" id="replyReportModal" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
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
                                    <br>
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal1Label">댓글 신고하기</h2>
                                  
                                    
                                    <!-- Portfolio Modal - Text-->
                                   <br>
                                   <form method="post">
                                   		
                                   <div class="form-group">
									  <label for="reportCategory" class="form-label">신고이유</label>
										<select class="form-control" id="reportCategory" name="reportCategory">
											<option>----</option>
											<option>욕설이 포함되어있어요</option>
											<option>성희롱이 포함되어있어요</option>
											<option>다른 사람에게 혐오감을 줘요</option>
											<option>증복 댓글</option>
											<option>기타사유(내용을 적어주세요)</option>
											
										</select>

									</div>		
                                   		
                                   		
                                   <div class="form-group">
									  <label for="reportContent" class="form-label">내용</label>
									  <textarea class="form-control" id="reportContent" name="reportContent" rows="3"></textarea>
									</div>
									     <button class="btn btn-primary" >
                                      	 		보내기
                                    	</button>	                              
                                   
                                   </form>
                               
                                   
                                   
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

     <!-- 사용자 신고 모달-->
        <div class="portfolio-modal modal fade" id="userReportModal" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
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
                                    <br>
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal1Label">사용자 신고하기</h2>
                                  
                                    
                                    <!-- Portfolio Modal - Text-->
                                   <br>
                                   <form method="post">
                                   		
                                   <div class="form-group">
									  <label for="reportCategory" class="form-label">신고이유</label>
										<select class="form-control" id="reportCategory" name="reportCategory">
											<option>----</option>
											<option>비매너 사용자예요</option>
											<option>욕설을 해요</option>
											<option>성희롱 발언을 해요</option>
											<option>기타사유(내용을 적어주세요)</option>
											
										</select>

									</div>		
                                   		
                                   		
                                   <div class="form-group">
									  <label for="reportContent" class="form-label">내용</label>
									  <textarea class="form-control" id="reportContent" name="reportContent" rows="3"></textarea>
									</div>
									     <button class="btn btn-primary" >
                                      	 		보내기
                                    	</button>	                              
                                   
                                   </form>
                               
                                   
                                   
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



	
<%@ include file ="footer.jsp" %>