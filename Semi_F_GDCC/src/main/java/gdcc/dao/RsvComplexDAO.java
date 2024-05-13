package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class RsvComplexDAO {
	
	//부대시설 예약 총 갯수 출력
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

	public static ArrayList<HashMap<String,Object>> rsvList(int comCount) throws Exception{
		ArrayList<HashMap<String,Object>> list
			= new ArrayList<HashMap<String,Object>>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="SELECT c.rsv_comno rsvComNo, c.rsv_place rsvPlace, c.rsv_date rsvDate, c.rsv_time rsvTime "
				+ "FROM rsv_complex c "
				+ "HAVING COUNT(*) = ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, comCount);
			
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			
				m.put("rsvComNo", rs.getInt("rsvComNo"));
				m.put("rsvPlace", rs.getInt("rsvPlace"));
				m.put("rsvDate", rs.getString("rsvDate"));
				m.put("rsvTime", rs.getString("rsvTime"));
			list.add(m);
		}
		
		return list;
	}

}
