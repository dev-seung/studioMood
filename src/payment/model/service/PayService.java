package payment.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import payment.model.dao.PayDao;
import payment.model.vo.Pay;

public class PayService {

	

	public Pay selectPayInfo(String phone) {
		Connection conn = JDBCTemplate.getConnection();
		Pay pay = new PayDao().selectPayInfo(conn, phone);
		JDBCTemplate.close(conn);
		return pay;
	}

	public int payCheck(String phone) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PayDao().payCheck(conn,phone);
		JDBCTemplate.close(conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	



}
