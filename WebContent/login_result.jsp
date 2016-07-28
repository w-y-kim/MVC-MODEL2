<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.CustomerDAO"%>
<%
	//세션불러와 인식 
	Boolean check = false;
	check = (Boolean)session.getAttribute("login_result"); 
	
	System.out.println(check + " 세션존재여부"); 
if(check==null){

	String custid = request.getParameter("id");
	String password = request.getParameter("pw");

	CustomerDAO dao = new CustomerDAO();
	int result = dao.login(custid, password);

	/*
	//쿠키생성 : 사용자마다 설정이 다르므로 사용이 껄끄럽다 
	Cookie cookie = new Cookie("ID", custid);//로그인 시마다 새로운 쿠키 생성 
	cookie.setMaxAge(3600);//담기전에 수명 설정 
	cookie.setPath("/index.html");//인덱스만 쿠키값을 받음 
	response.addCookie(cookie);//HTTP응답메시지와 함께 보냄 
	*/
	
	System.out.println(result + " 결과"); 
	
	if (result == 0) {//로그인실패 
		out.println("<html><body><script>alert('로그인정보 없음');</script></body></html>");
		// 뒤로 한번 돌아가기 -1
		out.println("<html><body><script>history.go(-1);</script></body></html>");
	} else {//로그인성공
		//세션저장 : 서버에 저장되기 때문에 사용이 용이
		/* 	
		HttpSession session = request.getSession();//세션가져옴, jsp에는 내장변수 있어서 불필요 
		 */
		session.setAttribute("login_result", true);//로그인 결과 저장함 (재로그인, 로그아웃, 회원조회 등에서 사용)

		out.println("<html><body><script>alert('로그인완료');location.href='index.html';</script></body></html>");
	}
}else{//세션이 있을 때 
	// 뒤로 한번 돌아가기 -1
	System.out.println("중복로그인");
	out.println("<html><body><script>alert('이미 로그인 중 \\n 본 결과는 세션으로 구분합니다.');location.href='index.html';</script></body></html>");
} 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>