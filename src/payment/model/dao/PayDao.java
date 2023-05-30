package payment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import common.JDBCTemplate;
import payment.model.vo.Pay;

public class PayDao {

	public Pay selectPayInfo(Connection conn, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Pay p = new Pay();
		String query = "select concept,cutnum,phone from reserve where phone = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				
				p.setConcept(rset.getString("concept"));
				p.setCutNum(rset.getInt("cutnum"));
				p.setPhone(rset.getString("phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return p;
	}

	public int payCheck(Connection conn, String phone) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update reserve set r_check = 'Y' where phone =? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}


	

	
}


