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

/**
 * Servlet implementation class ChkReserveServlet
 */
@WebServlet(name = "ChkReserve", urlPatterns = { "/chkReserve" })
public class ChkReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChkReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		String phone = request.getParameter("phone");
		String pw = request.getParameter("pw");
		ArrayList<Reservation> list = new ReservationService().selectReservation(phone);
		ArrayList<Reservation> listFin = new ArrayList<Reservation>(); 
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reservation/chkReserve.jsp");
		boolean isRightPassword = false;
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getrPass().equals(pw)) {
				isRightPassword = true;
				listFin.add(list.get(i));
			}
		}
		if(list.size()!=0 && (isRightPassword!=false)) {
			
		}
		//만약 조회결과에서 비밀번호가 다르다면
		else if(list.size()!=0 && (isRightPassword!=false)) {
			request.setAttribute("alertMsg","조회 결과는 있지만 비밀번호가 다릅니다.");
			list = null;
		}else {
			request.setAttribute("alertMsg","조회 결과가 없습니다.");
			list = null;
		}
		request.setAttribute("ReserveList", listFin);
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
