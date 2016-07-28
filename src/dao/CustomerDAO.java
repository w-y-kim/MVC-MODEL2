package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Customer;

public class CustomerDAO {
	static final String driver = "oracle.jdbc.driver.OracleDriver";
	static final String db = "jdbc:oracle:thin:@localhost:1521:XE";
	static final String dbid = "hr";
	static final String dbpw = "hr";

	private Connection con;

	static {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insert(Customer c) {
		int cnt = 0;
		try {
			con = DriverManager.getConnection(db, dbid, dbpw);

			String sql = "insert into Customer values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c.getCustid());
			pstmt.setString(2, c.getPassword());
			pstmt.setString(3, c.getName());
			pstmt.setString(4, c.getEmail());
			pstmt.setString(5, c.getDivision());
			pstmt.setString(6, c.getIdno());
			pstmt.setString(7, c.getAddress());

			cnt = pstmt.executeUpdate();

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

		return cnt;
	}
	public Customer idCheck(String id){
		System.out.println("체크시작");
		Customer result=null; 
		try {
			con = DriverManager.getConnection(db, dbid, dbpw);
		
			String sql = "select * from customer where custid = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(id+"아이디");
			System.out.println("1");
			ResultSet rs = pstmt.executeQuery();
			System.out.println("2");
			
			if(rs.next()){
				System.out.println("쿼리실행됨");
				String cusid = rs.getString("custid"); 
				result = new Customer(cusid,null,null,null,null, null, null);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(con!=null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return result; 
	}

	public int login(String coustid, String pwssword) {
		int cnt = 0;
		try {
			con = DriverManager.getConnection(db, dbid, dbpw);

			String sql = "select * from customer where custid = ? AND password=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, coustid);
			pstmt.setString(2, pwssword);

			cnt = pstmt.executeUpdate();
//			ResultSet rs = pstmt.executeQuery();

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

		return cnt;

	}
	public int update(Customer c){
		int result = 0;
		System.out.println(c);
		try {
			con = DriverManager.getConnection(db,dbid,dbpw);
			String sql = "update customer set password=?, name=?, email=?, division=?, idno=?, address=? where custid = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c.getPassword());
			pstmt.setString(2, c.getName());
			pstmt.setString(3, c.getEmail());
			pstmt.setString(4, c.getDivision());
			pstmt.setString(5, c.getIdno());
			pstmt.setString(6, c.getAddress());
			pstmt.setString(7, c.getCustid());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(con!=null){con.close();}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		
		return result;
	}

	public ArrayList<Customer> list() {
		ArrayList<Customer> list = new ArrayList<Customer>();

		try {
			con = DriverManager.getConnection(db, dbid, dbpw);

			String sql = "select * from customer";
			PreparedStatement pstmt = con.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("custid");
				String pw = rs.getString("password");
				String name = rs.getString("name");
				String mail = rs.getString("email");
				String division = rs.getString("division");

				Customer c = new Customer(id, pw, name, mail, division, null, null);
				list.add(c);
				for (Customer customer : list) {
					
				}
			}

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

		return list;

	}

}