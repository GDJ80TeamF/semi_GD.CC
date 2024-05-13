package gdcc.dao;
import java.util.*;
import java.sql.*;

public class RsvBfDAO {
	// 조식예약 작성하는 메서드
	public static int insertRsv(int rsvNo, String rsvDate, String rsvTime, int rsvMember,int rsvMenu) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvNo + "<-- rsvNo RsvBfDAO.insertRsv param");
		System.out.println(rsvDate + "<-- rsvDate RsvBfDAO.insertRsv param");
		System.out.println(rsvTime + "<-- rsvTime RsvBfDAO.insertRsv param");
		System.out.println(rsvMember + "<-- rsvMember RsvBfDAO.insertRsv param");
		System.out.println(rsvMenu + "<-- rsvMenu RsvBfDAO.insertRsv param");
		
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "INSERT INTO rsv_bf (rsv_no, rsv_date, rsv_time, rsv_member, rsv_menu, create_date, update_date) "
					+ "VALUES(?, ?, ?, ?, ?, NOW(), NOW())";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, rsvNo);
		stmt.setString(2, rsvDate);
		stmt.setString(3, rsvTime);
		stmt.setInt(4, rsvMember);
		stmt.setInt(5, rsvMenu);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
	// rsvNo가 ?인 조식예약정보 출력하는 메서드 / 상세보기
	public static ArrayList<HashMap<String, Object>> selectRsvOne(int rsvNo) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvNo + "<-- rsvNo RsvBfDAO.selectRsv param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		// DB연동
		Connection  conn = DBHelper.getConnection();
			
		String sql = "SELECT rsv.rsv_bfno rsvBfno, rsv.rsv_no rsvNo, rsv.rsv_date rsvDate, rsv.rsv_time rsvTime, rsv.rsv_member rsvMember, "
				+ " rsv.rsv_state rsvState, menu.menu_main menuMain, menu.menu_info menuInfo, "
				+ " menu.menu_img menuImg "
				+ " FROM rsv_bf rsv INNER JOIN bf_menu menu "
				+ " ON rsv.rsv_menu = menu.menu_no "
				+ " WHERE rsv_no = ? ";
			
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, rsvNo);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("rsvBfno", rs.getInt("rsvBfno"));
			m.put("rsvNo", rs.getInt("rsvNo"));
			m.put("rsvDate", rs.getString("rsvDate"));
			m.put("rsvTime", rs.getString("rsvTime"));
			m.put("rsvMember", rs.getInt("rsvMember"));
			m.put("rsvState", rs.getString("rsvState"));
			m.put("menuMain", rs.getString("menuMain"));
			m.put("menuInfo", rs.getString("menuInfo"));
			m.put("menuImg", rs.getString("menuImg"));
			list.add(m);
		}
		conn.close();
		return list;		
	}
	// rsvNo가 ?인 조식예약 삭제하는 메서드
	public static int deleteRsv(int rsvNo) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvNo + "<-- rsvNo BfDAO.deleteRsv param");
				
		int row = 0;
		
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "DELETE from rsv_bf WHERE rsv_no = ?";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, rsvNo);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
	// 호출 : /customer/hotelBf/action/rsvUpdateAction.jsp
	// rsv_bfno가 ?인 조식예약 수정하는 메서드
	public static int updateRsv(String rsvDate, String rsvTime, int rsvMember, int rsvBfno) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvDate + "<-- rsvDate RsvBfDAO.updateRsv param");
		System.out.println(rsvTime + "<-- rsvTime RsvBfDAO.updateRsv param");
		System.out.println(rsvMember + "<-- rsvMember RsvBfDAO.updateRsv param");
		System.out.println(rsvBfno + "<-- rsvBfno RsvBfDAO.updateRsv param");
			
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "UPDATE rsv_bf SET rsv_date = ?, rsv_time = ?, rsv_member = ?, update_date = NOW() WHERE rsv_bfno = ? ";
			
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setString(1, rsvDate);
		stmt.setString(2, rsvTime);
		stmt.setInt(3, rsvMember);
		stmt.setInt(4, rsvBfno);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
	// 호출 : /customer/hotelBf/insertRsvForm.jsp
	// 호출 : /customer/hotelBf/rsvUpdateForm.jsp
	// cusMail에 따라 예약번호, 체크인, 체크아웃 출력하는 메서드
	public static HashMap<String, Object> selectdate(String cusMail) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail RsvBfDAO.selectdate param");
		
		HashMap<String, Object> m = null;
		
		// DB연동
		Connection  conn = DBHelper.getConnection();
			
		String sql = "SELECT b.rsv_bfno rsvBfno, h.rsv_no rsvNo, c.cus_mail cusMail, h.checkin_date checkinDate, h.checkout_date checkoutDate, b.rsv_member rsvMember "
					+ "FROM rsv_bf b "
					+ "INNER JOIN rsv_hotel h ON b.rsv_no = h.rsv_no "
					+ "INNER JOIN customer c ON h.rsv_mail = c.cus_mail WHERE c.cus_mail = ? ";
			
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			m = new HashMap<String, Object>();
			m.put("rsvBfno", rs.getInt("rsvBfno"));
			m.put("rsvNo", rs.getInt("rsvNo"));
			m.put("cusMail", rs.getString("cusMail"));
			m.put("checkinDate", rs.getString("checkinDate"));
			m.put("checkoutDate", rs.getString("checkoutDate"));
			m.put("rsvMember", rs.getString("rsvMember"));
		}
		conn.close();
		return m;		
	}
}
