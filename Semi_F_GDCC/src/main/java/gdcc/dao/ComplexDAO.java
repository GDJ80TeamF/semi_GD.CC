package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class ComplexDAO {
	// complex List
	public static ArrayList<HashMap<String, Object>>
		selectComplex(int startRow, int rowPerPage) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT complex_no complexNo, complex_name complexName, complex_state complexState,"
				+ "complex_info complexInfo, create_date createDate, update_date updateDate "
				+ "FROM hotel_complex "
				+ "ORDER BY complex_no "
				+ "ASC LIMIT ?, ? ";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, startRow);
		stmt.setInt(2, rowPerPage);
		
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("complexNo", rs.getInt("complexNo"));
			m.put("complexName", rs.getString("complexName"));
			m.put("complexState", rs.getString("complexState"));
			m.put("complexInfo", rs.getString("complexInfo"));
			m.put("createDate", rs.getString("createDate"));
			m.put("updateDate", rs.getString("updateDate"));
			list.add(m);
		}
		
		conn.close();
		return list;
	}
	
	// complex 상세정보
	public static HashMap<String, Object> selectComplexOne(int complexNo) throws Exception{
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT complex_no complexNo, complex_name complexName, "
				+ "complex_state complexState, complex_info complexInfo, "
				+ "create_date createDate, update_date updateDate "
				+ "FROM hotel_complex "
				+ "WHERE complex_no=? ";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, complexNo);
		
		ResultSet rs1 = null;
		rs1 = stmt.executeQuery();
		
		if(rs1.next()) {
			resMap.put("complexNo", rs1.getInt("complexNo"));
			resMap.put("complexName", rs1.getString("complexName"));
			resMap.put("complexState", rs1.getString("complexState"));
			resMap.put("complexInfo", rs1.getString("complexInfo"));
			resMap.put("createDate", rs1.getString("createDate"));
			resMap.put("updateDate", rs1.getString("updateDate"));
		}
		
		conn.close();
		return resMap;
	}
	
	// complex 수정
	public static int updateComplex(int complexNo, String complexState, String complexInfo) throws Exception{
		int row = 0;
		
		Connection conn = DBHelper.getConnection();
		String sql = "UPDATE hotel_complex SET complex_state=?, complex_info=? WHERE complex_no=? ";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, complexState);
		stmt.setString(2, complexInfo);
		stmt.setInt(3, complexNo);
		
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
}
