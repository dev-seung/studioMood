package notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet(name = "NoticeUpdate", urlPatterns = { "/noticeUpdate" })
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
				request.setCharacterEncoding("utf-8");
//				//2. view넘어온 데이터 저장
//				if(!ServletFileUpload.isMultipartContent(request)) {
//					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common.msg.jsp");
//					request.setAttribute("msg", "공지사항 수정 오류[enctype]");
//					request.setAttribute("loc", "/");
//					rd.forward(request, response);
//					return;
//				}
//				//파일 저장 경로
//				String root = getServletContext().getRealPath("/");
//				String saveDirectory = root+"upload/notice";
//				//파일 최대 크기 지정
//				int maxSize = 10*1024*1024;
//				//request->MultiparRequest로 변경
//				MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
				Notice n = new Notice();
				n.setNoticeNo(Integer.parseInt(request.getParameter("noticeNo")));
				n.setNoticeTitle(request.getParameter("noticeTitle"));
				n.setNoticeContent(request.getParameter("noticeContent"));
				System.out.println(n.getNoticeContent());
				//3. 비지니스로직
				int result = new NoticeService().updateNotice(n);
				//4. 결과처리
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				
				if(result>0) {
					request.setAttribute("msg", "공지사항 수정 완료");	
				}else {
					request.setAttribute("msg", "공지사항 수정 실패");
				}
				request.setAttribute("loc", "/noticeView?noticeNo="+n.getNoticeNo());
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
