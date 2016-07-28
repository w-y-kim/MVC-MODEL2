<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.CustomerDAO"%>
<%@ page import="vo.Customer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
	
<body>

	<table
		style="border: 1 px solid black; collapsed-border: collapsed; text-align: center;">
		<tr>
			<td>아이디</td>
			<td>${ID}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${PW}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${NAME}</td>
		</tr>
		<tr>
			<td>메일</td>
			<td>${MAIL}</td>
		</tr>
		<tr>
			<td>구분</td>
			<td>${TYPE}</td>
		</tr>
		<tr>
			<td>인증번호</td>
			<td>${IDNO}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${ADDR}</td>
		</tr>
	</table>
	<br>
	<input type="button" value="확인" onClick="location.href='index.html'">
	<br> 0이면 가입실패, 1이면 가입성공
	<%=result%>


</body>
</html>