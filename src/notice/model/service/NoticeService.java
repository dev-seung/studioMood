package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;
import notice.model.vo.NoticeViewData;

public class NoticeService {

	public NoticePageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		NoticeDao dao = new NoticeDao();
		
		int totalCount = dao.totalCount(conn);	//총 게시물 수를 구하는 dao
		int numPerPage = 20;					// 한페이지당 게시물 수
		int totalPage = 0;						//전체 페이ㅅ지수
		if(totalCount%numPerPage==0) {			//나머지가 0이면
			totalPage = totalCount/numPerPage;
		}else {									//나머지가 0이아니면
			totalPage = totalCount/numPerPage+1;
		}
		
		int start=(reqPage-1)*numPerPage+1;
		int end=reqPage*numPerPage;
		ArrayList<Notice> list = dao.selectList(conn,start, end);
		
		int pageNaviSize=5;
		String pageNavi="";
		
		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo!=1) {
			pageNavi+="<li class='page-item'><a class='page-link' href='/noticeList?reqPage="+(pageNo-1)+"'>이전</a></li>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage==pageNo) {
				pageNavi+="<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span></li>";
			}else {
				pageNavi +="<li class='page-item'><a class='page-link' href='/noticeList?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
			
		}
		if(pageNo<=totalPage) {
			pageNavi+="<li class='page-item'><a class='page-link' href='/noticeList?reqPage="+pageNo+"'>다음</a></li>";
		}
		NoticePageData npd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		
		return npd;
	}

	public NoticeViewData selectNoticeView(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = new NoticeDao().selectOneNotice(conn,noticeNo);
		
		JDBCTemplate.commit(conn);
		
		NoticeViewData nvd = new NoticeViewData(n);
		return nvd;
	}

	public int insertNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().insertNotice(conn,n);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		JDBCTemplate.close(conn);
		return result;
	}

//	public ArrayList<Notice> searchKeyword(String keyword) {
//		Connection conn = JDBCTemplate.getConnection();
//		ArrayList<Notice> list = null;
//		
//		list = new NoticeDao().searchKeyword(conn,keyword);
//		
//		JDBCTemplate.commit(conn);
//		return list;
//	}

	public NoticePageData searchList(int reqPage, String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		NoticeDao dao = new NoticeDao();
		
		int totalCount = dao.searchCount(conn,keyword);	//총 게시물 수를 구하는 dao
		int numPerPage = 20;					// 한페이지당 게시물 수
		int totalPage = 0;						//전체 페이ㅅ지수
		if(totalCount%numPerPage==0) {			//나머지가 0이면
			totalPage = totalCount/numPerPage;
		}else {									//나머지가 0이아니면
			totalPage = totalCount/numPerPage+1;
		}
		
		int start=(reqPage-1)*numPerPage+1;
		int end=reqPage*numPerPage;
		ArrayList<Notice> list = dao.searchList(conn,start, end, keyword);
		
		int pageNaviSize=5;
		String pageNavi="";
		
		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo!=1) {
			pageNavi+="<li class='page-item'><a class='page-link' href='/searchKeyword?reqPage="+(pageNo-1)+"&keyword="+keyword+"'>이전</a></li>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage==pageNo) {
				pageNavi+="<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span></li>";
			}else {
				pageNavi +="<li class='page-item'><a class='page-link' href='/searchKeyword?reqPage="+pageNo+"&keyword="+keyword+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
			
		}
		if(pageNo<=totalPage) {
			pageNavi+="<li class='page-item'><a class='page-link' href='/searchKeyword?reqPage="+pageNo+"&keyword="+keyword+"'>다음</a></li>";
		}
		NoticePageData npd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		
		return npd;
	}
	public Notice selectOneNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = new NoticeDao().selectOneNotice(conn,noticeNo);
		if(n!=null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return n;
	}

	public int deleteNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result=new NoticeDao().deleteNotice(conn,noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().updateNotice(conn, n);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
