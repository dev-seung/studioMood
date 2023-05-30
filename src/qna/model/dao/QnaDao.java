package qna.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import qna.model.vo.Qna;
import qna.model.vo.QnaComment;
import qna.model.vo.QnaPageData;

public class QnaDao {
	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from qna";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return result;
	}

	public ArrayList<Qna> selectList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		String query = "select * from (select rownum as qnum, q.* from (select * from qna order by 1 desc)q) where qnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Qna q = new Qna();
				q.setqNum(rset.getInt("qNum"));
				q.setQnaNo(rset.getInt("q_num"));
				q.setqTitle(rset.getString("q_title"));
				q.setqWriter(rset.getString("q_writer"));
				q.setqDate(rset.getString("q_date"));
				q.setOpenChk(rset.getString("open_chk"));
				list.add(q);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public int insertQna(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into qna values(qna_seq.nextval,?,?,?,to_char(sysdate,'yyyy-mm-dd'),?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			pstmt.setString(3, q.getqWriter());
			pstmt.setString(4, q.getOpenChk());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Qna> qnaSearch(int reqPage, String qTitle, String keyword) {
		PreparedStatement pstmt = null;
		
		return null;
	}

	public int qnaSearchCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from qna where q_title like (?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+keyword+'%');
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result=rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}	
		return result;
	}

	public ArrayList<Qna> qnaSearchList(Connection conn, int start, int end, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		String query = "select * from (select rownum as qnum, q.* from(select * from qna where q_title like (?) order by 1 desc)q) where qnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+keyword+'%');
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Qna q = new Qna();
				q.setqNum(rset.getInt("qNum"));
				q.setQnaNo(rset.getInt("q_num"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setqWriter(rset.getString("q_writer"));
				q.setqDate(rset.getString("q_date"));
				q.setOpenChk(rset.getString("open_chk"));
				list.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public Qna selectQna(Connection conn, int qnaNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from qna where q_num = ?";
		Qna q = new Qna();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qnaNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				q.setQnaNo(rset.getInt("q_num"));
				q.setqTitle(rset.getString("q_title"));
				q.setqWriter(rset.getString("q_writer"));
				q.setqContent(rset.getString("q_content"));
				q.setqDate(rset.getString("q_date"));
				q.setOpenChk(rset.getString("open_chk"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return q;
	}

	public ArrayList<QnaComment> selectQnaCommentList(Connection conn, int qnaNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from qnacoment where qc_ref = ? order by 1";
		ArrayList<QnaComment> list = new ArrayList<QnaComment>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qnaNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				QnaComment qc = new QnaComment();
				qc.setQnaCommentContent(rset.getString("qc_content"));
				qc.setQnaCommentDate(rset.getString("qc_date"));
				qc.setQnaCommentNo(rset.getInt("qc_num"));
				qc.setQnaCommentWriter(rset.getString("qc_writer"));
				qc.setQnaRef(rset.getInt("qc_ref"));
				list.add(qc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public int deleteQna(Connection conn, int qnaNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from qna where q_num=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qnaNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateQna(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update qna set q_title=?, q_content=?, open_chk = ? where q_num=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			pstmt.setString(3, q.getOpenChk());
			pstmt.setInt(4, q.getQnaNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertQnaComment(Connection conn, QnaComment qc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into qnacoment values(qnacoment_seq.nextval,?,?,to_char(sysdate,'yyyy-mm-dd'),?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qc.getQnaCommentWriter());
			pstmt.setString(2, qc.getQnaCommentContent());
			pstmt.setInt(3, qc.getQnaRef());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int qnaCommentDelete(Connection conn, int qnaCommentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from qnacoment where qc_num = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qnaCommentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int qnaCommentUpdate(Connection conn, int qnaCommentNo, String qnaCommentContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update qnacoment set qc_content = ? where qc_num = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qnaCommentContent);
			pstmt.setInt(2, qnaCommentNo);
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

