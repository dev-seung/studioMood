package member.model.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.swing.plaf.synth.SynthScrollBarUI;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import member.model.vo.MemberPageData;
import qna.model.vo.Qna;
import qna.model.vo.QnaPageData;

public class MemberService {

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member result = new MemberDao().selectOneMember(conn,memberId);
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().insertMember(conn,member);
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member selectOneMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		Member loginMember = new MemberDao().selectOneMember(conn, member);
		JDBCTemplate.close(conn);
		return loginMember; 
	}

	public ArrayList<Member> selectAllMember() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new MemberDao().selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int deleteMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().deleteMember(conn,memberId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else{
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().updateMember(conn,member);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public MemberPageData selectMembers(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		
		int totalCount = dao.totalCount(conn);		//珥� 硫ㅻ쾭�닔瑜� 援ы븯�뒗 dao
		int numPerPage = 12;						//�븳�럹�씠吏��떦 議고쉶�릺�뒗 硫ㅻ쾭 �닔
		int totalPage = 0;
	
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage +1;
		}

		//reqPage 1  -> start : 1, end : 10
		//reqPage 2  -> start : 11, end : 20
		//reqPage 3  -> start : 21, end : 30
		
		int start = (reqPage -1) * numPerPage+1;
		int end = reqPage *numPerPage;
		
		ArrayList<Member> list = dao.selectMembers(conn,start,end);
		
		int pageNaviSize = 5;
		String pageNavi = "";
		
		int pageNo = 0;
		if(reqPage <=3) {
			pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		}else if(reqPage >= totalPage-1){
			pageNo = totalPage-4;
		}else{
			pageNo = (reqPage-2);
		}
		
		
		//�씠�쟾踰꾪듉 留뚮뱾湲� -> �럹�씠吏� �떆�옉踰덊샇媛� 1�씠 �븘�땶 寃쎌슦�뿉留� �씠�쟾 踰꾪듉 �깮�꽦  
		if(pageNo != 1) {
				pageNavi += "<a class='btn' href='/adminMembers?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		
		//�럹�씠吏� �꽕鍮꾧쾶�씠�뀡 �닽�옄
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {     //�럹�씠吏��꽕鍮꾧� �쁽�옱 �슂泥� �럹�씠吏��씤 寃쎌슦 (a�깭洹멸� �븘�슂 X) 
				pageNavi += "<span class= 'selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/adminMembers?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
			
		}
		
		//�떎�쓬踰꾪듉 
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href = '/adminMembers?reqPage="+pageNo+"'>다음</a>";
		}
		 
		MemberPageData mpd = new MemberPageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return mpd;
	}

	public Member selectKakaoOneMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		Member loginMember = new MemberDao().selectKakaoOneMember(conn, member);
		JDBCTemplate.close(conn);
		return loginMember; 
	}
	public QnaPageData selectQna(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int totalCount = dao.qtotalCount(conn);		//珥� 硫ㅻ쾭�닔瑜� 援ы븯�뒗 dao
		int numPerPage = 12;						//�븳�럹�씠吏��떦 議고쉶�릺�뒗 硫ㅻ쾭 �닔
		int totalPage = 0;
	
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage +1;
		}

		//reqPage 1  -> start : 1, end : 10
		//reqPage 2  -> start : 11, end : 20
		//reqPage 3  -> start : 21, end : 30
		
		int start = (reqPage -1) * numPerPage+1;
		int end = reqPage *numPerPage;
		
		ArrayList<Qna> list = dao.selectQnaList(conn,start,end);
		
		int pageNaviSize = 5;
		String pageNavi = "";
		
		int pageNo = 0;
		if(reqPage <=3) {
			pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		}else if(reqPage >= totalPage-1){
			pageNo = totalPage-4;
		}else{
			pageNo = (reqPage-2);
		}
		
		
		//�씠�쟾踰꾪듉 留뚮뱾湲� -> �럹�씠吏� �떆�옉踰덊샇媛� 1�씠 �븘�땶 寃쎌슦�뿉留� �씠�쟾 踰꾪듉 �깮�꽦  
		if(pageNo != 1) {
				pageNavi += "<a class='btn' href='/adminQna?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		
		//�럹�씠吏� �꽕鍮꾧쾶�씠�뀡 �닽�옄
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {     //�럹�씠吏��꽕鍮꾧� �쁽�옱 �슂泥� �럹�씠吏��씤 寃쎌슦 (a�깭洹멸� �븘�슂 X) 
				pageNavi += "<span class= 'selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/adminQna?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
			
		}
		
		//�떎�쓬踰꾪듉 
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href = '/adminQna?reqPage="+pageNo+"'>다음</a>";
		}
		
		QnaPageData qpd = new QnaPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return qpd;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
