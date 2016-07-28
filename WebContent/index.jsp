<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<head>
<meta charset="UTF-8" lang="ko">
<title>SEBANK 메인페이지</title>
<link href="https://fonts.googleapis.com/css?family=Galada"
	rel="stylesheet">

<link rel="stylesheet" href="main.css">
</head>

<body>
	<header id="main_header">

		<hgroup id="title">
			<h1>SEBANK - 모든 돈을 맡겨라</h1>
			<h2>MVC패턴으로 게시판 만들기</h2>
		</hgroup>
		<nav id="main_gnb">
			<!--global navigation bar-->
			<ul>
				<li><a href="CustomerServlet?action=join">가입</a></li>
				<li><a href="CustomerServlet?action=login">로그인</a></li>
				<li><a href="CustomerServlet?action=update">정보수정</a></li>
				<li><a href="CustomerServlet?action=logout">로그아웃</a></li>
				<li><a href="CustomerServlet?action=search">회원조회</a></li>


<!-- 
				<li><a href="join.jsp">가입</a></li>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="check.jsp">로그인체크</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>
				<li><a href="search.jsp">회원조회</a></li>

 -->
 			</ul>
 			<% 
 			String id = (String)session.getAttribute("id"); 
 			if(id != null){
 			%>
 			<div style="background-color: gray;"><%=id%>님 로그인 중 </div>
 			<%}%>
		</nav>
		<nav id="main_lnb">
			<!--local navigation bar-->
			<ul>
				<li><a href="BoardServlet?action=boardlist">HTML5</a></li>
				<li><a href="#">CSS3</a></li>
				<li><a href="#">JS</a></li>
				<li><a href="#">JQuery</a></li>
				<li><a href="#">Node.js</a></li>
			</ul>
		</nav>
	</header>

	<div id="content">
		<section id="main_section">
			<h1>Main section</h1>
			<article class="main_article">
				<h3>article</h3>
				<p>aaaaa</p>
			</article>
			<article class="main_article">
				<h3>article</h3>
				<p>bbb</p>
			</article>
			<article class="main_article">
				<h3>article</h3>
				<p>ccc</p>
			</article>
		</section>

		<aside id="main_aside">

			<input type="radio" id="first" name="tab" checked> <input
				type="radio" id="second" name="tab">
			<section class="buttons">
				<label for="first">First</label> <label for="second">Second</label>
			</section>

			<div class="tab_item">
				<ul>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45x45">
							</div>
							<div class="description">
								<strong>HTML5 Canvas</strong>
								<p>2016-07-15</p>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45x45">
							</div>
							<div class="description">
								<strong>HTML5 Audio</strong>
								<p>2016-07-15</p>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45x45">
							</div>
							<div class="description">
								<strong>HTML5 Video</strong>
								<p>2016-07-15</p>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45x45">
							</div>
							<div class="description">
								<strong>HTML5 Semantic Web</strong>
								<p>2016-07-15</p>
							</div>
					</a></li>

				</ul>
			</div>
			<div class="tab_item">
				<ul>
					<li><a href="#">CSS3 Transition</a></li>
					<li><a href="#">CSS3 Animation</a></li>
					<li><a href="#">CSS3 Border</a></li>
					<li><a href="#">CSS3 Box</a></li>
				</ul>
			</div>

		</aside>
	</div>
	<footer id="main_footer">
		<h3>HTML5 + CSS3 Basic</h3>
		<address>website layout basic</address>
	</footer>

</body>


</html>



