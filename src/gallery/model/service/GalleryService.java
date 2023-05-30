package gallery.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import gallery.model.dao.GalleryDao;
import gallery.model.vo.Gallery;

public class GalleryService {

	public int totalCount() {
		Connection conn = JDBCTemplate.getConnection();
		int totalCount = new GalleryDao().totalCount(conn);
		return totalCount;
	
	}

	public int insertPhoto(Gallery g) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new GalleryDao().insertPhoto(conn, g);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	
	}

	public ArrayList<Gallery> galleryMore(int start) {
		Connection conn = JDBCTemplate.getConnection();
		int count = 4;  //한번에 가지고 올 갯수
		int end = start + count-1 ;
		ArrayList<Gallery> list = new GalleryDao().galleryMore(conn, start, end);
		JDBCTemplate.close(conn);
		return list;
	}

}
