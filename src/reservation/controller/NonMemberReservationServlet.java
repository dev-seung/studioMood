package reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class NonMemberReservationServlet
 */
@WebServlet(name = "NonMemberReservation", urlPatterns = { "/nonMemberReservation" })
public class NonMemberReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NonMemberReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Reservation reservation = new Reservation();
		reservation.setName(request.getParameter("name"));
		reservation.setPhone(request.getParameter("phone"));
		reservation.setrDate(request.getParameter("rDate"));
		reservation.setsTime(request.getParameter("sTime"));
		reservation.seteTime(request.getParameter("eTime"));
		reservation.setConcept(request.getParameter("concept"));
		reservation.setCutNum(Integer.parseInt(request.getParameter("cutNum")));
		reservation.setrCheck(request.getParameter("rCheck"));
		reservation.setrPass(request.getParameter("rPass"));
		
		int result=new ReservationDao().insertReservation(reservation);
		
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "성공");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("msg", "실패");
			request.setAttribute("loc", "/");
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
