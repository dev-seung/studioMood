package reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationPageData;

/**
 * Servlet implementation class ReservationSearchServlet
 */
@WebServlet(name = "ReservationAllSearch", urlPatterns = { "/reservationAllSearch" })
public class ReservationAllSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationAllSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		ArrayList<Reservation> list = new ReservationService().selectAllReservation();
		System.out.println("reqPage : " + reqPage);
		ReservationPageData rpd = new ReservationService().selectMembers(reqPage);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reservation/showAllreserv.jsp");
		request.setAttribute("reservationList", rpd.getList());
		request.setAttribute("pageNavi", rpd.getPageNavi());
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
