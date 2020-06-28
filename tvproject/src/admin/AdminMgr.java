package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public AdminMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("AdminMgr err : " + e);
		}
	}
	
	// 관리자 로그인
	public boolean adminLoginCheck(String adminid, String adminpw) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "select * from ktv_admin where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminid);
			pstmt.setString(2, adminpw);
			rs = pstmt.executeQuery();
			if(rs.next()) b=true;
		} catch (Exception e) {
			System.out.println("adminLoginCheck err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
}



