<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

            border: 1px solid black;
            border-collapse: collapse;
        }
        td{
            overflow: hidden;
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
        textarea{
            display: block;
            width: 100%;
            height: 100%;
            border-style: none;
        }
        input.title{
            width: 100%;
            height: 100%;
            font-weight: bold;
            font-size: 20px;
        }
        input.submit{
			border-style: none;
			background-color: rgba(0,0,0,0);
        }
		input.submit:hover{
			color: aqua;
		}

    </style>
</head>
<body>

<form method="post" action="BoardServlet?action=writeUp">
<table>

    <caption><h1>글읽기 VIEW</h1></caption>
    <col style="background-color: grey" width="20%">
    <col width="80%">

    <tr> <td>제목</td> <td><input class="title" type="text" name="title"></td></tr>
    <tr> <td height="500px">내용</td> <td><textarea name="content" id="" cols="30" rows="10"></textarea></td></tr>
</table >
<ul><li><a href=""><  이전글</a>&nbsp;&nbsp;  </li><li>  &nbsp;&nbsp;<a href="">다음글</a> > </li></ul>

<div class="button">
    <div class="control" ><input class="submit" type="submit" value="등록"></input></div>
</div>

<div class="reply"><input type="textarea" class="text">&nbsp;<input class="btn" type="button" value="리플달기"></div>
</form>
</body>
</html>