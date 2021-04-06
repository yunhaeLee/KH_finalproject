
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--ContextPath 설정-->

	

		
	<c:if test="${empty sessionScope.loginUser}">
		<jsp:forward page="login.do"></jsp:forward>
	</c:if>
	<c:if test="${!empty sessionScope.loginUser}">
	
			 
<jsp:forward page="WEB-INF/views/common/main.jsp"/>
	
	  </c:if> 

</body>
</html>