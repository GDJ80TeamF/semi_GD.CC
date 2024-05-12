package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

public class RsvHotelDAO {
	// rsvNo에 따라 체크인 체크아웃 출력하는 메서드
	public static HashMap<String, Object> selectdate(int rsvNo) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvNo + "<-- rsvNo RsvHotelDAO.selectdate param");
		
		HashMap<String, Object> m = null;
		
		// DB연동
		Connection  conn = DBHelper.getConnection();
			
		String sql = "SELECT checkin_date checkinDate, checkout_date checkoutDate "
					+ " FROM rsv_hotel "
					+ " WHERE rsv_no = ? ";
			
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, rsvNo);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			m = new HashMap<String, Object>();
			m.put("checkinDate", rs.getString("checkinDate"));
			m.put("checkoutDate", rs.getString("checkoutDate"));
		}
		conn.close();
		return m;		
	}
}
