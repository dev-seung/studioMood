package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//데이터베이스 코드 중 중복부분 처리 클래스 제작
//싱글톤(singleTon) : 클래스에 대한 객체가 포로그램 구동내내 한개만 작성되어 모두 공유하여 사용하는 디자인 패턴

public class JDBCTemplate {
	
	//리턴타입을 static으로 지정
	
	//1. Driver등록, Connection객체 생성 --------------------------------------------------------------
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@1.220.236.74:15213:xe","HSDsemi","1234");
			
			//자동 오토 커밋이 설정되어있다.
			conn.setAutoCommit(false); //자동 커밋 설정 해지
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return conn;
	}
	
	
	//2. Connection Close --------------------------------------------------------------------
	//같은 메소드명(close) - 다른 매개변수 : 오버로딩
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) { //값이 null이 아니면서 닫혀있지 않을 때
				conn.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//같은 메소드명(close) - 다른 매개변수 : 오버로딩
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) { ////값이 null이 아니면서 닫혀있지 않을 때
				stmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//PreparedStatement는 만들지 않아도 된다. 다형성에 의해 Statement로 처리된다.
	
	
	//같은 메소드명(close) - 다른 매개변수 : 오버로딩
	public static void close(ResultSet rset) {
		try {
			if (rset != null && !rset.isClosed()) { // 값이 null이 아니면서 닫혀있지 않을 때
				rset.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	
	//3. commit, rollback ---------------------------------------------------------------
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}

