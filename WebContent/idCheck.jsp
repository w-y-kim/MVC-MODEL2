<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="vo.Customer"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>


	function idSelected(id) {
		//아이디값 부모의 필드로 내보냄 
		alert(opener.document.getElementById("custid").value);
		opener.document.getElementById("custid").value = id;//getElementsById 했다가 디버깅지옥
		self.close();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	//팝업창의 URL의 id값을 필드에 넣어주기 위한 
	//서블릿에서 forward로 넘겨준 request 다시 받음 
	String inputID = request.getParameter("checkedID");
	System.out.println("리퀘스트 : " + inputID);
	String returnID = (String) request.getAttribute("id");
	System.out.println("리턴 : " + returnID);
%>
<body>
	<form action="CustomerServlet?action=idCheck" method="post">
		<!-- post방식으로 보내는 경우는 form태그 안의 value가 들어가기 때문에 hidden을 써주어야 한다 -->
		<!-- <input type="hidden" name="action" value="idCheck"> -->
		<h1>ID체크</h1>
		<!-- <input type="hidden" name="action" value="idCheck"> -->
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="checkedID" value="<%=inputID%>"></td>
				<td rowspan="1"><input type="submit" value="확인"></td>
			</tr>

			<%
				boolean methodCheck = request.getMethod().equalsIgnoreCase("post");
				if (methodCheck && returnID == null) {
			%>
			<tr>
				<td>확인결과</td>
				<td><%=inputID%> 사용가능</td>
				<td rowspan="1"><input type="submit" value="사용"
					onClick="idSelected('<%=inputID%>')"></td>
			</tr>
			<%
				} else if (methodCheck && returnID != null) {
			%>

			<tr>
				<td>확인결과</td>
				<td>${id}는 사용할 수 없습니다.</td>

			</tr>
			<%
				}
			%>
		</table>
	</form>
</body>
</html>
