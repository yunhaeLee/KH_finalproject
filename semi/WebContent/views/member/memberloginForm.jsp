<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file ="../common/header.jsp" %>


    

    
 <div class="card shadow mb-4">
                  <div class="card-header py-3">
                            
                         	<h3 align=center>로그인</h3>
                   </div>                      
                    
                  <div class="card-body">
                
               

            <form id="loginForm" action="<%= request.getContextPath()%>/login.me" method="post" onsubmit="return loginValidate();">
			<table align=center >
				<tr>
					<th><label for="userId" >아이디  </label></th>
					<td><input class="form-control" id="userId" type="text" name="userId"></td>
				</tr>
				<tr>
					<th><label for="userPwd">비밀번호 </label></th>
					<td><input class="form-control" id="userPwd" type="password" name="userPwd"></td>
				</tr>
			</table>
			<br><br>
			<div class="btns" align="center">
			
				<button class="btn btn-primary" id="loginBtn" type="submit">로그인</button>
			
			
			</div>
		</form>
     
                  
                  
                  		                   
                  </div>
         
                       
			 <!-- card-body end -->
           </div>
   			<!-- card end -->
    
    
   	<script>
   	
   	
   	
   	
   	</script>
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    <%@ include file ="../common/footer.jsp" %>