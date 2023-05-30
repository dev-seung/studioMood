package post.model.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.Jdbc41Bridge;

import common.JDBCTemplate;
import post.model.dao.PostDao;
import post.model.vo.Post;
import post.model.vo.PostComment;
import post.model.vo.PostPageData;
import post.model.vo.PostViewData;

public class PostService {

	public PostPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		PostDao dao = new PostDao();
		int totalCount = dao.totalCount(conn);
		int numPerPage = 20;
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount/ numPerPage+1;
		}
		int start = (reqPage-1)*numPerPage +1;
		int end = reqPage*numPerPage;
		
		ArrayList<Post> list = new PostDao().selectList(conn,start,end);
		
		int pageNaviSize = 5;
		String pageNavi="";
		
		int pageNo = reqPage-2;
		if(reqPage <=3) {
			pageNo=1;
		}else if(pageNo>totalPage-4){
			pageNo = totalPage-4;
		}
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/postList?reqPage="+(pageNo-1)+"'>이전</a></li>";
		}
		for(int i=0; i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</spna></li>";
			}else {
				pageNavi +="<li class='page-item'><a class='page-link' href='/postList?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/postList?reqPage="+pageNo+"'>다음</a></li>";
		}
		PostPageData ppd = new PostPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		//여기만큼씩
		//할수있죠??글쎄요... 해볼게요일단...ㅠㅠㅠㅠㄴ ㅇㅇ 이미 다른거만들어져있어서 어디에 뭐가필요한지정리마하면될것같아요
		//네ㅠㅠ
		return ppd;
	}

	public int insertPost(Post p) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PostDao().insertPost(conn, p);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updatePost(Post p) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PostDao().updatePost(conn, p);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Post selectOnePost(int postNo) {
		Connection conn = JDBCTemplate.getConnection();
		Post p = new PostDao().selectPost(conn, postNo);
		if(p != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return p;
	}

	public PostViewData selectPostView(int postNo) {
		Connection conn = JDBCTemplate.getConnection();
		Post p = new PostDao().selectPost(conn, postNo);
		ArrayList<PostComment> list = new PostDao().selectPostCommentlist(conn, postNo);
		JDBCTemplate.close(conn);
		PostViewData pvd = new PostViewData(p, list);
		return pvd;
	}

	public int deletePost(int postNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PostDao().deletePost(conn, postNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertPostComment(PostComment pc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PostDao().insertPostComment(conn, pc);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int postCommentUpdate(int postCommentNo, String postCommentContent) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PostDao().postCommentUpdate(conn, postCommentNo, postCommentContent);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int postCommentDelete(int postCommentNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PostDao().postCommentDelete(conn, postCommentNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public PostPageData postSearchKeyword(int reqPage, String keyword, String type) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list = null;
		PostPageData ppd = null;
		if(type.equals("postTitle")) {
			System.out.println("제목으로 검");
			//여기서 제목으로 검색할 때 필요한거 전부다 제작(totalCount, ArrayList<Post>, pageNavi)
			//여기 한영이안되네 -> 여기 이프, 엘스이프가 다 리스트구하는 만큼씩 나올꺼에요
			int totalCount = new PostDao().searchTitleCount(conn, keyword);
			int numPerPage = 20;
			int totalPage = 0;
			if(totalCount%numPerPage == 0) {
				totalPage = totalCount / numPerPage;
			}else {
				totalPage = totalCount/ numPerPage+1;
			}
			int start = (reqPage-1)*numPerPage +1;
			int end = reqPage*numPerPage;
			
			ArrayList<Post> titlelist = new PostDao().searchTitleList(conn,start,end, keyword);
			for(Post p : titlelist) {
				System.out.println(1);
				System.out.println(p.getPDate());
			}
			int pageNaviSize = 5;
			String pageNavi="";
			
			int pageNo = reqPage-2;
			if(reqPage <=3) {
				pageNo=1;
			}else if(pageNo>totalPage-4){
				pageNo = totalPage-4;
			}
			if(pageNo != 1) {
				pageNavi += "<li class='page-item'><a class='page-link' href='/postSearchKeyword?reqPage="+(pageNo-1)+"&type=postTitle&keyword="+keyword+"'>이전</a></li>";
			}
			for(int i=0; i<pageNaviSize;i++) {
				if(reqPage == pageNo) {
					pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</spna></li>";
				}else {
					pageNavi +="<li class='page-item'><a class='page-link' href='/postSearchKeyword?reqPage="+pageNo+"&type=postTitle&keyword="+keyword+"'>"+pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo > totalPage) {
					break;
				}
			}
			if(pageNo <= totalPage) {
				pageNavi += "<li class='page-item'><a class='page-link' href='/postSearchKeyword?reqPage="+pageNo+"&type=postTitle&keyword="+keyword+"'>다음</a></li>";
			}
			ppd = new PostPageData(titlelist, pageNavi);
		}else if(type.equals("postWriter")) {
			System.out.println("writer");
			//여기서 작성자로 검색할 때 필요한거 전부다 제작(totalCount, ArrayList<Post>, pageNavi)
			int totalCount = new PostDao().searchWriterCount(conn, keyword);
			int numPerPage = 20;
			int totalPage = 0;
			if(totalCount%numPerPage == 0) {
				totalPage = totalCount / numPerPage;
			}else {
				totalPage = totalCount/ numPerPage+1;
			}
			int start = (reqPage-1)*numPerPage +1;
			int end = reqPage*numPerPage;
			
			ArrayList<Post> writerlist = new PostDao().searchWriterList(conn,start,end, keyword);
			int pageNaviSize = 5;
			String pageNavi="";
			
			int pageNo = reqPage-2;
			if(reqPage <=3) {
				pageNo=1;
			}else if(pageNo>totalPage-4){
				pageNo = totalPage-4;
			}
			if(pageNo != 1) {
				pageNavi += "<li class='page-item'><a class='page-link' href='/postSearchKeyword?reqPage="+(pageNo-1)+"&type=postWriter&keyword="+keyword+"'>이전</a></li>";
			}
			for(int i=0; i<pageNaviSize;i++) {
				if(reqPage == pageNo) {
					pageNavi += "<li class='page-item'><span class='page-link selectPage'>"+pageNo+"</spna></li>";
				}else {
					pageNavi +="<li class='page-item'><a class='page-link' href='/postSearchKeyword?reqPage="+pageNo+"&type=postWriter&keyword="+keyword+"'>"+pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo > totalPage) {
					break;
				}
			}
			if(pageNo <= totalPage) {
				pageNavi += "<li class='page-item'><a class='page-link' href='/postSearchKeyword?reqPage="+pageNo+"&type=postWriter&keyword="+keyword+"'>다음</a></li>";
			}
			ppd = new PostPageData(writerlist, pageNavi);
		}
		JDBCTemplate.close(conn);
		return ppd;
	}


}
