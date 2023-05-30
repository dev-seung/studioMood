package post.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import post.model.service.PostService;
import post.model.vo.Post;

/**
 * Servlet implementation class PostUpdateServlet
 */
@WebServlet(name = "PostUpdate", urlPatterns = { "/postUpdate" })
public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(!ServletFileUpload.isMultipartContent(request)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "수정 오류");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
			return;
		}
			String root = getServletContext().getRealPath("/");
			String saveDirectory = root+"upload/post";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			Post p = new Post();
			p.setPostNo(Integer.parseInt(mRequest.getParameter("postNo")));
			p.setPostTitle(mRequest.getParameter("postTitle"));
			p.setPostContent(mRequest.getParameter("postContent"));
			p.setFilename(mRequest.getOriginalFileName("filename"));
			p.setFilepath(mRequest.getFilesystemName("filename"));
			
			String oldFilename = mRequest.getParameter("oldFilename");
			String oldFilepath = mRequest.getParameter("oldFilepath");
			//파일 삭제 확인용
			String status = mRequest.getParameter("status");
			//현재 첨부파일 확인
			File f = mRequest.getFile("filename");
			
			if(f != null && f.length() > 0) {	//새로운 첨부파일이 있는 경우
				if(status.equals("delete")) {	//기존 첨부파일 삭제한 경우
					File delFile = new File(saveDirectory+"/"+oldFilepath);
					boolean bool = delFile.delete();
					System.out.println(bool?"삭제성공":"삭제실패");
				}
			}else {		//새로운 첨부파일이 없는 경우
				if(status.equals("delete")) {//기존 첨부파일을 삭제한 경우
					File delFile = new File(saveDirectory+"/"+oldFilepath);
					boolean bool = delFile.delete();
					System.out.println(bool?"삭제성공":"삭제실패");
				}else if(status.equals("stay")) {
					p.setFilename(oldFilename);
					p.setFilepath(oldFilepath);
				}
			}
			int result = new PostService().updatePost(p);
			
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
			if(result>0) {
				request.setAttribute("msg", "등록성공");
			}else {
				request.setAttribute("msg", "등록실패");
			}
			request.setAttribute("loc", "/postView?postNo="+p.getPostNo());
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
