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
	// 호출 : /customer/hotelBf/action/rsvDeleteAction.jsp
	// rsvBfno가 ?인 조식예약 삭제하는 메서드
	public static int deleteRsv(int rsvBfno) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvBfno + "<-- rsvNo BfDAO.deleteRsv param");
				
		int row = 0;
		
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "DELETE from rsv_bf WHERE rsv_bfno = ?";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, rsvBfno);

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
			
		String sql = "SELECT h.rsv_no rsvNo, c.cus_mail cusMail, h.checkin_date checkinDate, h.checkout_date checkoutDate, h.rsv_member rsvMember "
					+ "FROM rsv_hotel h INNER JOIN customer c ON h.rsv_mail = c.cus_mail "
					+ "WHERE c.cus_mail = ? order BY h.create_date DESC;";
			
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			m = new HashMap<String, Object>();
			m.put("rsvNo", rs.getInt("rsvNo"));
			m.put("cusMail", rs.getString("cusMail"));
			m.put("checkinDate", rs.getString("checkinDate"));
			m.put("checkoutDate", rs.getString("checkoutDate"));
			m.put("rsvMember", rs.getString("rsvMember"));
		}
		conn.close();
		return m;		
	}
	//조식예약 총갯수 구하기
	//호출 : admin/rsvHotelList.jsp
	//param : void
	//return : HashMap
	
	public static HashMap<String,Object>rsvBfCnt() throws Exception{
		HashMap<String,Object> cnt = new HashMap<String,Object>();
		
		Connection  conn = DBHelper.getConnection();
		
		String sql ="SELECT COUNT(*) cnt FROM rsv_bf";

		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
			while(rs.next()) {
				cnt.put("bfCnt", rs.getInt("cnt"));
			}
			
		conn.close();
		return cnt;
	}
	
	//조식 예약리스트 구하기
	//호출 : admin/rsvHotelList.jsp
	//param : void
	//return : ArrayList

	public static ArrayList<HashMap<String,Object>> rsvList() throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		
		Connection  conn = DBHelper.getConnection();
		
		String sql ="SELECT b.rsv_bf_no rsvBfNo, h.room_no roomNo, b.rsv_date rsvDate, b.rsv_time rsvTime, b.rsv_state rsvState "
				+ "FROM rsv_hotel h "
				+ "INNER JOIN rsv_bf b ON h.rsv_no = b.rsv_no ORDER BY b.rsv_date DESC";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String, Object>();
			
				m.put("rsvBfNo", rs.getInt("rsvBfNo"));
				m.put("roomNo", rs.getInt("roomNo"));
				m.put("rsvDate", rs.getString("rsvDate"));
				m.put("rsvTime", rs.getString("rsvTime"));
				m.put("rsvState", rs.getString("rsvState"));
				
			list.add(m);
		}
		
		return list;
	}
	
	//조식예약 상세보기
	//호출 : admin/rsvBfOne.jsp
	//param : int rsvBfNo
	//return : HashMap
	
	public static HashMap<String,Object> rsvBfOne(int rsvBfNo) throws Exception{
		HashMap<String,Object> one = new HashMap<String,Object>();
		
			Connection  conn = DBHelper.getConnection();
				
			String sql ="SELECT b.rsv_bf_no rsvBfNo, h.room_no roomNo, h.rsv_mail rsvMail, b.rsv_date rsvDate, "
					+ "b.rsv_time rsvTime, b.rsv_member rsvMember, b.rsv_menu rsvMenu "
					+ "FROM rsv_bf b "
					+ "INNER JOIN rsv_hotel h "
					+ "ON b.rsv_no = h.rsv_no "
					+ "WHERE b.rsv_bf_no = ? "
					+ "ORDER BY rsv_date DESC";
		
			PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, rsvBfNo);
				
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				one.put("rsvBfNo", rs.getInt("rsvBfNo"));
				one.put("roomNo", rs.getInt("roomNo"));
				one.put("rsvMail", rs.getString("rsvMail"));
				one.put("rsvDate", rs.getString("rsvDate"));
				one.put("rsvTime", rs.getString("rsvTime"));
				one.put("rsvMember", rs.getInt("rsvMember"));
				one.put("rsvMenu", rs.getInt("rsvMenu"));
				
			}
		return one;
	}
}
