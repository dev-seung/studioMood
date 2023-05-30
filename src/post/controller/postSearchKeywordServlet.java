package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Connection.Request;

import post.model.service.PostService;
import post.model.vo.Post;
import post.model.vo.PostPageData;

/**
 * Servlet implementation class SearchKeywordServlet
 */
@WebServlet(name = "postSearchKeyword", urlPatterns = { "/postSearchKeyword" })
public class postSearchKeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postSearchKeywordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		//서블릿 코드 수정할게요 
		PostPageData ppd = new PostService().postSearchKeyword(reqPage, keyword, type);
		System.out.println(ppd.getList().size());
//		ArrayList<Post> list = new PostService().searchKeyword(reqPage, keyword, type);
//		PostPageData ppd1 = new PostService().searchTitle(reqPage, keyword);
//		PostPageData ppd2 = new PostService().searchWriter(reqPage, keyword);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/post/postList.jsp");
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
			request.setAttribute("list", ppd.getList());
			request.setAttribute("pageNavi", ppd.getPageNavi());

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
