<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page
	import="java.util.ArrayList,com.kh.board.model.vo.*, com.kh.shop.model.vo.*"%>
<%
	Board b = (Board) request.getAttribute("b");

%>

    
    	<%@ include file ="views/common/header.jsp" %>
    	
    	
    	
    	 <style>

.topList {
		width: 1000px;
		height: 500px;
		
		color: black;
		margin-left:26%;
		margin-top: 100px
	}

.thumb {
	display:inline-block;
	width: 300px;
	height: 250px;
	margin: 10px;
	border: 0px solid black;
}

.thumb:hover {
	cursor: pointer;
}

</style>
      
        <!-- Mastheaddf-->
        <header class="masthead bg-primary text-white text-center">
        
            <div class="container d-flex align-items-center flex-column">
                
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">PUMASSI</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0"> </p>
            </div>
        </header>
        <!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
       
             <h2 class="page-section-heading text-center text-uppercase text-secondary ">인기가게 <i class="fas fa-store"></i></h2>
             
             <!-- 별모양 아이콘-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                 <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>    
                    
                </div>
               
           <!-- 인기게시물 3가지들어갈곳 -->      
              <div class="row">
              <div class="topList" align="right">
              
               <div id="thumbList">
              
              
              </div>
              
              </div>
     </section>
        <!-- About Section-->
        <section class="page-section bg-primary text-white mb-0" id="about">
            <div class="container" style=" width:1500px;  " >
                <!-- About Section Heading-->
                <h2 class="page-section-heading text-center  text-white" style="margin-top:10px;">인기게시물<i class="fas fa-icons"></i></h2>
                <!-- Icon Divider 별모양-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- About Section Content-->
                <div class="row">
    
                     <div class="col-lg-4 mr-auto" id="topList"> <p class="lead" style="margin-left:50%;">우리마을게시판<i class="fas fa-icons"></i></p>
				            <table class="table" id="thumbtable" align="center"  style="width:700px;  margin-left:40%;">
				            <thead>
				             
				       <tr>
						<th scope="col">글제목</th>
				     	<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					   </tr>          
				            </thead>
							  <!--<tr>
									<td width="100px">admin</td>
									<td width="300px">댓글작성내용</td>
									<td width="100px">2020년 1월 20일</td>
								</tr>
								<tr>
									<td width="100px">user01</td>
								<td width="300px">댓글작성내용</td>
								    <td width="100px">2020년 1월 20일</td>
								</tr>
								<tr>
								<td width="100px">test01</td>
								<td width="300px">댓글작성내용</td>
								<td width="100px">2020년 1월 20일</td>
								</tr>
								
								   <tr>
									<td width="100px">admin</td>
									<td width="300px">댓글작성내용</td>
								<td width="100px">2020년 1월 20일</td>
								</tr>
								<tr>
									<td width="100px">user01</td>
								   <td width="100px">댓글작성내용</td>
									<td width="100px">2020년 1월 20일</td>
								</tr>
								<tr>
									<td width="100px">test01</td>
									<td width="300px">댓글작성내용</td>
									<td width="100px">2020년 1월 20일</td>
								</tr>-->
							
							</table>
                   </div> <!-- 인기게시물 end -->
                   
                   
                 
               </div> <!-- row end -->
           </div> <!-- container end -->
        </section> <!-- 게시물섹션 end -->
        
        
        <!-- Contact Section-->
        <section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0"></h2>
         
                <!-- Contact Section Form-->
                <div class="row">

                </div>
            </div>
        </section>
       
       
       
       
       <!-- ------------------------------------------스크립트 ----------------------------------------------------------------->
       
	<script>
		$(function() {
			selectTopList();
			//setInterval(selectTopList,2000);
			
			$("#thumbList").on("click",".thumb",function(){ 
				var sNo =$(this).children().eq(0).val();
			
			
				window.open("<%=contextPath%>/detailTop.sh?sNo="+ sNo, '_blank'); 
			
			});
		});

		function selectTopList() {
			$.ajax({
				url : "topShList.do",
				type : "get",
				success : function(list) {
					var value="";
					for(var i in list){
						value += '<div class="thumb" align="center">'+
								  '<input type="hidden" value="'+list[i].shopNo+'">'+
								  '<p style="font-weight:bold;">'+list[i].shopTitle+'</p>'+
								  '<img src="<%=contextPath%>/resources/board_upfiles/'+ list[i].titleImg+'"width="250px" height="200px"> <br>'+
								  '<p style="font-weight:bold;">'+list[i].detailLocation+'</p>'+
								  
								  '</div>';
								  
						
					}
					$("#thumbList").html(value);
				},
				error : function() {
					console.log("ajax 통신실패");
				}

			});
		}
		</script>
		  <!-- --------------------------------d----------가게스크립트 끝 ----------------------------------------------------------------->
          <!-- ------------------------------------------게시판스크립트 ----------------------------------------------------------------->
          
      	<script>
		$(function() {
			selectBTopList();
			//setInterval(selectTopList,2000);
			
			$("#thumbtable").on("click",".thumbbo",function(){ 
				var bno =$(this).data("bno");
				
				window.open("<%=contextPath%>/detailTop.bo?bno="+bno, '_blank'); 
			 
			});
		});

		function selectBTopList() {
		
			$.ajax({
				url :"topList.do",
				type : "get",
				success : function(list) {
					console.log(list);
					var value="";
					for(var i in list){
						value += '<tr class="thumbbo"  data-bno="'+list[i].boardNo+'">'+
								  '<td width="100px" align="left">'+list[i].boardTitle+'</td>'+
								  '<td width="50px" align="right">'+list[i].createDate+'</td>'+
								  '<td width="50px" align="right">'+'조회수:'+list[i].readCount+'</td>'+
								  '</tr>';
								  
						
					}
					$("#thumbtable").html(value);
				},
				error : function() {
					console.log("ajax 통신실패");
				}

			});
		}
		</script>
          
          
          
          <!-- ------------------------------------------게시판스크립트 끝  ----------------------------------------------------------------->
        
         
         
         
        
         
         
         
         
         
         
         	<%@ include file ="views/common/footer.jsp" %>

