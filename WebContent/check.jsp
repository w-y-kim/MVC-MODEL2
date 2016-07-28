<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
	<%
		Boolean check = false;
		check = (Boolean) session.getAttribute("login_result");
		if (check != null && check.equals(true)) {
	%>
	이미 로그인하고 계시오
	<%
	out.println("<script>alert('메인으로');location.href = 'index.html';</script>");
		} else {
	%>
	로그인을 안하고 있군요. 
	<%
	
	out.println("<script>alert('메인으로');location.href = 'index.html';</script>");
		}
	%>
</body>
</html>