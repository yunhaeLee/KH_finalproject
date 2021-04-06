<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../common/header.jsp" %>

	<%

//Member m =(Member)request.getAttribute("loginUser");	
	
	System.out.println("loginUser "+ loginUser);
	System.out.println("m.getId: "+ loginUser.getId());
	
	String userId = loginUser.getId();
	String userPwd = loginUser.getPwd();
	String userName = loginUser.getM_name();
	String phone = loginUser.getPhone();
	String email = loginUser.getEmail();
	

	String originPwd=(String)session.getAttribute("originPwd");
	

	
	System.out.println("orginPwd 마이페이지:  "+originPwd);
	
	

%>








  		<div class="card shadow mb-4">
         <div class="card-header py-3" align="center">
                    <h4> 마이페이지 </h4>
         </div>                      
		                    	
			 <div>
			<i class="far fa-user-circle fa-5x"></i>
			<b/> <%=loginUser.getM_name()%> 님<b/>
			 <hr>
			</div>                  
		          
     
     
		<div class="card-body">
			<div class="row" >
				  <div class="col-4">
				    <div class="list-group" id="list-tab" role="tablist">
				      <a class="list-group-item list-group-item-action active" id="list-updateForm-list" data-toggle="list" href="#list-updateForm" role="tab" aria-controls="home">내정보수정</a>
				      <a class="list-group-item list-group-item-action" id="list-updatePwd-list" data-toggle="list" href="#list-updatePwd" role="tab" aria-controls="profile">비밀번호변경</a>
				      <a class="list-group-item list-group-item-action" id="list-deleteMember-list" data-toggle="list" href="#list-deleteMember" role="tab" aria-controls="messages">회원탈퇴</a>
			</div>
				  </div>
				  <div class="col-8">
				    <div class="tab-content" id="nav-tabContent">
				     
				<div class="tab-pane fade show active" id="list-updateForm" role="tabpanel" aria-labelledby="list-home-list">
				
	<form id="updateForm" action="<%=request.getContextPath()%>/update.me" method="post">
			
			<h5>- 내 정보 수정 -</h5>
			<hr>
			<table align="center">
				<tr>
					<td width="200px"> 아이디</td>
					<td><input type="text" class="form-control"  maxlength="13" name="userId"
						value=<%=userId%> readonly></td>
					
				</tr>
			
				
				<tr>
					<td> 이름</td>
					<td><input type="text" class="form-control"  maxlength="5" name="userName"
						value="<%=userName%>" required></td>
					<td></td>
				</tr>
				
	
				<tr>
					<td>연락처</td>
					<td><input type="tel" class="form-control"  maxlength="11" name="phone"
						placeholder="(-없이)01012345678" value="<%=phone%>"></td>
					<td></td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td><input type="email" class="form-control"  name="email" value="<%=email%>"></td>
					<td></td>
				</tr>
				
				
			
			
						</table>
						
						
						<br><br>
				      <div align="center">
				      	<button type="submit" class="btn btn-primary btn-primary" id="updateBtn" >수정하기</button>
				        
				        </div>
				        
				         </form>  
				      </div>
				     <!-- 정보수정 끝 -->
				     
		     
				     
	  				<!-- 비밀번호변경 시작 -->
				      <div class="tab-pane fade" id="list-updatePwd" role="tabpanel" aria-labelledby="list-profile-list">
				      
				      	<form id="updatePwdForm" action="<%= request.getContextPath() %>/updatePwd.me" method="post">
							
							
							<h5>- 비밀번호 변경 -</h5>
							<hr>
							<table align="center">
								<tr>
									<td><label>현재 비밀번호</label>
									<td><input type="password" class="form-control"  name="userPwd" id="userPwd"placeholder="현재 비밀번호 입력"></td>
								</tr>
								<tr>
									<td><label>새 비밀번호</label></td>
									<td><input type="password"class="form-control"  name="newPwd" placeholder="새 비밀번호 입력"></td>
								</tr>
								<tr>
									<td><label>새 비밀번호 확인</label></td>
									<td><input type="password" class="form-control"  name="checkPwd" placeholder="새 비밀번호 확인"></td>
								</tr>
							</table>
							
							
								<br>
								<br>
								
								<div class="btns" align="center">
									<div id="updatePwdBtn" class="btn btn-primary btn-primary"  onclick="checkPwd();">변경하기</div>
								</div>
										      
				      
				      </form>
				      </div>
				      <!-- 비밀번호변경 끝 -->
				      
				      
				      
<div class="tab-pane fade" id="list-deleteMember" role="tabpanel" aria-labelledby="list-messages-list">
				 <!-- 회원탈퇴 시작 -->
				<form id="deleteForm" action="<%= request.getContextPath() %>/" method="post">
					
					<h5>- 회원 탈퇴 -</h5>
					<hr>
				
				<div align="left">
					
				<mark>※탈퇴 안내※</mark>
				<br><br>
									
				<p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>	<br>
				
				<p>사용하고 계신 아이디 <h5><u>(" <%=userId %> ")</u></h5> (은)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>	<br>
				
				<p>탈퇴한 아이디는 본인과 인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>	<br>
				
				</div>
			
			
			<br><br><br>
			
				<label><h5>안내사항을 확인하였으며 이에 동의합니다.</h5> </label>
				<input type="checkbox" id="agree">
				
				<br><br>
				<h8>※체크박스를 선택하시면 버튼이 활성화 됩니다.&ensp;&ensp; </h8>
				<button id="deleteBtn" align="center" class="btn btn-primary btn-danger"  onclick="deleteMember();" disabled>탈퇴하기</button>
				
			</form>


</div>
 <!-- 회원탈퇴 끝 -->
				    </div>
				  </div>
				</div>      
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	          
        
                </div>       
			 <!-- card-body end -->
           </div>
   			<!-- card end -->

	
	
	
	
	

	<script>
	<!-- 비밀번호변경 함수 -->	
		function checkPwd(){
			
			var userPwd = $("#userPwd");
			var newPwd = $("input[name='newPwd']");
			var checkPwd = $("input[name='checkPwd']");
			
			if( newPwd.val().trim() == "" || checkPwd.val().trim() == ""){
				alert("비밀번호를 입력해주세요");
				return;
			}
			
			if(newPwd.val() != checkPwd.val()){
				alert("비밀번호가 다릅니다.");
				checkPwd.val('');
				checkPwd.focus();
				return;
			} 
			
		
			
			$("#updatePwdForm").submit();
		}
		


		function deleteMember(){
			var pwd = prompt("현재 비밀번호를 입력해 주세요.");
			
			
			if("<%=originPwd%>" == pwd){
				var val = prompt("정말로 탈퇴하시겠습니까?(y/n)");
		
				
				if(val =='y'){
					
					$("#deleteForm").attr("action","<%=request.getContextPath()%>/delete.me");
					$("#deleteForm").submit();
					
				}else if(val == 'n'){
					alert("취소하였습니다.");
				
				}
				
				
			}else if (pwd == null){
				alert("비밀번호를 입력해주세요.");
				
				
			}else {
				alert("비밀번호를 잘못입력하셨습니다.")
			
			}
			
	
		}
		
		
		
		$(function(){
		    $("#agree").change(function(){
		        if($("#agree").is(":checked")){
					
		        	$("#deleteBtn").attr("disabled",false);

		        }else{
		        	
		        	$("#deleteBtn").attr("disabled",true);
		        }
		    });
		});
		
	
	</script>























 <%@ include file ="../common/footer.jsp"%>

