package post.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import post.model.vo.Post;
import post.model.vo.PostComment;

public class PostDao {

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from postscripte";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Post> selectList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		String query = "select * from (select rownum as pnum, p.* from (select * from postscripte order by 1 desc)p) where pnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Post p = new Post();
				p.setpNum(rset.getInt("pnum"));
				p.setPostNo(rset.getInt("p_num"));
				p.setPostTitle(rset.getString("p_title"));
				p.setPostWriter(rset.getString("p_writer"));
				p.setPDate(rset.getString("p_date"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public int insertPost(Connection conn, Post p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into postscripte values(post_seq.nextval,?,?,?,to_char(sysdate,'yyyy-mm-dd'),?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPostTitle());
			pstmt.setString(2, p.getPostContent());
			pstmt.setString(3, p.getPostWriter());
			pstmt.setString(4, p.getFilename());
			pstmt.setString(5, p.getFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updatePost(Connection conn, Post p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update postscripte set p_title=?, p_content=?, filename=?, filepath=? where p_num = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPostTitle());
			pstmt.setString(2, p.getPostContent());
			pstmt.setString(3, p.getFilename());
			pstmt.setString(4, p.getFilepath());
			pstmt.setInt(5, p.getPostNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Post selectPost(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from postscripte where p_num = ?";
		Post p = new Post();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p.setPostNo(rset.getInt("p_num"));
				p.setPostTitle(rset.getString("p_title"));
				p.setPostContent(rset.getString("p_content"));
				p.setPostWriter(rset.getString("p_writer"));
				p.setPDate(rset.getString("p_date"));
				p.setFilename(rset.getString("filename"));
				p.setFilepath(rset.getString("filepath"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return p;
	}

	public ArrayList<PostComment> selectPostCommentlist(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from postcoment where pc_ref = ? order by 1";
		ArrayList<PostComment> list = new ArrayList<PostComment>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PostComment pc = new PostComment();
				pc.setPostCommentNo(rset.getInt("pc_num"));
				pc.setPostCommentWriter(rset.getString("pc_writer"));
				pc.setPostCommentContent(rset.getString("pc_content"));
				pc.setPostCommentDate(rset.getString("pc_date"));
				pc.setPostRef(rset.getInt("pc_ref"));
				list.add(pc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public int deletePost(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from postscripte where p_num=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertPostComment(Connection conn, PostComment pc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into postcoment values(postcoment_seq.nextval,?,?,to_char(sysdate,'yyyy-mm-dd'),?)";
		
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setString(1, pc.getPostCommentWriter());
			pstmt.setString(2, pc.getPostCommentContent());
			pstmt.setInt(3, pc.getPostRef());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int postCommentUpdate(Connection conn, int postCommentNo, String postCommentContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update postcoment set pc_content=? where pc_num=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, postCommentContent);
			pstmt.setInt(2, postCommentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int postCommentDelete(Connection conn, int postCommentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from postcoment where pc_num=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postCommentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Post> searchKeywordtitle(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from postscripte where p_title like (?)";
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+keyword+'%');
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Post p = new Post();
				p.setpNum(rset.getInt("pnum"));
				p.setPostNo(rset.getInt("p_num"));
				p.setPostTitle(rset.getString("p_title"));
				p.setPostWriter(rset.getString("p_writer"));
				p.setPDate(rset.getString("p_date"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public ArrayList<Post> searchKeywordId(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from postscripte where p_writer like (?)";
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+keyword+'%');
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Post p = new Post();
				p.setpNum(rset.getInt("pnum"));
				p.setPostNo(rset.getInt("p_num"));
				p.setPostTitle(rset.getString("p_title"));
				p.setPostWriter(rset.getString("p_writer"));
				p.setPDate(rset.getString("p_date"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public ArrayList<Post> searchTitleList(Connection conn, int start, int end, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		System.out.println(start);
		System.out.println(end);
		String query = "select * from (select rownum as pnum, p.* from (select * from postscripte where p_title like (?) order by 1 desc)p) where pnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+keyword+'%');
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				Post p = new Post();
				p.setpNum(rset.getInt("pnum"));
				p.setPostNo(rset.getInt("p_num"));
				p.setPostTitle(rset.getString("p_title"));
				p.setPostWriter(rset.getString("p_writer"));
				p.setPDate(rset.getString("p_date"));
				list.add(p);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public int searchTitleCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from postscripte where p_title like (?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+keyword+'%');
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Post> searchWriterList(Connection conn, int start, int end, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		String query = "select * from (select rownum as pnum, p.* from (select * from postscripte where p_writer like (?) order by 1 desc)p) where pnum between ? and ?";
		
		try {
			System.out.println("난 while문 내부");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+keyword+'%');
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Post p = new Post();
				p.setpNum(rset.getInt("pnum"));
				p.setPostNo(rset.getInt("p_num"));
				p.setPostTitle(rset.getString("p_title"));
				p.setPostWriter(rset.getString("p_writer"));
				p.setPDate(rset.getString("p_date"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public int searchWriterCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from postscripte where p_writer like (?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+keyword+'%');
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
