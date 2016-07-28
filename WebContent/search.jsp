<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.CustomerDAO , vo.Customer, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, td {
	border: 1px solid black;
	collapsed-border: collapsed;
}
table{
	margin: 10px 10px;
	width:80%; 
}
th{
	background-color: gray; 
}
td{
	text-align: center;
	font-size: 20px; 
}
</style>
</head>
<body>
<table>
<tr>
<th>아이디</th><th>패스워드</th><th>이름</th><th>메일</th><th>부서</th>
</tr>
<% 
CustomerDAO dao = new CustomerDAO(); 
ArrayList<Customer> list = dao.list(); 

for(Customer c : list){
	String id = c.getCustid();
	String pw = c.getPassword();
	String name = c.getName();
	String mail = c.getEmail();
	String division = c.getDivision();
	
	request.setAttribute("id", id);
	request.setAttribute("pw", pw);
	request.setAttribute("name", name);
	request.setAttribute("mail", mail);
	request.setAttribute("division", division);
%>
<tr>
<td>${id}</td><td>${pw}</td><td>${name}</td><td>${mail}</td><td>${division}</td>
</tr>

<%}%>
</table>
</body>
</html>