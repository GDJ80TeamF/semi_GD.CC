package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class RoomDAO {
	// 룸 추가
	public static int insertRoom(int roomGrade, int roomPrice, 
			String roomInfo, int roomMax, String roomState, String fileName)throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		
		String sql = "INSERT INTO rooms_hotel(room_grade, room_price, room_info, "
				+ "room_max, room_state, room_img ) "
				+ "VALUES (?, ?, ?, ?, ?, ?) ";
		
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, roomGrade);
		stmt.setInt(2, roomPrice);
		stmt.setString(3, roomInfo);
		stmt.setInt(4, roomMax);
		stmt.setString(5, roomState);
		stmt.setString(6, fileName);
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
				+ "FROM rooms_hotel "
				+ "ORDER BY roomNo ASC LIMIT ?, ? ";
		PreparedStatement stmt1 = null;
		stmt1 = conn1.prepareStatement(sql1);
		stmt1.setInt(1, startRow);
		stmt1.setInt(2, rowPerPage);
		
		ResultSet rs1 = stmt1.executeQuery();
		
		while(rs1.next()) {
			HashMap<String, Object> m1 = new HashMap<String, Object>();
			m1.put("roomNo", rs1.getInt("roomNo"));
			m1.put("roomGrade", rs1.getInt("roomGrade"));
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
}
