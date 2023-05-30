package faq.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faq.model.service.FaqService;
import faq.model.vo.Faq;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class FaqDeleteServlet
 */
@WebServlet(name = "FaqDelete", urlPatterns = { "/faqDelete" })
public class FaqDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
				request.setCharacterEncoding("utf-8");
				//2. view에서 넘어온 값 저장
				int faqNo = Integer.parseInt(request.getParameter("faqNo"));
				//3. 비지니스 로직
				Faq f = new FaqService().selectOneFaq(faqNo);
				int result = new FaqService().deleteFaq(faqNo);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				//4. 결과처리
				if(result>0) {
					request.setAttribute("msg", "삭제완료");
					request.setAttribute("loc", "/faqList?reqPage=1");
					
				}else {
					request.setAttribute("msg", "삭제 실패");
					request.setAttribute("loc", "/faqList?reqPage=1");
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
