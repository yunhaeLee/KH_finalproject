<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<!-- Favicon icon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico"
	type="image/x-icon">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico"
	type="image/x-icon">


<style>
#buttons button {
	margin: 5em;
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
}

#buttons {
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

span.txt {
	color: #383A3C;
}

span.txt:hover {
	color: #B8ACD0;
}

:root { -
	-aside-width: 17.625rem;
}

.cate {
	background-color: #B8ACD0;
}

.pagination {
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a.active {
	background-color: rgb(2, 1, 13);
	color: white;
}

a:link {
	color: gray;
	text-decoration: none;
}

a:visited {
	color: gray;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

.bContents:hover {
	background: rgb(250, 250, 250);
}
</style>
</head>

<body class="">

	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />



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
								<li class="breadcrumb-item"><a href="index.jsp"><i
										class="feather icon-home"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- [ breadcrumb ] end -->


<!-- [ Main Content ] 브래드크럽프 밑에 부분 메인시작 -->

<!-- 메인레버 -->
<div id="wrapper">
<!-- 컨텐츠 영역 -->
	<div class="container-fluid">
	<!-- 타이틀 영역 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h3>설문 등록</h3>
			</div>
			<div class="card-body" align="center">
				<div class="warning">
					폭력적이거나 선정적인 문항<br /> 타인의 권리를 침해하거나, 명예를 훼손하는 문항<br /> 개인정보를
					직접적으로 묻는 문항<br /> * 다음 항목에 해당되는 설문항목이 포함되어 있을 시 삭제될 수 있습니다.<br />
					<br /> <br />
				</div>
				<form name="surveyForm" role="form" action="sinsert.so" method="post"
					autocomplete="off" onsubmit="return check();">
					<input type="hidden" class="form-control" value="${loginUser.empNo}"name="surWriter">
					<table class="form-type">
						<tbody>
							<tr>
								<th style="width:13%;">설문 제목</th>
								<td style="width:87%;"><input type="text" id="surTitle" name="surTitle"
									class="form-control"></td>
							</tr><tr>
								<th>설문 기간</th>
								<td><input type="date" id="surEnd" name="surEnd"
									class="form-control form-control-user"></td>
							</tr><tr>
								<th>안내 문구</th>
								<td><textarea  rows="5" class="form-control mb-2 mr-sm-2" 
									id="surContent" name="surContent" ></textarea></td>
							</tr><tr>
								<th>설문 질문</th>
								<td><input type="text" id="surqContent" name="surqContent"
									class="form-control"></td>
							</tr><tr>
								<th>설문 타입</th>
								<td><div class="flexable_info " style="padding:1rem 0.75rem" >
										<select id="surqStatus" name="surqStatus"class="form-select form-select-lg">
											<option value="M">객관식</option>
											<option value="E">주관식</option>
										</select>
									</div></td>
							</tr>
						</tbody>
					</table>
					<br>
					<div id="selectBox">
						<input type="radio" name="surqType" id="Y" value="Y">
                    		<label for="in">중복가능</label> &nbsp;&nbsp;
                    		<input type="radio" name="surqType" id="N" value="N">
                    		<label for="out">불가능</label>
                    		<br>
						<table id="surveySelectBox">
							<tbody>
								<tr>
									<button type="button" id="addq_btn"
										class="btn btn-primary btn-icon-split">
										<b>+</b></button>
								</tr>
								<div class="qbox"></div>	
							</tbody>
						</table>
					</div>
					<!-- 버튼 -->
					<br><br>
					<div>
						<button type="button" onclick="javascript:history.back();"
							class="btn btn-secondary">이전</button>
						<button type="submit" class="btn btn-primary btn-icon-split">작성</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$("#surqStatus").change(function() {
			$("#selectBox").toggle();
			$("input[name='surqType']").prop("checked",false);
			$('.qbox').children().remove();
		});
		
		$('#addq_btn').on('click',function() {
			/*var q = $("<tr><td style='width:80%;'><div class='q'><span>"+(num++)+"</span><input value='' id='surOTitle' name='sur[]' type='text' class='form-control' autocomplete='off'>"+
			"<button type='button' id='minusq_btn' class='btn btn-primary btn-icon-split'><b>x</b></button></div></td></tr>");*/
							var q = $("<tr><td style='width:90%;'><input value='' id='qOption' name='qOption' type='text' class='form-control'></td>"+
							"<td style='width:10%;'><button type='button' id='minusq_btn' class='btn btn-primary btn-icon-split'><b>x</b></button></td></tr>");
							$(this).parent().find('.qbox').append(q);
						});

		$(document).on('click', '#minusq_btn', function() {
			$(this).parents('tr').remove();
		});
		function check(){
			var date = new Date();
			var date1 = new Date($("#surEnd").val());
			var name = document.surveyForm;
			console.log($("#qOption").length);
			console.log($("#qOption").val());
			$("input[name=qOption]").each(function(idx){   
			    var value = $(this).val();
			    console.log(value);
			});
			if(name.surTitle.value==""){
				$(name.surTitle).attr("placeholder","제목을  입력해주세요");
				name.surTitle.focus();
				return false;
			}if(name.surEnd.value==""){
				alert("종료날짜를 선택해주세요.");
				return false;
			}if(date1 < date){
				alert("종료날짜는 오늘 이후로 선택해주세요.");
				return false;
			}if(name.surContent.value==""){
				$(name.surContent).attr("placeholder","내용을  입력해주세요");
				name.surContent.focus();
				return false;
			}if(name.surqContent.value==""){
				$(name.surqContent).attr("placeholder","질문을  입력해주세요");
				name.surqContent.focus();
				return false;
			}if(name.surqStatus.value=="M"){
				if(name.surqType.value==""){
					alert("중복여부를 선택해주세요.");
					return false;
				}if($("#qOption").length <1){
					alert("객관식은 2개이상의 보기가 필요합니다.");
					return false;
				}else{$("input[name=qOption]").each(function(idx){   
						if($(this).val()==""){
							alert((idx+1)+"번째 보기를 입력해주세요.")
							return false;
						}
					});
				}
			}
			return true;
		}
	</script>


</body>
</html>