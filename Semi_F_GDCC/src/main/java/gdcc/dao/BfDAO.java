package gdcc.dao;
import java.util.*;
import java.sql.*;

public class BfDAO {
	//호출 -bfMenuList.jsp
	//param - X
	//return ArrayList<HashMap<String,Object>> 
	public static ArrayList<HashMap<String,Object>> selectBfMenu() throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT * FROM bf_menu";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("menuNo", rs.getInt("menu_no"));
			m.put("menuSeason", rs.getString("menu_season"));
			m.put("menuMain", rs.getString("menu_main"));
			m.put("menuInfo", rs.getString("menu_info"));
			m.put("menuImg", rs.getString("menu_img"));
			m.put("updateDate", rs.getString("update_date"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	//호출 - bfOne.jsp
	//param - int menuNo
	//return HashMap<String,Object>
	public static HashMap<String,Object> selectbfOne(int menuNo) throws Exception{
		HashMap<String,Object> m = new HashMap<String,Object>();
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT * FROM bf_menu WHERE menu_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, menuNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			m.put("menuNo", rs.getInt("menu_no"));
			m.put("menuSeason", rs.getString("menu_season"));
			m.put("menuMain", rs.getString("menu_main"));
			m.put("menuInfo", rs.getString("menu_info"));
			m.put("menuImg", rs.getString("menu_img"));
			m.put("createDate", rs.getString("create_date"));
			m.put("updateDate", rs.getString("update_date"));
			
		}
		conn.close();
		return m;
	}
	//호출 - updateBfOneAction.jsp
	//param - int menuNo
	
	// 조식예약 작성하는 메서드
	public static int insertRsv(int rsvNo, String rsvDate, String rsvTime, int rsvMember,int rsvMenu) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvNo + "<-- rsvNo BfDAO.insertRsv param");
		System.out.println(rsvDate + "<-- rsvDate BfDAO.insertRsv param");
		System.out.println(rsvTime + "<-- rsvTime BfDAO.insertRsv param");
		System.out.println(rsvMember + "<-- rsvMember BfDAO.insertRsv param");
		System.out.println(rsvMenu + "<-- rsvMenu BfDAO.insertRsv param");
		
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
	public static HashMap<String, Object> selectRsvOne(int rsvNo) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvNo + "<-- rsvNo BfDAO.selectRsv param");
		
		HashMap<String, Object> resultMap = null;
		
		// DB연동
		Connection  conn = DBHelper.getConnection();
			
		String sql = "SELECT rsv.rsv_no rsvNo, rsv.rsv_date rsvDate, rsv.rsv_time rsvTime, rsv.rsv_member rsvMember, "
				+ " rsv.rsv_state rsvState, menu.menu_main menuMain, menu.menu_info menuInfo, "
				+ " menu.menu_img menuImg "
				+ " FROM rsv_bf rsv INNER JOIN bf_menu menu "
				+ " ON rsv.rsv_menu = menu.menu_no "
				+ " WHERE rsv_no = ? ";
			
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, rsvNo);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			resultMap = new HashMap<String, Object>();
			resultMap.put("rsvNo", rs.getInt("rsvNo"));
			resultMap.put("rsvDate", rs.getString("rsvDate"));
			resultMap.put("rsvTime", rs.getString("rsvTime"));
			resultMap.put("rsvMember", rs.getInt("rsvMember"));
			resultMap.put("rsvState", rs.getString("rsvState"));
			resultMap.put("menuMain", rs.getString("menuMain"));
			resultMap.put("menuInfo", rs.getString("menuInfo"));
			resultMap.put("menuImg", rs.getString("menuImg"));
		}
		conn.close();
		return resultMap;		
	}
	// rsvNo가 ?인 조식예약 삭제하는 메서드
	public static int deleteRsv(int rsvNo) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvNo + "<-- rsvNo BfDAO.deleteRsv param");
				
		int row = 0;
		
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "DELETE from rsv_bf WHERE rsv_no = ?";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, rsvNo);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
	//호출 - updateBfOneForm.jsp
	//param - String menuSeason,String menuMain,String menuInfo, String menuImg,int menuNo
	//return - int 
	public static int updateBfOne(int menuNo,String menuSeason,String menuMain, String menuInfo,String menuImg ) throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql ="UPDATE bf_menu SET menu_season =?, menu_main =?, menu_info =?, menu_img=?,update_date=now() WHERE menu_no =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,menuSeason);
		stmt.setString(2,menuMain);
		stmt.setString(3,menuInfo);
		stmt.setString(4,menuImg);
		stmt.setInt(5,menuNo);
		
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
		
		
	}
}
