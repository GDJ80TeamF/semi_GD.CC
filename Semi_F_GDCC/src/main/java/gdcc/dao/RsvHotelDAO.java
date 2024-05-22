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
	
	//호텔예약 총 갯수 구하기
	//호출 : /admin/rsvHotelList.jsp
	//param : void
	//return : ArrayList
	public static HashMap<String,Object> rsvHotelCnt() throws Exception{
		HashMap<String,Object> cnt = 
			new HashMap<String,Object>();
	
	Connection conn = DBHelper.getConnection();
	
	String sql ="SELECT COUNT(*) cnt FROM rsv_hotel";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	
		while(rs.next()) {
			cnt.put("hotelCnt", rs.getInt("cnt"));
		}
		
	conn.close();
	return cnt;
	}
	
	
	//호텔 예약리스트 가져오기
	//호출 : /admin/rsvHotelList.jsp
	//param : void
	//retunr : ArrayList
	
	public static ArrayList<HashMap<String,Object>>rsvList(
			int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT c.cus_name cusName, c.cus_contact cusContact, r.rsv_no rsvNo, "
				+ "r.room_no roomNo, r.checkin_date checkinDate, r.rsv_state rsvState "
				+ "FROM rsv_hotel r "
				+ "INNER JOIN customer c "
				+ "ON c.cus_mail = r.rsv_mail "
				+ "ORDER BY r.checkin_date DESC LIMIT ?, ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, startRow);
			stmt.setInt(2, rowPerPage);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
				m.put("name", rs.getString("cusName"));
				m.put("contact", rs.getString("cusContact"));
				m.put("rsvNo", rs.getInt("rsvNo"));
				m.put("roomNo", rs.getInt("roomNo"));
				m.put("rsvState", rs.getString("rsvState"));
				
				list.add(m);
		}
		
		conn.close();
		return list;
	}
	
	//고객예약 상세페이지
	//호출 : admin/rsvHotelOne.jsp
	//param : rsvNo
	//return : HashMap

	public static HashMap<String,Object> rsvHotelOne(int rsvNo) throws Exception{
		HashMap<String,Object>one = new HashMap<String,Object>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="SELECT c.cus_name name, c.cus_mail mail, c.cus_contact contact, r.checkin_date checkin, "
				+ "r.checkout_date checkout, r.rsv_member member, r.rsv_request request "
				+ "FROM rsv_hotel r INNER JOIN customer c "
				+ "ON r.rsv_mail = c.cus_mail "
				+ "WHERE rsv_no = ? ";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, rsvNo);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			one.put("name", rs.getString("name"));
			one.put("mail", rs.getString("mail"));
			one.put("contact", rs.getString("contact"));
			one.put("checkin", rs.getString("checkin"));
			one.put("checkout", rs.getString("checkout"));
			one.put("member", rs.getString("member"));
			one.put("request", rs.getString("request"));
		}
		
		conn.close();
		return one;
	}
	
	//호텔 예약상태 변경하기
	//호출 : adimin/action/rsvHotelStateAction.jsp
	//param : int rsvNo, String rsvState
	//return : int
	
	public static int updateRsvState(String rsvState, int rsvNo) throws Exception{
			int row = 0;
			
			Connection conn = DBHelper.getConnection();
			
			String sql ="UPDATE rsv_hotel "
					+ "SET rsv_state = ? "
					+ "WHERE rsv_no = ?";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, rsvState);
				stmt.setInt(2, rsvNo);
		
			row = stmt.executeUpdate();
			
			conn.close();
			return row;
	}
	//체크인/체크아웃에따른 예약가능 룸리스트 뽑기
	//호출 - customer/hotel/insertNewRsvForm.jsp
	//param - String checkinDate, String checkoutDate
	//return ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>> selectRoomList (String checkinDate,String checkoutDate) throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT * FROM room_hotel WHERE room_no NOT IN(SELECT room_no FROM rsv_hotel "
				+ " WHERE (checkin_date BETWEEN ? AND ?) "
				+ " AND (checkout_date BETWEEN ? AND ? )) AND room_state = '투숙가능'";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, checkinDate);
		stmt.setString(2, checkoutDate);
		stmt.setString(3, checkinDate);
		stmt.setString(4, checkoutDate);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("roomNo",rs.getInt("room_no"));
			m.put("roomGrade",rs.getString("room_grade"));
			m.put("roomPrice",rs.getInt("room_price"));
			m.put("roomInfo",rs.getString("room_info"));
			m.put("roomMax",rs.getInt("room_max"));
			m.put("roomImg",rs.getString("room_img"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	//호텔룸 예약하는 DAO
	//호출 -customer/hotel/insertNewRsvAction.jsp
	//param - int roomNo, String checkinDate, String checkoutDate, String rsvMail, int rsvMember, String rsvRequest
	//return int
	public static int insertRsv (int roomNo,String checkinDate,String checkoutDate,String rsvMail,int rsvMember, String rsvRequest) throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql = "INSERT INTO rsv_hotel (room_no, checkin_date,checkout_date, rsv_mail, rsv_member, rsv_request,create_date, update_date) "
				+ " VALUES(?,?,?,?,?,?,NOW(),NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,roomNo );
		stmt.setString(2,checkinDate );
		stmt.setString(3,checkoutDate );
		stmt.setString(4,rsvMail );
		stmt.setInt(5,rsvMember );
		stmt.setString(6,rsvRequest );
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
		
	}
	
	// 고객 호텔 예약 변경
	// 호출
	public static int updateCusRsv(int rsvNo, String rsvMail, String cusCheckIn, String cusCheckOut, int cusMember, String cusRequest) throws Exception {
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql = "UPDATE rsv_hotel SET rsv_mail=?, checkin_date=?, checkout_date=?, "
				+  "rsv_member =?, rsv_request=?, update_date=NOW() "
				+ "WHERE rsv_no=?  ";
		PreparedStatement stmt = null;
		  stmt  = conn.prepareStatement(sql);
		  stmt.setString(1, rsvMail);
		  stmt.setString(2, cusCheckIn);
		  stmt.setString(3, cusCheckOut);
		  stmt.setInt(4, cusMember);
		  stmt.setString(5, cusRequest);
		  stmt.setInt(6, rsvNo);
		  
		  row = stmt.executeUpdate();
		  
		  conn.close();
		  return row;
	}
	
	// 고객 checkId
	public static boolean cancelIdPw(String checkId, String checkPw) throws Exception {
		boolean result = false;
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT cus_mail FROM customer WHERE cus_mail=? AND cus_pw=PASSWORD(?) ";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, checkId);
		stmt.setString(2, checkPw);
		
		ResultSet rs = null;
		rs = stmt.executeQuery();
		
		if(rs.next()) {
			result = true;
		}else {
			result = false;
		}
		
		conn.close();
		return result;
	}
	
	// 룸 예약 취소
	public static int CancelcusRsv(int rsvNo) throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql = "DELETE FROM rsv_hotel WHERE rsv_no=? ";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, rsvNo);
		
		row = stmt.executeUpdate();
		
		return row;
	}
	//호출 : mainBoard.jsp
	//param: X
	//return: ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>> checkinToday() throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT rh.*, c.cus_name,r.room_grade FROM rsv_hotel rh "
				+ "INNER JOIN customer c ON rh.rsv_mail = c.cus_mail INNER JOIN room_hotel r ON rh.room_no = r.room_no "
				+ "WHERE checkin_date = CURDATE() ORDER BY rh.rsv_no DESC LIMIT 5";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("rsvNo", rs.getInt("rh.rsv_no"));
			m.put("rsvName", rs.getString("c.cus_name"));
			m.put("rsvGrade", rs.getString("r.room_grade"));
			m.put("checkoutDate", rs.getString("rh.checkout_date"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	//호출 : mainBoard.jsp
	//param: X
	//return: ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>> checkoutToday() throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT rh.*, c.cus_name,r.room_grade FROM rsv_hotel rh "
				+ "INNER JOIN customer c ON rh.rsv_mail = c.cus_mail INNER JOIN room_hotel r ON rh.room_no = r.room_no "
				+ "WHERE checkout_date = CURDATE() ORDER BY rh.rsv_no DESC LIMIT 5";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("rsvNo", rs.getInt("rh.rsv_no"));
			m.put("rsvName", rs.getString("c.cus_name"));
			m.put("rsvGrade", rs.getString("r.room_grade"));
			m.put("checkinDate", rs.getString("rh.checkin_date"));
			list.add(m);
		}
		conn.close();
		return list;
	}
}
