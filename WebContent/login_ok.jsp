<%@page import="com.javalec.ex.BDto.BMemberDto"%>
<%@page import="com.javalec.ex.BDao.MemberDao"%>
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
		alert('로그인 성공');
		window.location.href='index.jsp';
	</script>
	</c:when>
	<c:when test="${check==0 }">
		<script type="text/javascript">
		alert('비밀번호가 틀립니다');
		window.location.href='login.jsp';
	</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		alert('아이디가 존재하지 않습니다');
		window.location.href='login.jsp';
	</script>
	</c:otherwise>
	</c:choose>
</body>
</html>