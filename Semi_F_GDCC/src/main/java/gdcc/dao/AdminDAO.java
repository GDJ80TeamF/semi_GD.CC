package gdcc.dao;
import java.util.*;
import java.sql.*;


public class AdminDAO {
	public static HashMap<String,Object> selectAdminLogin(String adminMail,String adminPw) throws Exception{
		HashMap<String,Object> m = null;
		
		//db접근
		Connection con = DBHelper.getConnection();
		
		String sql = "select admin_mail adminMail,admin_name adminName, admin_pw adminPw from admin where admin_mail =? and admin_pw=?";
		PreparedStatement stmt  = con.prepareStatement(sql);
		stmt.setString(1, adminMail);
		stmt.setString(2, adminPw);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			//결과물이 있으면resultmap에채우기
			m = new HashMap<String,Object>();
			m.put("adminMail", rs.getString("adminMail"));
			m.put("adminName", rs.getString("adminName"));
			
		}
		con.close();
		return m;
	}
}
