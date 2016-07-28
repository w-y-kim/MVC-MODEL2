package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDAO;
import vo.Customer;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CustomerDAO dao = new CustomerDAO();
	private HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html><body>요청들어옴</body></html>");

		String action = request.getParameter("action");
		out.println(action);

		// 가입폼보내기 
		if (action.equals("join")) {
			RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
			rd.forward(request, response);
			// response.sendRedirect("join.jsp");//이 방식을 쓰면 jsp페이지가 그대로 노출된다.
			// 페이지정보도 못가져옴
		} else if (action.equals("joinResult")) {// 가입결과
			String custid = request.getParameter("custid");
			String password = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("mail");
			String division = request.getParameter("rd");
			String idno = request.getParameter("identify");
			String address = request.getParameter("addr");

			Customer cus = new Customer(custid, password, name, email, division, idno, address);
			//
			// request.setAttribute("ID", custid);
			// request.setAttribute("PW", password);
			// request.setAttribute("NAME", name);
			// request.setAttribute("MAIL", email);
			// request.setAttribute("TYPE", division);
			// request.setAttribute("IDNO", idno);
			// request.setAttribute("ADDR", address);
			//
			int result = dao.insert(cus);

			if (result == 0) {
				out.println("<html><body><script>alert('저장실패');</script></body></html>");
				// 뒤로 한번 돌아가기 -1
				out.println("<html><body><script>history.go(-1);</script></body></html>");
			} else {
				out.println("<html><body><script>alert('가입완료');location.href='index.jsp';</script></body></html>");
			}

		} else if (action.equals("idCheck")) {// 아이디중복확인
			String id = request.getParameter("checkedID");
			Customer c = dao.idCheck(id);
			// response.
			String cid = null;
			if (c != null) {
				cid = c.getCustid();
				System.out.println("아이디체크 : " + cid);
				request.setAttribute("id", cid);// 중복되는 경우 아이디를 반환
			}
			RequestDispatcher rd = request.getRequestDispatcher("idCheck.jsp");
			rd.forward(request, response);// 데이터넘겨줌 ,post 방식임 ,idCheck에서 방식따라
											// 분기처리해서 띄움
		} else if (action.equals("login")) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else if (action.equals("loginResult")) {//로그인제어 
			String id = request.getParameter("id"); 
			String pw = request.getParameter("pw"); 
			
			int result = dao.login(id, pw);
			if (result == 0) {
				out.println("<html><body><script>alert('로그인실패');</script></body></html>");
				// 뒤로 한번 돌아가기 -1
				out.println("<html><body><script>history.go(-1);</script></body></html>");
			} else {
				session = request.getSession();
				session.setAttribute("id", id);
				out.println("<html><body><script>alert('"+id+" 님을 환영합니다.');location.href='index.jsp';</script></body></html>");
			}
			
		} else if (action.equals("logout")) {//로그아웃제어 
				session.invalidate();//FIXME 세션종료 , 로그아웃전에 서버재시동하면 브라우저에 세션 혼자 남는 문제 있는 듯(index서 id이름안지워짐)
				out.println("<html><body><script>location.href='index.jsp';</script></body></html>");//뒤로 
		
		
		} else if (action.equals("update")) {//업데이트폼
			String id = (String) session.getAttribute("id");//FIXME 세션값이 없으면 널뜸 
			request.setAttribute("id", id);//세션에서 찾은 접속자 아이디값 리퀘스트에 저장 
			RequestDispatcher rd = request.getRequestDispatcher("updateForm.jsp");
			rd.forward(request, response);
			
		} else if (action.equals("updateResult")) {//업데이트제어 
			String custid = (String) session.getAttribute("id");//세션에서 받아올 필요가 있나...오버헤드만 발생하지
			String password = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("mail");
			String division = request.getParameter("rd");
			String idno = request.getParameter("identify");
			String address = request.getParameter("addr");

			Customer cus = new Customer(custid, password, name, email, division, idno, address);
			int result = dao.update(cus);

			if (result == 0) {
				out.println("<html><body><script>alert('저장실패');</script></body></html>");
				// 뒤로 한번 돌아가기 -1
				out.println("<html><body><script>history.go(-1);</script></body></html>");
			} else {
				out.println("<html><body><script>alert('수정완료');location.href='index.jsp';</script></body></html>");
			}
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
