package post.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.model.service.PostService;
import post.model.vo.Post;

/**
 * Servlet implementation class PostDeleteServlet
 */
@WebServlet(name = "PostDelete", urlPatterns = { "/postDelete" })
public class PostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		Post p = new PostService().selectOnePost(postNo);
		int result = new PostService().deletePost(postNo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			if(p.getFilepath() != null) {//후기에 첨부파일이 있는 경우
				String root = getServletContext().getRealPath("/");
				String saveDirectory = root+"upload/post/";
				File delFile = new File(saveDirectory+p.getFilepath());
				boolean delResult = delFile.delete();
				if(delResult) {
					System.out.println("삭제 성공");
				}else {
					System.out.println("삭제 실패");
				}
			}
			request.setAttribute("msg", "삭제완료");
			request.setAttribute("loc", "/postList?reqPage=1");
		}else {
			request.setAttribute("msg", "삭제실패");
			request.setAttribute("loc", "postView?postNo="+postNo);
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
