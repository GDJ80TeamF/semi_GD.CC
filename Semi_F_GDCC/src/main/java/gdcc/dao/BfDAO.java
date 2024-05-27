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
		String sql = "SELECT menu_no,menu_season,menu_main,menu_info,menu_img,update_date FROM bf_menu";
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
		String sql = "SELECT menu_no,menu_season,menu_main,menu_info,menu_img,create_date,update_date FROM bf_menu WHERE menu_no = ?";
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
