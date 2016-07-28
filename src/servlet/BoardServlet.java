package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.Board;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/BoardServlet")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static BoardDAO dao = new BoardDAO();// FIXME 선언해도되나

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());//이거남기면 인코딩에러
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// out.print("<html><body>요청들어옴</body></html>");
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		// out.println(action);

		if (action.equals("boardlist")) {// 게시판리스트 입장
			int cnt = 10;
			// 페이지 이동할 때만 생기고 처음에는 0 (페이지 이동 시 page 쿼리스트링을 넣어야함)
			int page = 0;

			String ppage = request.getParameter("page");
			if (ppage != null) {
				page = Integer.valueOf(ppage);
			}
			// int st = (page - 1) * cnt + 1;
			// int ed = st + cnt;
			// page가 0부터 시작할 때(이전 클릭 시 초기화면에서 url만 0페이지로 넘어가는 문제 있음)
			int st = page * cnt + 1;
			int ed = (page + 1) * cnt;

			ArrayList<Board> list = dao.list(st, ed);
			if (list.isEmpty()) {
				out.println("<script>alert('마지막 페이지입니다.');history.go(-1);</script>");
			} else {
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("/bbs/BoardList.jsp");
				rd.forward(request, response);
			}
		} else if (action.equals("boardwrite")) {
			System.out.println("글쓰기들어옴");
			RequestDispatcher rd = request.getRequestDispatcher("/bbs/BoardWrite.jsp");
			rd.forward(request, response);

		} else if (action.equals("writeUp")) {

			String id = (String) session.getAttribute("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Board board = new Board(0, id, title, content, null, 0);
			int result = dao.write(board);

			if (result != 0) {
				System.out.println("글작성완료");
				// RequestDispatcher rd =
				// request.getRequestDispatcher("/bbs/BoardView.jsp");
				// rd.forward(request, response);
				response.sendRedirect("BoardServlet?action=boardlist");
			} else
				out.println("<html><script>alert('글작성실패');</script></html>");
		} else if (action.equals("view")) {
			int boardnum = Integer.valueOf(request.getParameter("num"));
			Board b = dao.read(boardnum);
			dao.addHits(boardnum);// FIXME 새로고침시마다 실행하는 문제 (세션으로 조건 줘야할 듯)

			// FIXME
			request.setAttribute("view", b);
			System.out.println(b + "setattr  "+request.getAttribute("view"));

			RequestDispatcher rd = request.getRequestDispatcher("/bbs/BoardView.jsp");
			rd.forward(request, response);
		} else if (action.equals("update")) {
			//FIXME 여기서 request는 Boardview.jsp에서 새로 시작된 request, 비어있다.
			session = request.getSession();
			

			String num = request.getParameter("num");
			String id = (String) session.getAttribute("id");
			if (num != null && id != null) {
				int bnum = Integer.valueOf(num);
				//세션에저장
				request.setAttribute("bnum", bnum);
				
				//FIXME 
				// 내가 읽어온 글의 작성자와 비교
				ServletContext ss = request.getServletContext();
				
				
				Board readWriting = (Board) ss.getAttribute("view");
				System.out.println(readWriting + "읽은글"+request.getAttribute("view"));
				String author = readWriting.getId();
				System.out.println(author + "업뎃시 현재글 작성자");
				// 수정권한 있음
				if (id.equals(author)) {
					// UpDate페이지로 포워딩
					RequestDispatcher rd = request.getRequestDispatcher("/bbs/BoardUpdate.jsp");
					rd.forward(request, response);
				} else
					out.println("<script>alert('글작성자만 수정 가능');</script>");

				// String title = readWriting.getTitle();
				// String content = readWriting.getContent();

			} else
				out.println("<script>alert('글수정은 로그인 후 글view에서');history.go(-1);</script>");
		} else if (action.equals("writeUpdate")) {// 수정내용 저장

			// 쿼리스트링에 포함 글번호, 세션포함된 로그인ID
			String num = request.getParameter("num");// FIXME
			int bnum = Integer.valueOf(num);
			String id = (String) session.getAttribute("id");
			// 기존글
			// Board readWriting = (Board) request.getAttribute("view");

			// 새글내용(form태그 통해 전송받음)
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			// 정보조합해 갱신데이터 객체 생성
			Board b = new Board(bnum, id, title, content, null, 0);
			int result = dao.update(b);
			request.setAttribute("view", b);
			if (result != 0) {
				RequestDispatcher rd = request.getRequestDispatcher("/bbs/BoardView.jsp");
				rd.forward(request, response);

			}
			out.println("<script>alert('수정 실패');</script>");

		} else if (action.equals("delete")) {
			String num = request.getParameter("num");// boardview.jsp의 a태그의
														// 쿼리스트링에서 받아오는거여
			if (num != null) {
				int boardnum = Integer.valueOf(num);
				session = request.getSession();
				String loginId = (String) session.getAttribute("id");
				int result = dao.delete(boardnum, loginId);
				if (result != 0) {
					response.sendRedirect("BoardServlet?action=boardlist");
				} else
					out.println("<script>alert('글삭제실패');history.go(-1);</script>");
			} else
				out.println("<script>alert('글삭제는 view페이지에서');history.go(-1);</script>");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
