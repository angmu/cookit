<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>아이디 중복체크...</title>
    <script type="text/javascript" src="js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="js/signpop.js"></script>
</head>
<body>
<h1>아이디 중복체크</h1>
<form action="id_check.do" name="form">
    <p>4~16자리의 영문, 숫자, 특수기호(_)만 사용하실 수 있습니다.<br>
        첫 글자는 영문으로 입력해 주세요.</p>
    <input type="text" name="ch_id" id="ch_id" value="${id_ch }"/>
    <input type="button" value="아이디 확인" onclick="id_check_db()"/><br/>
   	<c:if test="${check!=null }">
   	<c:choose>
   		<c:when test="${check==1 }">
		    <p id="ch_text">중복된 아이디가 있습니다.</p>
   		</c:when>
   		<c:when test="${check==0 }">
		    <p id="ch_text">아이디 사용가능</p>
   		</c:when>
   	</c:choose>
   	</c:if>
   	<p id="ch_text"></p>
    <br/>
    <input type="button" value="아이디 사용하기" onclick="join_datainput(${check},'${id_ch }')"/>
</form>
</body>
</html>
