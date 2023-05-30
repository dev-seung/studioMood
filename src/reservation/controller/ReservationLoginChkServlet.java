package reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationLoginChkServlet
 */
@WebServlet(name = "ReservationLoginChk", urlPatterns = { "/reservationLoginChk" })
public class ReservationLoginChkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationLoginChkServlet() {
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
		Reservation reservation = new Reservation();
		reservation.setrDate(request.getParameter("r_date"));
		reservation.setsTime(request.getParameter("s_time"));
		reservation.seteTime(request.getParameter("e_time"));
		reservation.setConcept(request.getParameter("concept"));
		reservation.setrPass(request.getParameter("r_pass"));
		reservation.setCutNum(Integer.parseInt(request.getParameter("cut")));
		RequestDispatcher rd = null;
		if(request.getParameter("rCheck")==null) {
			reservation.setrCheck("N");
			if(member==null) {
				System.out.println("nnnn");
				rd = request.getRequestDispatcher("/WEB-INF/views/reservation/nonMemResv.jsp");
				request.setAttribute("reservation", reservation);// 비회원 페이지에 예약데이터를 넘겨서 나머지값을 입력받도록 유도
			}else {
				System.out.println("!!!!");
				rd = request.getRequestDispatcher("/memberReservation");
				request.setAttribute("reservation", reservation);  //회원 예약 서블릿에는 로그인 객체와  예약 객체를 섞어 완성데이터 받기
			}
		}else {
			//수정값이 넘어오면 결제값은 유지되야함
			System.out.println("수정진행해야함");
			reservation.setrCheck(request.getParameter("rCheck"));
			reservation.setrNum(Integer.parseInt(request.getParameter("rNum")));
			rd = request.getRequestDispatcher("/WEB-INF/views/reservation/searchReserve.jsp");
			int result = new ReservationService().updateReservation(reservation.getrNum(), reservation.getsTime(), reservation.geteTime(), reservation.getrDate());
			if(result>0) {
				System.out.println("수정성공");
			}else {
				System.out.println("수정실패");
			}
		}			
		rd.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
