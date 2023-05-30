package reservation.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import post.model.vo.Post;
import reservation.model.vo.Reservation;

public class ReservationDao {

	public ArrayList<Reservation> selectAllReservation(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		String query = "select * from reserve";
		try {
			pstmt = conn.prepareStatement(query);		
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reservation r = new Reservation();
				r.setrNum(rset.getInt("r_num"));
				r.setName(rset.getString("name"));
				r.setPhone(rset.getString("phone"));
				r.setrDate(rset.getString("r_date"));
				r.setsTime(rset.getString("s_time"));
				r.seteTime(rset.getString("e_time"));
				r.setConcept(rset.getString("concept"));
				r.setCutNum(rset.getInt("cutnum"));
				r.setrCheck(rset.getString("r_check"));
				r.setrPass(rset.getString("r_pass"));
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public Reservation selectReservation(Connection conn, String phone, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reservation r = new Reservation();
		String query = "select * from reserve where phone=? and r_pass=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
			pstmt.setString(2, pw);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r.setrNum(rset.getInt("r_num"));
				r.setName(rset.getString("name"));
				r.setPhone(rset.getString("phone"));
				r.setrDate(rset.getString("r_date"));
				r.setsTime(rset.getString("s_time"));
				r.seteTime(rset.getString("e_time"));
				r.setConcept(rset.getString("concept"));
				r.setCutNum(rset.getInt("cutnum"));
				r.setrCheck(rset.getString("r_check"));
				r.setrPass(rset.getString("r_pass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
	}
	
	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from reserve";
		
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
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return result;
	}

	public int deleteReservation(Connection conn, String phone) {
		PreparedStatement pstmt = null;		
		int result = 0;
		String query = "delete from reserve where phone=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int deleteReservation(Connection conn, int rNum) {
		PreparedStatement pstmt = null;		
		int result = 0;
		String query = "delete from reserve where r_num=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateReservation(Connection conn, int r_num, String s_time, String e_time, String r_date) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update reserve set s_time=?,e_time=?,r_date=? where r_num=?";
		System.out.println("r_num = "+r_num);
		System.out.println("sTime = "+s_time);
		System.out.println("eTime = "+e_time);
		System.out.println("rDate = "+r_date);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, s_time);
			pstmt.setString(2, e_time);
			pstmt.setString(3, r_date);
			pstmt.setInt(4, r_num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Reservation selectReservation(Connection conn, int rNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reservation r = new Reservation();
		String query = "select * from reserve where r_num=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNum);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r.setrNum(rset.getInt("r_num"));
				r.setName(rset.getString("name"));
				r.setPhone(rset.getString("phone"));
				r.setrDate(rset.getString("r_date"));
				r.setsTime(rset.getString("s_time"));
				r.seteTime(rset.getString("e_time"));
				r.setConcept(rset.getString("concept"));
				r.setCutNum(rset.getInt("cutnum"));
				r.setrCheck(rset.getString("r_check"));
				r.setrPass(rset.getString("r_pass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
	}

public int insertReservation(Reservation reservation) {
	System.out.println("33");
	PreparedStatement pstmt = null;
	Connection conn=JDBCTemplate.getConnection();
	int result=0;
	String query = "insert into reserve values(reserve_seq.nextval,?,?,?,?,?,?,?,?,?)";
	try {
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, reservation.getName());
		pstmt.setString(2, reservation.getPhone());
		pstmt.setString(3, reservation.getrDate());
		pstmt.setString(4, reservation.getsTime());
		pstmt.setString(5, reservation.geteTime());
		pstmt.setString(6, reservation.getConcept());
		pstmt.setInt(7, reservation.getCutNum());
		pstmt.setString(8, reservation.getrCheck());
		pstmt.setString(9, reservation.getrPass());
		result=pstmt.executeUpdate();
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCTemplate.close(conn);
		JDBCTemplate.close(pstmt);
	}
	return result;
}

public ArrayList<Reservation> selectAllTime(Connection conn, String rDate) {
	System.out.println(2);
	PreparedStatement pstmt=null;
	String query="select * from reserve where r_date=?";
	ArrayList<Reservation> list = new ArrayList<Reservation>();
	ResultSet rset =null;
	try {
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, rDate);
		rset=pstmt.executeQuery();
		while(rset.next()) {
			Reservation reservation = new Reservation();
			reservation.setsTime(rset.getString("s_time"));
			reservation.seteTime(rset.getString("e_time"));
			list.add(reservation);
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

public ArrayList<Reservation> selectReservation(Connection conn, String phone) {
	PreparedStatement pstmt=null;
	String query="select * from reserve where phone=?";
	ArrayList<Reservation> list = new ArrayList<Reservation>();
	ResultSet rset =null;
	try {
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, phone);
		rset=pstmt.executeQuery();
		while(rset.next()) {
			Reservation r = new Reservation();
			r.setrNum(rset.getInt("r_num"));
			r.setName(rset.getString("name"));
			r.setPhone(rset.getString("phone"));
			r.setrDate(rset.getString("r_date"));
			r.setsTime(rset.getString("s_time"));
			r.seteTime(rset.getString("e_time"));
			r.setConcept(rset.getString("concept"));
			r.setCutNum(rset.getInt("cutnum"));
			r.setrCheck(rset.getString("r_check"));
			r.setrPass(rset.getString("r_pass"));
			list.add(r);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
	}
	
	return list;
}

public ArrayList<Reservation> selectReservations(Connection conn, int start, int end) {
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	ArrayList<Reservation> list = new ArrayList<Reservation>();
	String query = "select * from(select rownum as rnum,n.*from(select *from reserve order by 1 desc)n) where rnum between ? and ?";
	
	try {
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		rset = pstmt.executeQuery();
		
		while (rset.next()) {
			Reservation r = new Reservation();
			r.setrNum(rset.getInt("rNum"));
			r.setName(rset.getString("name"));
			r.setPhone(rset.getString("phone"));
			r.setrDate(rset.getString("r_date"));
			r.setsTime(rset.getString("s_time"));
			r.seteTime(rset.getString("e_time"));
			r.setConcept(rset.getString("concept"));
			r.setCutNum(rset.getInt("cutNum"));
			r.setrCheck(rset.getString("r_check"));
			r.setrPass(rset.getString("r_pass"));
			list.add(r);
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
