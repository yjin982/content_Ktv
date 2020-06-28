package pack.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberMgr {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public MemberMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("MemberMgr err : " + e);
		}
	}
	
	
	public MemberBean getMember(String gogek_id) { 
		MemberBean bean = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from ktv_gogek where gogek_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gogek_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new MemberBean();
				bean.setGogek_code(rs.getString("gogek_code"));
				bean.setGogek_id(rs.getString("gogek_id"));
				bean.setGogek_pw(rs.getString("gogek_pw"));
				bean.setGogek_birth(rs.getString("gogek_birth"));
				bean.setGogek_regdate(rs.getString("gogek_regdate"));
				bean.setGogek_cash(rs.getString("gogek_cash")); 
				}
		} catch (Exception e) {
			System.out.println("getMember err : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return bean;
	}
	
	public boolean memberUpdate(MemberBean bean, String gogek_id) {
		boolean b = false;
		try {
			System.out.println("고객 수정---" + bean.getGogek_pw());
			conn = ds.getConnection();
			String sql = "update ktv_gogek set gogek_pw=?,gogek_birth=? where gogek_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getGogek_pw());
			pstmt.setString(2, bean.getGogek_birth());
			pstmt.setString(3, gogek_id);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("memberUpdate err : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
		}catch (Exception e2) {
			// TODO: handle exception
		}
	}
		return b;
	}
	
	public boolean cashUpdate(MemberBean bean, String gogek_cash) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "update ktv_gogek set gogek_cash=? where gogek_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gogek_cash);
			pstmt.setString(2, bean.getGogek_id());
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("cashUpdate err : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
			
		return b;
	}
	
	public boolean memberDelete(MemberBean bean, String gogek_id) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "Delete from ktv_gogek where gogek_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gogek_id);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("memberDelete err : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
		}catch (Exception e2) {
			// TODO: handle exception
		}
	}
		return b;
	} 
}
