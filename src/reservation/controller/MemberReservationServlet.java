package reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JDBCTemplate;
import member.model.vo.Member;
import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class MemberReservationServlet
 */
@WebServlet(name = "MemberReservation", urlPatterns = { "/memberReservation" })
public class MemberReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("loginMember");
		Reservation reservation = (Reservation)request.getAttribute("reservation");
		
		
		//reservation에 member값 넣어서 전송
		reservation.setName(member.getMemberName());
		reservation.setPhone(member.getPhone());
		
		int result= new ReservationDao().insertReservation(reservation);
		
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "성공");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("msg", "실패");
			request.setAttribute("loc", "/");
		}
		rd.forward(request, response);
		
		//dao에 넘겨서 디비에 추가
		//result받아서 체크후 이동
		//예약번호와 확인은 dao에서 입력\
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
