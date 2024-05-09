package gdcc.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RsvGolfDAO {

	//rsv_golf 회원의 골프예약 리스트
	//호출 : /customer/golf/rsvGolfList.jsp
	//param : void
	//return : ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>> selectRsvList(String cusMail) throws Exception{
		ArrayList<HashMap<String,Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="SELECT c.cus_name cusName,r.rsv_no rsvNo, r.rsv_date rsvDate, r.rsv_course rsvCourse,"
				+ " r.rsv_Ttime rsvTtime "
				+ "FROM customer c "
				+ "INNER JOIN rsv_golf r "
				+ "ON c.cus_mail = r.rsv_mail "
				+ "WHERE c.cus_mail = ? "
				+ "ORDER BY r.create_date DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, cusMail);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()){
			
			HashMap<String,Object> m = new HashMap<String,Object>();
			
			m.put("cusName", rs.getString("cusName"));
			m.put("rsvNo", rs.getInt("rsvNo"));
			m.put("rsvDate", rs.getString("rsvDate"));
			m.put("rsvCourse", rs.getString("rsvCourse"));
			m.put("rsvTtime", rs.getString("rsvTtime"));
			
			list.add(m);
		}
		
		
		conn.close();
		return list;
	}
	
	//예약한 회원의 상세보기 페이지
	//호출 : /customer/golf/rsvGolfOne.jsp
	//param : int
	//return : HashMap<String,Object>
	
	public static HashMap<String,Object> selectRsvOne(int rsvNo) throws Exception{
		HashMap<String,Object> one = new HashMap<String,Object>();
			
			Connection conn = DBHelper.getConnection();
			
			String sql ="SELECT rsv_course rsvCourse, rsv_mail rsvMail, rsv_date rsvDate, "
					+ "rsv_member rsvMember, rsv_request rsvRequest, rsv_state rsvState, rsv_Ttime rsvTtime "
					+ "FROM rsv_golf "
					+ "WHERE rsv_no = ?";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, rsvNo);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				one.put("rsvCourse", rs.getString("rsvCourse"));
				one.put("rsvMail", rs.getString("rsvMail"));
				one.put("rsvDate", rs.getString("rsvDate"));
				one.put("rsvMember", rs.getInt("rsvMember"));
				one.put("rsvRequest", rs.getString("rsvRequest"));
				one.put("rsvState", rs.getString("rsvState"));
				one.put("rsvTtime", rs.getString("rsvTtime"));
			}
			
		return one;
	}
	
}
