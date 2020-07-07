<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${check==1 }">
	<script type="text/javascript">
		alert('회원가입 성공');
		window.location.href='index.jsp';
	</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		alert('가입실패, 이전화면으로 돌아갑니다');
		window.history.back();
	</script>
	</c:otherwise>
	</c:choose>
</body>
</html>