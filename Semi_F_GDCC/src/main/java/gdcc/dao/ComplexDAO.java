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
	public static int updateComplex(int complexNo, String complexName, String complexState, String complexInfo) throws Exception{
		int row = 0;
		
		Connection conn = DBHelper.getConnection();
		String sql = "UPDATE hotel_complex SET complex_name =?, complex_state=?, complex_info=?, update_date =NOW() WHERE complex_no=? ";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, complexName);
		stmt.setString(2, complexState);
		stmt.setString(3, complexInfo);
		stmt.setInt(4, complexNo);
		
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	//호출 /hotelComplex/insertRsvForm.jsp
		//param- X
		//return ArrayList<HashMap<String,Object>>
		public static ArrayList<HashMap<String,Object>> selectComplexNo () throws Exception {
			ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>> ();
			Connection conn = DBHelper.getConnection();
			String sql = "SELECT complex_no, complex_name FROM hotel_complex WHERE complex_state = '사용가능'";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				HashMap<String,Object> m = new HashMap<String,Object>();
				
				m.put("complexNo", rs.getInt("complex_no"));
				m.put("complexName", rs.getString("complex_name"));
				
				list.add(m);
				
			}
			conn.close();
			return list;
		}
		
	// 삭제 전 아이디비번 체크 구간
		public static boolean deleteCkIdPw(String checkId, String checkPw) throws Exception{
			boolean result = false;
			Connection conn = DBHelper.getConnection();
			String sql = "SELECT admin_mail FROM admin WHERE admin_mail=? AND admin_pw=PASSWORD(?)";
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
	// 삭제
	public static int deleteRoom(int complexNo) throws Exception{
		int row = 0;
		
		Connection conn = DBHelper.getConnection();
		String sql = "DELETE FROM hotel_complex WHERE complex_no=? ";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, complexNo);
		
		row = stmt.executeUpdate();
		return row;	
	}
	
	// complex 상태 업데이트
	public static int updateComplexState(int complexNo, String complexState) throws Exception{
		int row = 0;
		
		Connection conn = DBHelper.getConnection();
		String sql = "UPDATE hotel_complex SET complex_state=? WHERE complex_no=? ";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, complexState);
		stmt.setInt(2, complexNo);
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
}
