package gdcc.dao;
import java.util.*;
import java.sql.*;


public class AdminDAO {
	public static HashMap<String,Object> selectAdminLogin(String adminMail,String adminPw) throws Exception{
		HashMap<String,Object> m = null;
		
		//db접근
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT admin_no adminNo, admin_mail adminMail,admin_name adminName, admin_pw adminPw FROM admin WHERE admin_mail =? AND admin_pw=password(?)";
		PreparedStatement stmt  = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
		stmt.setString(2, adminPw);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			//결과물이 있으면resultmap에채우기
			m = new HashMap<String,Object>();
			m.put("adminNo", rs.getInt("adminNo"));
			m.put("adminMail", rs.getString("adminMail"));
			m.put("adminName", rs.getString("adminName"));
			
		}
		conn.close();
		return m;
	}
	public static boolean selectIdCk(String checkId) throws Exception{
		boolean ck = false;
		//db접근
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT admin_mail adminMail FROM admin where admin_mail = ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, checkId);
		ResultSet rs = stmt.executeQuery();
		//읽어올 행이있으면 -> 이미 존재하는 아이디 ck = true , 없음 ck = false
		if(rs.next()) { // 아이디 사용불가 
			ck = true;
		}
		conn.close();
		return ck;
}
	//호출 - insertAdminForm.jsp
	// para. - adminMail,adminPw, adminName, adminGender,adminBirth, adminContact
	public static int insertAdmin(String adminMail,String adminPw,String adminName,String adminGender,String adminBirth,String adminContact,String adminProfile)throws Exception{
		int row = 0;
		//db접근
		Connection conn = DBHelper.getConnection();
		String sql = "INSERT INTO admin(admin_mail,admin_pw,admin_name,admin_gender,admin_birth,admin_contact,admin_profile) VALUES(?,password(?),?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
		stmt.setString(2, adminPw);
		stmt.setString(3, adminName);
		stmt.setString(4, adminGender);
		stmt.setString(5, adminBirth);
		stmt.setString(6, adminContact);
		stmt.setString(7, adminProfile);
		row = stmt.executeUpdate();
		conn.close();
		return row;
	}
	
}
