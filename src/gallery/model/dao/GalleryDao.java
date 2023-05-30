package gallery.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import gallery.model.vo.Gallery;

public class GalleryDao {

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount =0;
		String query = "select count(*) g_num from gallery";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt("g_num");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}

	public int insertPhoto(Connection conn, Gallery g) {
		PreparedStatement pstmt = null;
		int result =0;
		String query = "insert into gallery values(g_seq.nextval,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, g.getgWriter());
			pstmt.setString(2, g.getgContent());
			pstmt.setString(3, g.getgFilePath());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Gallery> galleryMore(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gallery> list = new ArrayList<Gallery>();
		System.out.println(start+"시작"+end);
		String query = "select * from (select rownum as rnum, n.* from (select * from gallery order by 1 desc)n) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Gallery g = new Gallery();
				g.setrNum(rset.getInt("rnum"));
				g.setgNum(rset.getInt("g_num"));
				g.setgWriter(rset.getString("g_writer"));
				g.setgContent(rset.getString("g_content"));
				g.setgFilePath(rset.getString("g_filepath"));
				list.add(g);
				System.out.println(g.getgNum());
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


}
