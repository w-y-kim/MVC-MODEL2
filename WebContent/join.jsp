<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
	list-style-type: none;
}

li label {
	text-align: left;
	padding-left: 0px;
	padding-right: 30px;
}

input[type=submit], input[type=reset] {
	margin-top: 10px;
	text-align: center;
	font-size: 20px;
}

li input {
	
}
</style>
<script type="text/javascript">


	function check() {
		var id = document.getElementById('custid');
		var pw = document.getElementById('pw');
		var pw2 = document.getElementById('pw2');
		var idln = id.value.length;
		var pwln = pw.value.length;
		var pwln2 = pw2.value.length;

		alert(pw.value + '/' + pw2.value);

		//            if(idln >=3 && idln <=10){
		//            if(idln < 3 || idln > 10){
		if (!(idln >= 3 && idln <= 10)) {
			alert("아이디 길이는 3~10 사이");
			id.focus();
			id.select();
			return false;
		}
		if (!(pwln >= 3 && pwln <= 10)) {
			alert("패스워드 길이는 3~10 사이");
			return false;
		}
		if (pw.value != pw2.value) {
			alert("비밀번호 불일치");
			pw.focus();
			pw.select();
			return false;
		}

	}
	/* 중복확인창열기 */
	function idCheck() {
		alert("중복확인");
		var id = document.getElementById("custid").value; //TODO name속성으로 가져오면 안되는 이유는? 
/* 
				window.open("idCheck.jsp", "아이디체크", 'scrollbars=no,width=400,height=300,status=no,resizable=no');
		
 */ 
 /*get방식? 쿼리스트링으로 id 필드입력값 보낸다.*/
		window.open("idCheck.jsp?checkedID=" + id + "", "a", "width=400, height=300, left=100, top=50");

  }
</script>

</head>
<body>
	<form action="CustomerServlet?action=joinResult" method="post"
		onsubmit="return check()">
		<fieldset>
			<legend>회원가입</legend>
			<ul>
				<li><label for="custid">고객 ID</label><input name="custid"
					autofocus type="text" id="custid" placeholder="ID를 3~10자로 입력">
					<input type="button" onClick="idCheck()" value="ID체크"></li>
				<li><label for="pw">비밀번호</label><input name="pw"
					type="password" id="pw" placeholder="Password를 3~10자로 입력"></li>
				<li><label for="pw2">비밀번호 확인</label><input type="password"
					id="pw2" placeholder="비밀번호를 다시 입력"></li>
				<li><label for="name">이름</label><input name="name" type="text"
					id="name" placeholder="이름 입력"></li>
				<li><label for="mail">E-mail</label><input name="mail"
					type="mail" id="mail" placeholder="E-mail 주소입력"></li>
				<li><label for="ty">구분</label> <input type="radio" name="rd"
					value="private" id="ty" checked> 개인 <input type="radio"
					name="rd" value="corporate"> 법인</li>
				<li><label for="identify">식별번호</label><input name="identify"
					id="identify" type="rd" placeholder="개인:주민번호/ 법인:사업자번호"></li>
				<li><label for="addr">주소</label><input name="addr" id="addr"
					type="rd" placeholder="주소"></li>
				<li><input type="submit" value="가입">&nbsp;<input
					type="reset" value="다시 쓰기"></li>
			</ul>
		</fieldset>
	</form>
</body>
</html>