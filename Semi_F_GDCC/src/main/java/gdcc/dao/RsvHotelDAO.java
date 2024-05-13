package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.ArrayList;

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
	
	//호텔 예약 관련 카테고리 생성
	//호출 : admin/rsvHotelList.jsp
	//param :void
	//return : ArrayList<HashMap<String,Object>>
	
	public static ArrayList<HashMap<String,Object>> selectRsvHotelList() throws Exception{
		ArrayList<HashMap<String,Object>> list = 
				 new ArrayList<HashMap<String,Object>>();
		
		Connection  conn = DBHelper.getConnection();
		
		String sql ="SELECT h.rsv_no hotelRsvNo, b.rsv_bf_no bfRsvNo, c.rsv_comno comRsvNo "
				+ "FROM rsv_hotel h "
				+ "CROSS JOIN rsv_bf b "
				+ "CROSS JOIN rsv_complex c";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
				m.put("hotel", rs.getInt("hotelRsvNo"));
				m.put("bf", rs.getInt("bfRsvNo"));
				m.put("complex", rs.getInt("comRsvNo"));
			
				list.add(m);
		}
		
		conn.close();
		return list;
	}
	//전체 예약 리스트 출력
	//호출 : admin/rsvHotelList.jsp
	//param : void
	//return : ArrayList

	public static ArrayList<HashMap<String,Object>> allRsvList() throws Exception{
		ArrayList<HashMap<String,Object>> list = 
				 new ArrayList<HashMap<String,Object>>();

		
		Connection  conn = DBHelper.getConnection();
		
		String sql = "SELECT (SELECT COUNT(*) FROM rsv_hotel)"
				+ " + (SELECT COUNT(*) FROM rsv_bf)"
				+ " + (SELECT COUNT(*) FROM rsv_complex) total_count";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			
				m.put("cnt", rs.getInt("total_count"));
				
				list.add(m);
		}
		
		conn.close();
		return list;
	}
	//호출 - insertRsvForm.jsp
	//param - cusMail
	//return ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>> selectRsvNo (String cusMail) throws Exception{
	ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>> ();
	Connection conn = DBHelper.getConnection();
				
	String sql = "SELECT rsv_no,checkin_date,checkout_date FROM rsv_hotel WHERE rsv_mail = ? AND rsv_state='예약완료'";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, cusMail);
	ResultSet rs = stmt.executeQuery();
	while(rs.next()) {
		HashMap<String,Object> m = new HashMap<String,Object>();
					
		m.put("rsvNo", rs.getInt("rsv_no"));
					
		list.add(m);
					
		}
		conn.close();
		return list;
			}
			
	
			
	
}
