<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIOFFICE</title>

<!-- Favicon icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/board/assets/images/favicon.ico" type="image/x-icon">

</head>
<!-- [ offline-ui ] start -->
<div class="auth-wrapper maintance">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="text-center" style="text-align:center;">
                    <img src="${pageContext.request.contextPath}/resources/ablePro/assets/images/maintance.png" alt="" class="img-fluid">
                    <h5 class="text-muted my-4">>${ requestScope['javax.servlet.error.message'] }</h5>
                    	<c:if test="${empty sessionScope.loginUser}">
                    <form action="login.do">
                        <button class="btn waves-effect waves-light btn-primary mb-4"><i class="feather icon-refresh-ccw mr-2"></i>Reload</button>
                    </form>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [ offline-ui ] end -->

</body>
</html>