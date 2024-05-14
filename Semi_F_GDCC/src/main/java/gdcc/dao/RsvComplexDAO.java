package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class RsvComplexDAO {
	
	//부대시설 예약 총 갯수 출력
	//호출 : rsvHotelList.jsp
	//param : void
	//return : HashMap
	public static HashMap<String,Object> rsvComplexCnt() throws Exception{
			HashMap<String,Object> cnt = 
				new HashMap<String,Object>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="SELECT COUNT(*) cnt FROM rsv_complex";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
		
			cnt.put("comCnt", rs.getInt("cnt"));
			

		}
		
		conn.close();
		return cnt;
	}
	
	//부대시설 예약리스트 출력
	//호출 : rsvHotelList.jsp
	//param : void
	//return : ArrayList

	public static ArrayList<HashMap<String,Object>>rsvList(int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String,Object>> list
			= new ArrayList<HashMap<String,Object>>();
		
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT c.rsv_comno comNo, h.room_no roomNo, hc.complex_name complexName, c.rsv_date rsvDate, "
				+ "c.rsv_time rsvTime, c.rsv_state rsvState "
				+ "FROM rsv_complex c "
				+ "INNER JOIN rsv_hotel h "
				+ "INNER JOIN hotel_complex hc "
				+ "ON c.rsv_no = h.rsv_no "
				+ "AND c.rsv_place = hc.complex_no "
				+ "ORDER BY c.rsv_time DESC LIMIT ?,?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, startRow);
			stmt.setInt(2, rowPerPage);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			
			m.put("comNo", rs.getInt("comNo"));
			m.put("roomNo", rs.getInt("roomNo"));
			m.put("complexName", rs.getString("complexName"));
			m.put("rsvDate", rs.getString("rsvDate"));
			m.put("rsvTime", rs.getString("rsvTime"));
			m.put("rsvState", rs.getString("rsvState"));
			
			list.add(m);
		}
		
		return list;
	}
	
	
	
	//호출 - /hotelComplex/insertRsvAction.jsp
	//param - int rsvNo,String rsvDate,int rsvPlace, rsvtime,rsvMember
	//return - int row 
		public static int insertRsv(int rsvNo, String rsvDate, int rsvPlace, String rsvTime,int rsvMember) throws Exception{
			int row = 0;
			Connection conn = DBHelper.getConnection();
			String sql = "INSERT INTO rsv_complex(rsv_no,rsv_date,rsv_place,rsv_time,rsv_member,create_date,update_date) VALUES(?,?,?,?,?,NOW(),NOW())";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1,rsvNo);
			stmt.setString(2,rsvDate);
			stmt.setInt(3,rsvPlace);
			stmt.setString(4,rsvTime);
			stmt.setInt(5,rsvMember);
			
			row = stmt.executeUpdate();
			conn.close();
			return row;
		
		}
	//회원 아이디로 예약된 complexlist 출력하기 
	//호출 - /hotelComplex/rsvComplexList.jsp,
	//param - cusMail
	//return ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>> selectRsvList (String cusMail) throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT c.*,hc.complex_name FROM rsv_complex c INNER JOIN rsv_hotel h ON c.rsv_no = h.rsv_no INNER JOIN hotel_complex hc ON c.rsv_place = hc.complex_no WHERE h.rsv_mail =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,cusMail);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("comNo",rs.getInt("c.rsv_comno"));
			m.put("rsvNo",rs.getInt("c.rsv_no"));
			m.put("rsvPlace",rs.getString("hc.complex_name"));
			m.put("rsvDate",rs.getString("c.rsv_date"));
			m.put("rsvTime",rs.getString("c.rsv_time"));
			m.put("rsvMember",rs.getString("c.rsv_member"));
			m.put("rsvState",rs.getString("c.rsv_state"));
			m.put("createDate",rs.getString("c.create_date"));
			list.add(m);
			
		}
		conn.close();
		return list;
	}
	//호출 - /hotelComplex/rsvComplexOne.jsp,
		//param - rsvComNo
		//return ArrayList<HashMap<String,Object>>
		public static HashMap<String,Object> selectRsvOne (int rsvComNo) throws Exception{
			HashMap<String,Object> m = new HashMap<String,Object>();
			Connection conn = DBHelper.getConnection();
			String sql = "SELECT c.*,hc.complex_name FROM rsv_complex c INNER JOIN hotel_complex hc ON c.rsv_place = hc.complex_no WHERE c.rsv_comno=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1,rsvComNo);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				
				m.put("comNo",rs.getInt("c.rsv_comno"));
				m.put("rsvNo",rs.getInt("c.rsv_no"));
				m.put("rsvPlace",rs.getString("hc.complex_name"));
				m.put("rsvPlaceNo",rs.getInt("c.rsv_place"));
				m.put("rsvDate",rs.getString("c.rsv_date"));
				m.put("rsvTime",rs.getString("c.rsv_time"));
				m.put("rsvMember",rs.getInt("c.rsv_member"));
				m.put("createDate",rs.getString("c.create_date"));
				m.put("updateDate",rs.getString("c.update_date"));
				
				
			}
			conn.close();
			return m;
		}
	//호출 - cancelRsvAction.jsp
	//param - int rsvComNo
	//return int
	public static int deleteRsv(int rsvComNo) throws Exception {
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql ="DELETE FROM rsv_complex WHERE rsv_comno =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,rsvComNo);
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	//호출 - updateRsvAction.jsp
	//param - String rsvDate, String rsvTime, int rsvMember,int rsvComNo
	//return - int
	public static int updateRsv (String rsvDate,String rsvTime, int rsvMember,int rsvComNo) throws Exception {
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql = "UPDATE rsv_complex SET rsv_date=?, rsv_time=?, rsv_member=? WHERE rsv_comno = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, rsvDate);
		stmt.setString(2, rsvTime);
		stmt.setInt(3, rsvMember);
		stmt.setInt(4, rsvComNo);
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
		
	}
	//호출 - hotelComplex/inssertRsvForm.jsp/ updateRsvForm.jsp
	//고객이 입력한 장소+날짜 를 비교해서 예약가능한 시간만 출력 -> 우선 전체시간대임시테이블 alltimes 생성후 비교 
	//param - int rsvPlace, String rsvDate
	//return - ArrayList<HashMap<String,String>>
	public static ArrayList<HashMap<String,Object>> selectTimes (int rsvPlace,String rsvDate) throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT all_times.each_time"
				+ " FROM "
				+ " (SELECT '12시' AS each_time"
				+ " UNION "
				+ " SELECT '13시'"
				+ " UNION "
				+ " SELECT '14시'"
				+ " UNION "
				+ " SELECT '15시'"
				+ " UNION "
				+ " SELECT '16시'"
				+ " UNION "
				+ " SELECT '17시'"
				+ " UNION "
				+ " SELECT '18시')"
				+ " all_times "
				+ "WHERE all_times.each_time NOT IN "
				+ " (SELECT c.rsv_time"
				+ " FROM rsv_complex c"
				+ " WHERE c.rsv_place = ? and c.rsv_date = ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,rsvPlace);
		stmt.setString(2,rsvDate);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("rsvTime", rs.getString("all_times.each_time"));
			list.add(m);
			
		}
		conn.close();
		return list;
		
	}

}
