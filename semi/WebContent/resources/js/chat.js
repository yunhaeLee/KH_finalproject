



	var chatRoomName=$("#chatRoomName"); //채팅방 이름부분 객체

	var mno; //로그인하면 회원 번호 들어옴 
	
	var mno2; //채팅방 클릭하거나 게시글에서 채팅하기 클릭했을때 상대방 번호 저장
	var mName; //채팅방 이름 바꿀때 사용
	
	
	var chatArea=$("#chatWriteArea");
	
	
	
	var chatListWS;
	var chatWS;
	
	
	$("#accordionSidebar").on("click","li",function(){ //채팅방 클릭했을 때 이벤트
		
		
		mno2=$(this).data("mno2");
	 mName=$(this).data("mname"); //채팅방 이름 변수 바꿔놓기 
		$(this).find(".chatUnreadCount").text(0); //안읽은 메세지 갯수 0으로 바꿈
		 $("#sidebar").css("display","none"); //채팅리스트 숨기기
			$("#sidebar2").css("display","block"); //채팅방 보이게 바꾸기 
		
		insertChatRoom(); //채팅방 입장 
		
	});
	
	$("#chatBtn").on("click",function(){ //게시글 상세조회에서 채팅버튼 클릭했을 때
		
		mno2=$(this).data("mno2");
		 mName=$(this).data("mname"); //채팅방 이름 변수 바꿔놓기 
		 
		 if($("#sidebar-wrapper").css("display")=="none"){ //채팅창이 닫혀있으
			 
			 $("#sidebar-wrapper").css("display","block"); //채팅창 열기
		 }
		if($("#sidebar").css("display")=="block"){ //채팅리스트 열려있으면 
			$("#sidebar").css("display","none"); //닫고 채팅방 열기
			$("#sidebar2").css("display","block");
			
			
		}
		else if($("#sidebar2").css("display")=="block"){ //채팅방 열려있으면
			chatWS.send("delete"); //접속 끊기
			console.log("접속끊기");
			
		}
		var list=$("#accordionSidebar").find("li");
		
		for(var i=0;i<list.length;i++){
			if($(list[i]).data("mno2")==mno2){ //이미 존재하는채팅방 클릭한거면
				$(list[i]).find(".chatUnreadCount").text(0); //안읽은 메세지 갯수 0으로 바꿈
			}
		}
		
		insertChatRoom(); //채팅방 입장 
		
	});

	function deleteChatRoomList(){ //채팅방리스트 지우기
		
		 $("#accordionSidebar > li").remove();
			$(".chatDivider").remove();
			
	}
	function deleteChatList(){ //채팅리스트 지우기
		$(".chatDiv").remove();
		
	}
	
	

	 function insertChatRoom(){ //채팅방 들어가기
		 
		 chatRoomName.text(mName); //채팅방 이름 바꾸기
		

			
		
			deleteChatList();
			
			//원래 존재한 채팅방이면ajax로 불러옴 
			
			$.ajax({
				url:"getChatList",
				type:"get",
				data:{mno:mno,mno2:mno2},
				success:function(list){
					
					str="";
					$.each(list,function(i){
					
						if(list[i].chatSender==mno){ //내가 보낸 메세지일 때
							
							str+='<div class="chatDiv">'+
								'<span class="myChat float-right">'+list[i].chatContent+'</span><br>'+
								'<span class="time float-right">'+list[i].chatDate+'</span>';
							
							
									if(list[i].readStatus=="N"){ 
										str+='<span class="unread float-right">1</span>';
									}
							str+='</div>';
							
						}else{
							str+='<div class="chatDiv">'+
							'<span class="otherChat float-left">'+list[i].chatContent+'</span><br>'+
							'<span class="time float-left">'+list[i].chatDate+'</span></div>';
							
						}
						
						
					});
					$("#chatView").html(str);
					$("#chatView").scrollTop($("#chatView").height());
				},
				error:function(){
					console.log("채팅방 로딩 오류");
					
				}
				
				
				
				
			});
			
			
			
			
			
			
			var emptyJson={chatSender:mno,chatReceiver:mno2};
			chatWS.send(JSON.stringify(emptyJson)); //빈메세지 보내기 
		

		
	  }
	
	function getChatRoomList(){ //채팅방리스트 불러오기
		
		 deleteChatRoomList();
		$("#sidebar2").css("display","none"); //채팅방 숨기기
		$("#sidebar").css("display","block");
		
		$.ajax({  //채팅방리스트가져오기 
			
			url:"getChatRoomList",
			type:"get",
			data:{ mno:mno},
			success:function(list){
				
			
		
					
					var str="";
					$.each(list,function(i){
						
						str+='<li class="nav-item active hoverStyle"  data-rno="'+list[i].cRNO+'" data-mno2="'+list[i].mno2+'" data-mName="'+list[i].mName+'">'+
					   	'<div  class="firstRow color-white"><i class="fas fa-caret-right"></i><span>&nbsp;&nbsp;&nbsp;'+list[i].mName+'</span></div>'
						   	+'<div  class="secondRow"> <div class="firstCol"><span class="lastChat">&nbsp;&nbsp;&nbsp; '+list[i].lastChat+'</span></div><div class="secondCol"><span class="float-right chatUnreadCount">'+list[i].unreadCount+'</span></div></div>'
						   	 
						  +' </li>';
						
						str+='<hr class="sidebar-divider my-0 chatDivider">';
						
					});
				 	$("#accordionSidebar").append(str);
				 	
				 
			 
				
			},
			error: function(){
				console.log("채팅리스트 조회 실패");
			}
		
			
		});
		
		
		
	}
	
	$("#exitChatBtn").on("click",function(){ //채팅방에서 나가는 버튼 클릭했을 때 
		
		chatWS.send("delete");
		
		$("#sidebar2").css("display","none"); //채팅방 숨기기
		$("#sidebar").css("display","block");
		
		
	});
	
	function handleChatMessage(message){
		
			var msg=JSON.parse(message);
			
			
			if('chatContent' in msg){ //메세지가 왔을 때
				
				console.log(msg);
				var str="";
				if(mno==msg.chatSender){ //메세지 보낸 사람이 나일 때
					str+='<div class="chatDiv">'+
					'<span class="myChat float-right">'+msg.chatContent+'</span><br>'+
					'<span class="time float-right">'+msg.chatDate+'</span>';
				
				
						if(msg.readStatus=="N"){ 
							str+='<span class="unread float-right">1</span>';
						}
						str+='</div>';
					
					
				}else{ //메세지 받은 사람이 나일 때
					str+='<div class="chatDiv">'+
					'<span class="otherChat float-left">'+msg.chatContent+'</span><br>'+
					'<span class="time float-left">'+msg.chatDate+'</span></div>';
					
					
					}
				
				$("#chatView").append(str);
		
			}else{
				//빈메세지가 왔을 때 
				//읽음표시 삭제 
				$(".unread").remove();
				
			}
				
		
	}
	chatArea.on("keyup",function(){
		
		var length=$(this).val().length;
		
		
		if(length>0){
			$("#chatSendBtn").removeAttr("disabled");
		}else {
			
			$("#chatSendBtn").attr("disabled","true");
		}
		
		
	});
	$("#chatSendBtn").on("click",function(){
		
		if(chatArea.val().length>198){
			
			alert("채팅은 200자 미만으로 입력해주세요");
			return;
		}
		
		if(!chatArea.val()){
			alert("채팅 내용을 입력해주세요");
			return;
			
		}
			//메세지 보내기
			var jsonChat={chatSender:mno,chatReceiver:mno2,chatContent:chatArea.val()};
			chatWS.send(JSON.stringify(jsonChat));
			chatArea.val("");
			$("#chatView").scrollTop($("#chatView").height());
			
			
		
		
		
	});

	function handleChatRoomMessage(message){
		var msg=JSON.parse(message);
		console.log(msg);
		if(msg.existRoom=="Y"){ //이미 있는 채팅방일때
			
			var list=$("#accordionSidebar").find("li");
			
			for(var i=0;i<list.length;i++){
				
				
				if($(list[i]).data("rno")==msg.cRNO){ //채팅방 목록 발견
					
					$(list[i]).find(".lastChat").html("&nbsp;&nbsp;&nbsp;"+msg.lastChat); //마지막 채팅내용 바꾸기
					
					if(msg.unreadCount>0){
						
						var cnt=$(list[i]).find(".chatUnreadCount").text();
						var newCnt=Number(cnt)+msg.unreadCount;
						$(list[i]).find(".chatUnreadCount").text(String(newCnt));
					}
				}
				
			}
			
		
			
		}else{ //없는 채팅방일때
			//새로 만들어서 붙이기
			str="";
			str+='<li class="nav-item active hoverStyle"  data-rno="'+msg.cRNO+'" data-mno2="'+msg.mno2+'" data-mName="'+msg.mName+'">'+
		   	'<div  class="firstRow color-white"><i class="fas fa-caret-right"></i><span>&nbsp;&nbsp;&nbsp;'+msg.mName+'</span></div>'
			   	+'<div  class="secondRow"> <div class="firstCol"><span class="lastChat">&nbsp;&nbsp;&nbsp; '+msg.lastChat+'</span></div><div class="secondCol"><span class="float-right chatUnreadCount">'+msg.unreadCount+'</span></div></div>'
			   	 
			  +' </li>';
			
			str+='<hr class="sidebar-divider my-0 chatDivider">';
			
			$("#accordionSidebar").append(str);
		}
	}

	
	


		
	

	
	
	



	
	
	


