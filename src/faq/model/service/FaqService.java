package faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import faq.model.dao.FaqDao;
import faq.model.vo.Faq;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class FaqService {

	public ArrayList<Faq> selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Faq> list = new FaqDao().selectNotice(conn);
		if(!list.isEmpty()) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertFaq(Faq f) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FaqDao().insertFaq(conn,f);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Faq selectOneFaq(int faqNo) {
		Connection conn = JDBCTemplate.getConnection();
		Faq f = new FaqDao().selectOneFaq(conn,faqNo);
		if(f!=null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		JDBCTemplate.close(conn);
		return f;
	}

	public int deleteFaq(int faqNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FaqDao().deleteFaq(conn,faqNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
