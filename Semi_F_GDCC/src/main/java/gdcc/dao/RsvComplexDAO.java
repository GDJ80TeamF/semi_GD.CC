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
				+ "FROM rsv_complex c ";
				
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
	//호출 - /hotelComplex/rsvComplexList.jsp
	//param - cusMail
	//return ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>> selectRsvList (String cusMail) throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT c.*, h.rsv_mail FROM rsv_complex c INNER JOIN rsv_hotel h ON c.rsv_no = h.rsv_no WHERE h.rsv_mail =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,cusMail);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("comNo",rs.getInt("c.rsv_comno"));
			m.put("rsvNo",rs.getInt("c.rsv_no"));
			m.put("rsvPlace",rs.getInt("c.rsv_place"));
			m.put("rsvDate",rs.getString("c.rsv_date"));
			m.put("rsvTime",rs.getString("c.rsv_time"));
			m.put("rsvState",rs.getString("c.rsv_state"));
			list.add(m);
			
		}
		conn.close();
		return list;
	}


}
