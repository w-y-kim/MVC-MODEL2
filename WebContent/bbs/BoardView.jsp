<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="vo.Board"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>TableTest</title>
    <style>
        body{
            width: 960px;
        }

        table,tr{
            margin-left: 100px;
            width:80%;
            text-align: center;
        }
        div.control{
            float: right;
            padding: 3px;
            border-radius: 26px;
            border-style: solid;
            background-color: #01e1e9;
            font-size: 20px;
            margin: 0 10px;
        }
        div.control:hover{
            background-color: black;
            font-weight: bold;
            color: white;
        }
        div.button{
            margin-top: 10px;
            margin-right: 100px;
        }

        a{
            text-decoration: none;
        }
        a:hover{
            color: white;
        }
        a:link{
            text-decoration: none;
        }
        ul{
            list-style-type: none;
            margin: 10px 100px;
        }
        li{
            float: left;
        }
        div.reply{
            margin-top: 50px;
            display: block;
            width: inherit;
        }
        input.text{
            margin-left: 120px;
            margin-top: 50px;
            line-height: 50px;
            width: 70%;
        }
        input.btn{
            height: 55px;
            border-style: none;
            background-color: #01e1e9;
        }

    </style>
</head>
<body>
<% 
Board b = (Board)request.getAttribute("view");
int num = b.getBoardnum();
String author = b.getId();
String date = b.getInputdate();
int hit = b.getHits();
String title = b.getTitle();
String content = b.getContent();

request.setAttribute("view", b);
application.setAttribute("view", b);

%>


<table border="1">
    <caption><h1>글읽기 VIEW</h1></caption>
    <col width="20%">
    <col width="80%">
    <tr> <td>번호</td> <td><%=num%></td></tr>
    <tr> <td>작성자</td> <td><%=author%></td></tr>
    <tr> <td>작성일</td> <td><%=date%></td></tr>
    <tr> <td>조회수</td> <td><%=hit%></td></tr>
    <tr> <td>제목</td> <td><%=title%></td></tr>
    <tr> <td height="500px">내용</td> <td><%=content%></td></tr>
</table >
<ul><li><a href=""><  이전글</a>&nbsp;&nbsp;  </li><li>  &nbsp;&nbsp;<a href="">다음글</a> > </li></ul>

<div class="button">
    <div class="control" ><a href="BoardServlet?action=boardlist"> 목록보기 </a></div>
    <div class="control" ><a href="BoardServlet?action=update&num=<%=num%>"> 수정 </a></div>
    <div class="control" ><a href="BoardServlet?action=delete&num=<%=num%>"> 삭제 </a> </div>
</div>
<div class="reply"><input type="text" class="text">&nbsp;<input class="btn" type="button" value="리플달기"></div>

</body>
</html>