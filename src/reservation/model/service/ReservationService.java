package reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationPageData;

public class ReservationService {

	public ArrayList<Reservation> selectAllReservation() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> list = new ReservationDao().selectAllReservation(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public Reservation selectReservation(String phone, String pw) {
		Connection conn = JDBCTemplate.getConnection();
		Reservation r = new ReservationDao().selectReservation(conn,phone,pw);
		JDBCTemplate.close(conn);
		return r;
	}
	
	public ReservationPageData selectMembers(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		ReservationDao dao = new ReservationDao();
		
		int totalCount = dao.totalCount(conn);		//총 멤버수를 구하는 dao
		int numPerPage = 12;						//한페이지당 조회되는 예약 수
		int totalPage = 0;
	
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage +1;
		}
		
		int start = (reqPage -1) * numPerPage+1;
		int end = reqPage *numPerPage;
		
		ArrayList<Reservation> list = dao.selectReservations(conn,start,end);
		
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
		
		
		//이전버튼 만들기 -> 페이지 시작번호가 1이 아닌 경우에만 이전 버튼 생성  
		if(pageNo != 1) {
				pageNavi += "<a class='btn' href='/reservationAllSearch?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		
		//페이지 네비게이션 숫자
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {     //페이지네비가 현재 요청 페이지인 경우 (a태그가 필요 X) 
				pageNavi += "<span class= 'selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/reservationAllSearch?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
			
		}
		
		//다음버튼 
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href = '/reservationAllSearch?reqPage="+pageNo+"'>다음</a>";
		}
		 
		ReservationPageData rpd = new ReservationPageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return rpd;
	}

	public int deleteReservation(String phone) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().deleteReservation(conn,phone);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int deleteReservation(int rNum) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().deleteReservation(conn,rNum);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateReservation(int rNum, String s_time, String e_time, String r_date) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().updateReservation(conn,rNum,s_time,e_time, r_date);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Reservation selectReservation(int rNum) {
		Connection conn = JDBCTemplate.getConnection();
		Reservation r = new ReservationDao().selectReservation(conn,rNum);
		JDBCTemplate.close(conn);
		return r;
	}
	public ArrayList<Reservation> selectAllTime(String rDate) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> list = new ReservationDao().selectAllTime(conn,rDate);
		
		if(list.isEmpty()) {
			System.out.println(1);
		}
			
		
			
		
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Reservation> selectReservation(String phone) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> list = new ReservationDao().selectReservation(conn, phone);
		JDBCTemplate.close(conn);
		return list;
	}
}
