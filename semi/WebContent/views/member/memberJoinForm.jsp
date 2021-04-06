<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="../common/header.jsp" %>
     

 		<div class="card shadow mb-4">
            <div class="card-header py-3">
                            

                   <h2 class="mb-3" align="center">회원가입</h2>
        <!-- 헤더부분 -->           
        	</div>                      

                    
        <div class="card-body">
            
                  
        <form id="enrollForm"action="<%=request.getContextPath()%>/insert.me" method="post"
         onsubmit="return joinValidate();">
         
         <input type="hidden" name="region1">
         <input type="hidden" name="region2">
         <input type="hidden" name="lat">
         <input type="hidden" name="lon">
         
         <table align="center" >
             <tr>
               <td>이름</td>   <!-- required : 필수 -->
               <td><input type="text"  class="form-control" maxlength="5" name="userName" placeholder="2~5이내한글로 적으시오" required></td>
               <td></td>
            </tr>
            <tr>
               <td  width="200px"><label class="form-label" >아이디</label></td>
               <td><input type="text"  class="form-control" maxlength="13" name="userId" placeholder="2~13자이내  적으시오"  required></td>
               <td width="200px">
                  <button type="button" class="btn btn-outline-primary" id="idCheckBtn" onclick="checkId();" >중복확인</button>
               </td>
               <td><label id="idResult"></label></td>
            </tr>
            
            <br>
            
            <tr>
               <td>비밀번호</td>
               <td><input type="password"  class="form-control" maxlength="15" name="userPwd" placeholder="4~13자이내 적으시오"
                  required></td>
               <td><label id="pwdResult"></label></td>
               <td></td>
            </tr>
            
            <tr>
               <td>비밀번호 확인</td>
               <td><input type="password"  class="form-control" maxlength="15" name="checkPwd"
                  required></td>
                  
               <td></td>
            </tr>
     
            <tr>
               <td>휴대폰 번호</td>
               <td><input type="tel"  class="form-control"  maxlength="11" name="phone"
                  placeholder="(-없이)01022222222"></td>
               <td></td>
            </tr>
      
            <tr>
               <td>이메일</td>
               <td><input type="email" class="form-control"  name="email" placeholder="example@naver.com"></td>
            
               <td></td>
            </tr>
            
       
             <td></td>
            <tr>
           <td>내 위치 조회</td>
    

           <td id="locationTd"><label id="region1La"></label><label id="region2La"></label><button  class="btn btn-primary" id="locationBtn">조회</button><td>

           
            </tr>
  
         </table>
         <br><br>
         
         

        <div align="center">
         
			<p>※중복확인을 하시면 버튼이 활성화 됩니다.</p>
            <button type="submit" class="btn btn-primary btn-primary" id="joinBtn" disabled>가입하기</button>

         </div>
        
      </form>
      
      
      </div>
        <!-- 바디부분 끝 -->
    </div>
    <!-- 카드 끝 --> 

	<script>
	$(function(){
		$("#locationBtn").on("click",function(e){
			e.preventDefault();
			var lat=0.0;
			var lon=0.0;
            navigator.geolocation.getCurrentPosition(function(position){
                
            	
                 lat=position.coords.latitude; //위도 
                 lon=position.coords.longitude; //경도
            
                
                console.log(lat);
                console.log(lon);
            
          		$.ajax({ //행정구역명 알아오기
           			
           			
      			url: "https://dapi.kakao.com/v2/local/geo/coord2regioncode",
           			dataType: "json",
           			headers: {'Authorization': 'KakaoAK 59be782aa73b67df6a17a930e63d057d'},
           			data : {
           				
           				x:lon,y:lat
           			},
           			type:"get",
           			success : function(obj){
           				
           				
           				if(obj.documents.length!=0){
           					
           					var region1=obj.documents[0].region_2depth_name;
           					var region2=obj.documents[0].region_3depth_name;
           					
           					$("#region1La").css("margin-right","10px");
           					$("#region2La").css("margin-right","10px");
           					
           					$("#region1La").text(region1);
           					$("#region2La").text(region2);
           					
           					$("input[name=region1]").attr("value",region1);
           					$("input[name=region2]").attr("value",region2);
							
           					console.log("region1"+region1);
           					console.log("region2"+region2);
           					
           				}
           				
           			},
           			error : function(){
           				alert("위치정보 조회 실패");
           			}
           			
           		
           			
           			
           			
           		}); //ajax1
            
        		$.ajax({ //좌표계 변환하기
        		      
           			
          			url: "https://dapi.kakao.com/v2/local/geo/transcoord",
               			dataType: "json",
               			headers: {'Authorization': 'KakaoAK 59be782aa73b67df6a17a930e63d057d'},
               			data : {
               				
               				x:lon,y:lat,input_coord:"WGS84",output_coord:"WTM"
               			},
               			type:"get",
               			success : function(obj){
               				
               				
               				if(obj.documents.length!=0){
               					
               					var x=obj.documents[0].x;
               					var y=obj.documents[0].y;
               					
               					$("input[name=lat]").attr("value",y);
               					$("input[name=lon]").attr("value",x);              					
    							
               					
               					
               				}
               				
               			},
               			error : function(){
               				alert("위치정보 변환 실패");
               			}
               			
               		
               			
               			
               			
               		}); //ajax2
                
            
            }); //navigator
            
            

            
            
            
		}); //event
	});	
	
	
	
	</script>





      
        
           <!-- 아이디 중복확인 -->
        
        <script>
        
        function checkId(){
        	
		console.log("checkId()구동확인");
        	
     	   var userId = $("#enrollForm input[name=userId]");
     	   
     	   
     	   if(userId.val() ==""){
     		   alert("아이디를 입력해주세요");
     		   userId.focus();
     		   return false;
     		   
     		   }
     	   
     	   
     	   $.ajax({
     		  url:"<%=request.getContextPath()%>/idChek.me",
     		  type:"post",
     		  data:{userId:userId.val()},
     		  success:function(result){
     			  if(result == "fail"){ //사용불가
     				  alert("사옹할 수 없는 아이디 입니다.");
     				 $("#idResult").text("중복된 아이디입니다.").css({"color":"red" ,"font-size":"1px"});
     				 
     				 
     				
     			  	 userId.focus();
     				  
     			  }else {
     				 if(confirm("사용 가능한 아이디 입니다. 사용하시겠습니까?")){
     					 userId.attr("readonly","true");
     					 $("#idResult").text("사용가능합니다.").css("color","blue");
     					 $("#joinBtn").removeAttr("disabled"); //회원가입 버튼 비활성화 속성 삭제
     					 
     					 
     					 
     				 }else {
     					 userId.focus();
     				 }
     				  
     			  }
     		
     		  },
     		  error:function(){
     			console.log("서버통신실패");  
     			
     		}
     		  		   
     	   });
        
     	   
        }
        
        
        </script>
        
        
        
        <!-- 정규표현식및 ,비밀번호 체크   -->
        <script>
        function joinValidate(){
        	
        	 if (!(/^[가-힣]{2,}$/.test($("#enrollForm input[name=userName]")
                       .val()))) {
                    $("#enrollForm input[name=userName]").focus();
                    
                    alert("이름 두글자 이상 한글만 적어주세요!");
                    return false;
                 }
        	
              
        	 if (!(/^[a-z][a-z\d]{3,11}$/i.test($(
               "#enrollForm input[name=userId]").val()))) {
            $("#enrollForm input[name=userId]").focus();
            
            alert("아이디 3자리이상11자리 이하로  영어와 숫자 조합으로 적어주세요");

            return false;
         }
        	 
        	 if (!(/^[a-z][a-z\d]{3,13}$/i.test($(
             "#enrollForm input[name=userPwd]").val()))) {
          $("#enrollForm input[name=userPwd]").focus();
          
          alert("비밀번호 4자리이상13자리 이하로 적어주세요");

          return false;
       }
        	 
        	
        	
        	 
        	
        	
        	if($("#enrollForm input[name=userPwd]").val()!=$("#enrollForm input[name=checkPwd]").val()){
        		
        		$("#pwdResult").text("비밀번호가 일치하지않습니다.");
        		alert("비밀번호를 확인해주세요!")
        		return false;
        	}
        	
        }
        
        
        </script>
        
        
     


<%@ include file ="../common/footer.jsp" %>