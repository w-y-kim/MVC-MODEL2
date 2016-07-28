<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="CustomerServlet?action=loginResult" method="post">
아이디 : <input type="text" name="id" id="id"><br><br>
비번 : <input type="text" name="pw" id="pw"><br><br>

<input type="submit">
<input type="button" value="뒤로가기" onClick="location.href='index.html'">
</form>

</body>
</html>