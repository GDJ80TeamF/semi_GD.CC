package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;


public class RoomDAO {
	// 룸 추가
	public static int insertRoom(String roomGrade, int roomPrice, 
			String roomInfo, int roomMax, String roomState, String roomImg)throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		
		String sql = "INSERT INTO room_hotel(room_grade, room_price, room_info, "
				+ "room_max, room_state, room_img) "
				+ "VALUES (?, ?, ?, ?, ?, ?) ";
		
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, roomGrade);
		stmt.setInt(2, roomPrice);
		stmt.setString(3, roomInfo);
		stmt.setInt(4, roomMax);
		stmt.setString(5, roomState);
		stmt.setString(6, roomImg);
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	// 룸 리스트
	public static ArrayList<HashMap<String, Object>> selectRoom(int startRow, int rowPerPage) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		Connection conn1 = DBHelper.getConnection();
		
		String sql1 = "SELECT room_no roomNo, room_grade roomGrade, room_price roomPrice, "
				+ "room_info roomInfo, room_max roomMax, "
				+ "room_state roomState, room_img roomImg "
				+ "FROM room_hotel "
				+ "ORDER BY roomNo ASC LIMIT ?, ? ";
		PreparedStatement stmt1 = null;
		stmt1 = conn1.prepareStatement(sql1);
		stmt1.setInt(1, startRow);
		stmt1.setInt(2, rowPerPage);
		
		ResultSet rs1 = stmt1.executeQuery();
		
		while(rs1.next()) {
			HashMap<String, Object> m1 = new HashMap<String, Object>();
			m1.put("roomNo", rs1.getInt("roomNo"));
			m1.put("roomGrade", rs1.getString("roomGrade"));
			m1.put("roomPrice", rs1.getInt("roomPrice"));
			m1.put("roomInfo", rs1.getString("roomInfo"));
			m1.put("roomMax", rs1.getInt("roomMax"));
			m1.put("roomState", rs1.getString("roomState"));
			m1.put("roomImg", rs1.getString("roomImg"));
			list.add(m1);
		}
		
		conn1.close();
		return list;
	}
	
	// 룸 상태(공사중, 사용가능중 선택) 변경
	public static int updateRoomState(int roomNo, String roomState) throws Exception{
		int row = 0;
		Connection conn = null;
		conn = DBHelper.getConnection();
		
		String sql = "UPDATE room_hotel SET room_state =? WHERE room_no= ?";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, roomState);
		stmt.setInt(2, roomNo);
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	
	// 룸 상세정보
	public static HashMap<String, Object> selectRoom(int roomNo) throws Exception {
		HashMap<String, Object> resultMaps = new HashMap<String, Object>();
		
		// db 연결
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT room_no roomNo, room_grade roomGrade, room_price roomPrice, "
				+ "room_info roomInfo, room_max roomMax, room_state roomState, room_img roomImg "
				+ "FROM room_hotel "
				+ "WHERE room_no=? ";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, roomNo);
		
		ResultSet rs = null;
		rs = stmt.executeQuery();
		
		if(rs.next()) {
			resultMaps.put("roomNo", rs.getInt("roomNo"));
			resultMaps.put("roomGrade", rs.getString("roomGrade"));
			resultMaps.put("roomPrice", rs.getInt("roomPrice"));
			resultMaps.put("roomInfo", rs.getString("roomInfo"));
			resultMaps.put("roomMax", rs.getInt("roomMax"));
			resultMaps.put("roomState", rs.getString("roomState"));
			resultMaps.put("roomImg", rs.getString("roomImg"));
		}
		
		conn.close();
		return resultMaps;
	}
	
	// 룸 수정
	public static int updateRoom(int roomNo, String roomGrade, int roomPrice, 
			int roomMax, String roomState, String fileName) throws Exception {
		int row =0;
		
		// db 연결
		Connection conn = DBHelper.getConnection();
		
		String sql = "UPDATE room_hotel SET room_grade =?, "
				+ "room_price=?, room_max=?, room_state=?, room_img=?, update_date=NOW() "
				+ "WHERE room_no =? ";
		
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, roomGrade);
		stmt.setInt(2, roomPrice);
		stmt.setInt(3, roomMax);
		stmt.setString(4, roomState);
		stmt.setString(5, fileName);
		stmt.setInt(6, roomNo);
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	
	// 아이디 비번체크하여 룸 삭제
	public static boolean roomCheckIdPw(String checkId, String checkPw) throws Exception{
		boolean result = false;
		
		// db 연결
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT admin_mail adminMail FROM admin WHERE admin_mail=? AND admin_pw=? ";
		
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, checkId);
		stmt.setString(2, checkPw);
		
		ResultSet rs = null;
		rs = stmt.executeQuery();
		if(rs.next()) {
			result = true;
		}
		
		conn.close();
		return result;
	}
}
