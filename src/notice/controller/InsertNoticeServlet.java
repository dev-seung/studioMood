package notice.controller;

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
 * Servlet implementation class InsertNoticeServlet
 */
@WebServlet(name = "InsertNotice", urlPatterns = { "/insertNotice" })
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.view에서 넘겨준 값 저장
		//파일업로드 형식이 맞는지 검사(enctype="multipart/form-data인지 확인)
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
//			request.setAttribute("msg", "공지사항 작성 오류[enctype]");
//			request.setAttribute("loc", "/");
//			rd.forward(request, response);
//			return;
//		}
		//파일업로드 준비
		//1) 파일업로드 경로설정
//		String root = getServletContext().getRealPath("/"); //WebContent폴더까지 경로
//		String saveDirectory = root+"upload/notice";
//		System.out.println(saveDirectory);
//		//2) 파일 최대크기 지정(cos라이브러리 무료버전의 경우 최대 10MB까지 가능)
//		int maxSize = 10*1024*1024;//10바이트*1024해서 kb 또 *1024해서  mb
//		//request -> MultipartRequest -> MultiPartRequest 객체로 변환하면서 파일이 업로드
//		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		Notice n = new Notice();
		n.setNoticeTitle(request.getParameter("noticeTitle"));
		n.setNoticeWriter(request.getParameter("noticeWriter"));
		n.setNoticeContent(request.getParameter("noticeContent"));
		System.out.println(n.getNoticeTitle());
		System.out.println(n.getNoticeContent());
		System.out.println(n.getNoticeWriter());
		//3. 비지니스로직
		int result = new NoticeService().insertNotice(n);
		//4. 결과처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "공지사항 등록 성공");
			
		}else {
			request.setAttribute("msg", "공지사항 등록 실패");
		}
		request.setAttribute("loc", "noticeList?reqPage=1");
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
