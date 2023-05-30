package qna.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import common.JDBCTemplate;
import qna.model.dao.QnaDao;
import qna.model.vo.Qna;
import qna.model.vo.QnaComment;
import qna.model.vo.QnaPageData;
import qna.model.vo.QnaViewData;

public class QnaService {

	public QnaPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		QnaDao dao = new QnaDao();
		int totalCount = dao.totalCount(conn);
		int numPerPage = 20;
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount/ numPerPage+1;
		}
		int start = (reqPage-1)*numPerPage +1;
		int end = reqPage*numPerPage;
		System.out.println("start : "+start);
		System.out.println("end : "+end);
		ArrayList<Qna> list = new QnaDao().selectList(conn, start, end);
		
		System.out.println("service "+list.size());
		int pageNaviSize = 5;
		String pageNavi = "";
		
		int pageNo = reqPage-2;
		if(reqPage<=3) {
			pageNo=1;
		}else if(pageNo>totalPage-4) {
			pageNo = totalPage-4;
		}
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/qnaList?reqPage="+(pageNo-1)+"'>이전</a></li>";
		}
		for(int i = 0; i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span></li>";
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/qnaList?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/qnaList?reqPage="+pageNo+"'>다음</a></li>";
		}
		
		QnaPageData qpd = new QnaPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return qpd;
	}

	public int insertQna(Qna q) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaDao().insertQna(conn, q);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public QnaPageData qnaSearch(int reqPage, String qTitle, String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Qna> list = null;
		QnaPageData qpd = null;
		
		int totalCount = new QnaDao().qnaSearchCount(conn, keyword);
		int numPerPage = 20;
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage+1;
		}
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		ArrayList<Qna> qnaSearchList = new QnaDao().qnaSearchList(conn, start, end, keyword);
		
		int pageNaviSize = 5;
		String pageNavi = "";
		
		int pageNo = reqPage-2;
		if(reqPage<=3) {
			pageNo=1;
		}else if(pageNo>totalPage-4) {
			pageNo = totalPage-4;
		}
		if(pageNo != 1) {
			pageNavi +="<li class='page-item'><a class='page-link' href='/qnaSearchKeyword?reqPage="+(pageNo-1)+"&keyword="+keyword+"'>이전</a></li>";
		}
		for(int i = 0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span></li>";
			}else {
				pageNavi +="<li class='page-item'><a class='page-link' href='/qnaSearchKeyword?reqPage="+pageNo+"&keyword="+keyword+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/qnaSearchKeyword?reqPage="+pageNo+"&keyword="+keyword+"'>다음</a></li>";
		}
		qpd = new QnaPageData(qnaSearchList, pageNavi);
		return qpd;
	}

	public QnaViewData selectQnaView(int qnaNo) {
		Connection conn = JDBCTemplate.getConnection();
		Qna q = new QnaDao().selectQna(conn, qnaNo);
		ArrayList<QnaComment> list = new QnaDao().selectQnaCommentList(conn, qnaNo);
		JDBCTemplate.close(conn);
		QnaViewData qvd = new QnaViewData(q, list);
		return qvd;
	}

	public Qna selectOneQna(int qnaNo) {
		Connection conn = JDBCTemplate.getConnection();
		Qna q = new QnaDao().selectQna(conn, qnaNo);
		if(q != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return q;
	}

	public int deleteQna(int qnaNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaDao().deleteQna(conn, qnaNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateQna(Qna q) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaDao().updateQna(conn,q);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertQnaComment(QnaComment qc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaDao().insertQnaComment(conn, qc);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int qnaCommentDelete(int qnaCommentNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaDao().qnaCommentDelete(conn, qnaCommentNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int qnaCommentUpdate(int qnaCommentNo, String qnaCommentContent) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaDao().qnaCommentUpdate(conn, qnaCommentNo, qnaCommentContent);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
