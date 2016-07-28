<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.BoardDAO, vo.Board, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>TableTest</title>
<style>
table, tr {
	margin-left: 100px;
	width: 80%;
	text-align: center;
}

div.control {
	float: right;
	padding: 3px;
	border-radius: 26px;
	border-style: solid;
	background-color: #01e1e9;
	font-size: 20px;
	margin: 0 10px;
}

div.control:hover {
	background-color: black;
	font-weight: bold;
	color: white;
}

div.button {
	margin-top: 10px;
	margin-right: 100px;
}

a {
	text-decoration: none;
}

.control > a:hover {
	color: white;
}

a:link {
	text-decoration: none;
}

ul {
	list-style-type: none;
	margin: 10px 100px;
}

li {
	float: left;
}
</style>
</head>
<body>


	<table border="1">
		<caption>
			<h1>게시판</h1>
		</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<%
			ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");

			//dao.list가 빈배열이 기본값이니 null일 일은 없을 듯 
			if (list != null) {
				for (Board b : list) {
					int num = b.getBoardnum();
					String title = b.getTitle();
					String author = b.getId();
					int hit = b.getHits();
					String date = b.getInputdate();
		%>
		<tr>
			<td><%=num%></td>

			<td><a href="BoardServlet?action=view&num=<%=num%>"><%=title%></a></td>
			<td><%=author%></td>

			<td><%=hit%></td>
			<td><%=date%></td>
		</tr>
		<%
			}
			}
		%>
		
<%
   String spage = request.getParameter("page");
   int ipage =1;
   if (spage != null) ipage = Integer.parseInt(spage);
   
%>

	</table>
	<ul>
		<li><a href="BoardServlet?action=boardlist&page=<%=ipage -1 %>">< 이전글</a>&nbsp;&nbsp;</li>
		<li>&nbsp;&nbsp;<a href="BoardServlet?action=boardlist&page=<%=ipage +1 %>">다음글</a> >
		</li>
	</ul>

	<div class="button">
		<div class="control">
			<a href="BoardServlet?action=boardwrite"> 글쓰기 </a>
		</div>
		<div class="control">
			<a href="BoardServlet?action=delete"> 글삭제 </a>
		</div>
		<div class="control">
			<a href="BoardServlet?action=update"> 글수정 </a>
		</div>
	</div>

</body>
</html>