package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Board;

public class BoardDAO {
	// write
	// List
	// Read
	static final String driver = "oracle.jdbc.driver.OracleDriver";
	static final String db = "jdbc:oracle:thin:@localhost:1521:xe";
	static final String dbid = "hr";
	static final String dbpw = "hr";
	private Connection con;
	private PreparedStatement pstmt;
	private String sql;
	private Board board;

	public BoardDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int write(Board board) {
		int result = 0; 
		
		try {
			con = DriverManager.getConnection(db, dbid, dbpw);
			sql = "insert into board2 values(board2_seq.nextval,?,?,?,sysdate,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getHits());

			result = pstmt.executeUpdate();
//			ResultSet rs = pstmt.executeQuery(); 
//			if(rs.next()){
//				int num = rs.getInt(1);
//				result = num;
//			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return result;
	}

	/**
	 * @param start
	 * @param end
	 * @return
	 */
	public ArrayList<Board> list(int start, int end) {
		ArrayList<Board> boardList = new ArrayList<Board>();
		try {
			con = DriverManager.getConnection(db, dbid, dbpw);
	          sql ="select * from"
	                 + "(select rownum r, b.* from"
	                 + "(select boardnum, id, title, to_char(inputdate, 'YYYY/MM/DD') inputdate, hits from board2 order by boardnum desc)"
	                 + ""
	                 + " b)"
	                 + "where r between ? and ?";
	          
	           
	           pstmt = con.prepareStatement(sql);
	           pstmt.setInt(1,  start);
	           pstmt.setInt(2, end);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int boardnum = rs.getInt(2);
				String id = rs.getString(3);
				String title = rs.getString(4);
				String inputdate = rs.getString(5);
				int hits = rs.getInt(6);
				board = new Board(boardnum, id, title, null, inputdate, hits);
				boardList.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return boardList;
	}

	// 게시판 글 읽기
	public Board read(int boardnum) {
		Board board = null;
		try {
			con = DriverManager.getConnection(db, dbid, dbpw);
			sql = "select * from board2 where boardnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardnum);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String inputdate = rs.getString(5);
				int hits = rs.getInt(6);
				board = new Board(boardnum, id, title, content, inputdate, hits);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return board;

	}

	// 조회수 증가
	public void addHits(int boardnum) {
		try {
			con = DriverManager.getConnection(db, dbid, dbpw);
			sql = "update board2 set hits=hits+1 where boardnum=?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, boardnum);
			pstmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

	}

	// 글 수정
	public int update(Board board) {
		int result = 0;

		try {
			con = DriverManager.getConnection(db, dbid, dbpw);
			sql = "update board2 set title=?, content=? where boardnum=? AND id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getBoardnum());
			pstmt.setString(4, board.getId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return result;
	}

	// 글 삭제
	public int delete(int boardnum, String loginId) {
		int result = 0;

		try {
			con = DriverManager.getConnection(db, dbid, dbpw);
			sql = "delete from board2 where boardnum=? AND id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardnum);
			pstmt.setString(2, loginId);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return result;

	}

}
