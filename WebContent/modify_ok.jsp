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
		alert("글 수정이 완료되었습니다.");
		window.location.href='boardlist.do?bType=${bType}&bNum=${bNum}';
	</script>  	
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		alert("수정실패");
		window.history.back();
	</script>  	
	</c:otherwise>
	</c:choose>
</body>
</html>