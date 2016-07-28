<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Boolean check = false;
		check = (Boolean) session.getAttribute("login_result");
		if (check != null && check.equals(true)) {
			session.removeAttribute("login_result");//세션정보삭제
			System.out.println("로그아웃성공");
	%>
	로그아웃 되었습니다.

	<%
		out.println("<html><body><script>alert('메인이동');location.href='index.html';</script></body></html>");
		} else {
			System.out.println("로그아웃실패");
	%>
	로그인을 안되어 있군요.
	<%
		out.println("<html><body><script>alert('메인이동');location.href='index.html';</script></body></html>");

			//response.sendRedirect("index.html"); 

		}
	%>
</body>
</html>