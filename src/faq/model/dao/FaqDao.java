package faq.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import faq.model.vo.Faq;
import notice.model.vo.Notice;

public class FaqDao {

	public ArrayList<Faq> selectNotice(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Faq> list = new ArrayList<Faq>();
		String query = "select * from (select rownum as rnum, n.* from (select * from faq order by 1 desc)n)";
		try {
			pstmt = conn.prepareStatement(query);

			rset=pstmt.executeQuery();
			while(rset.next()) {
				Faq f = new Faq();
				f.setfNum(rset.getInt("rnum"));
				f.setFaqNo(rset.getInt("f_num"));
				f.setFaqTitle(rset.getString("f_title"));
				f.setFaqContent(rset.getString("f_content"));
				
				list.add(f);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		
			
		}
		return list;
	}

	public int insertFaq(Connection conn, Faq f) {
		PreparedStatement pstmt= null;
		int result = 0;
		String query="insert into faq values(faq_seq.nextval,?,?)";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Faq selectOneFaq(Connection conn, int faqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Faq f = null;
		String query ="select * from faq where f_num=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, faqNo);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				f= new Faq();
				f.setFaqNo(rset.getInt("f_num"));
				f.setFaqTitle(rset.getString("f_title"));
				f.setFaqContent(rset.getString("f_content"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}

		
		return f;
	}

	public int deleteFaq(Connection conn, int faqNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query ="delete from faq where f_num=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, faqNo);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


}
