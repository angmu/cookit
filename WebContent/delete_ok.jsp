<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	if(confirm("삭제하시겠습니까?")!=true){
		alert('삭제취소. 이전화면으로 돌아갑니다.');
		window.history.back();
	}else{
		<%
		String btype=request.getParameter("bType");
		request.setAttribute("bType", btype);
		int bnum=Integer.parseInt(request.getParameter("bNum"));
		request.setAttribute("bNum", bnum);		
		%>
		window.location.href='delete_ok.do?bType=${bType}&bNum=${bNum}';
	}
</script>

</body>
</html>