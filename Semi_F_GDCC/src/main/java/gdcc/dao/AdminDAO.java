package gdcc.dao;
import java.util.*;
import java.sql.*;


public class AdminDAO {
	//호출 - adminLoginAction.jsp
	//param - adminMail, adminPw
	// return - HahMap<String,Object>
	public static HashMap<String,Object> selectAdminLogin(String adminMail,String adminPw) throws Exception{
		HashMap<String,Object> m = null;
		
		//db접근
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT admin_mail adminMail,admin_name adminName,admin_grade adminGrade FROM admin WHERE admin_mail =? AND admin_pw=PASSWORD(?) AND admin_active='ON'";
		PreparedStatement stmt  = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
		stmt.setString(2, adminPw);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			//결과물이 있으면resultmap에채우기
			m = new HashMap<String,Object>();
			m.put("adminMail", rs.getString("adminMail"));
			m.put("adminName", rs.getString("adminName"));
			m.put("adminGrade", rs.getInt("adminGrade"));
		}
		conn.close();
		return m;
	}
	//호출 - insertCheckIdAction.jsp
	//param - checkId
	//return boolean
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
		String sql = "INSERT INTO admin(admin_mail,admin_pw,admin_name,admin_gender,admin_birth,admin_contact,admin_profile) VALUES(?,PASSWORD(?),?,?,?,?,?)";
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
	//호출 - insertAdminAction.jsp
	//param - String adminMail,adminPW
	// return - int
	public static int insertNewAdminPwHistory(String adminMail,String adminPw)throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		//회원가입시 첫 비번 이력 추가하기 -> 비교할이력 없음 ;
		String sql ="INSERT INTO admin_pw_history (admin_mail,admin_pw) VALUES (?,PASSWORD(?))";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
		stmt.setString(2, adminPw);
		row = stmt.executeUpdate();
		conn.close();
		return row;
	}
	//호출 - adminCheckAction.jsp
	//param -  adminMail,adminBirth, adminContact
	//return boolean 
	public static boolean selectResetPw(String adminMail,String adminBirth,String adminContact) throws Exception{
		boolean ck = false;
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT admin_mail,admin_name FROM admin WHERE admin_mail =? AND admin_birth=? AND admin_contact=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
		stmt.setString(2, adminBirth);
		stmt.setString(3, adminContact);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) { //읽어올 행이 있을 시 -> 즉 관리자 확인될때 
			ck = true;
		}
		conn.close();
		return ck;
	}
	//호출 - adminResetPwAtion.jsp
	//param - String adminMail, String newPw
	//return int
	//비번 초기화 시에는 이전 비번을 모르므로 최근이력과 일치하는 비번이 없는지만 체크한다.  --> 한번 쓴비번은 다시 못쓴다. 
	public static int insertPwHistory(String adminMail,String newPw) throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql = "INSERT INTO admin_pw_history (admin_mail,admin_pw) SELECT ?,PASSWORD(?) "
				+ "WHERE NOT EXISTS (SELECT admin_pw FROM(SELECT admin_pw FROM admin_pw_history "
				+ "WHERE admin_mail=?) "
				+ "AS recent_history WHERE recent_history.admin_pw = PASSWORD(?))";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
		stmt.setString(2, newPw);
		stmt.setString(3, adminMail);
		stmt.setString(4, newPw);
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	//호출- adminResetPwAction.jsp
	//param - adminMail,newPw
	//return int
	//history에서 가장 최근비번으로 admin 테이블 업데이트 
	public static int updateResetPw(String adminMail,String newPw) throws Exception {
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql = "UPDATE admin SET admin_pw = (SELECT admin_pw FROM admin_pw_history "
				+ "WHERE admin_mail = ? ORDER BY create_date DESC LIMIT 1) "
				+ "WHERE admin_mail =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,adminMail);
		stmt.setString(2, adminMail);
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	//호출 -adminList.jsp
	//param - int startRow,int rowPerPage
	//return ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>>  selectAdminList (String adminMail,int startRow,int rowPerPage) throws Exception{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Connection conn = DBHelper.getConnection();
		//로그인한 본인 제외 admin 리스트 출력 
		String sql = "SELECT admin_mail,admin_name,admin_profile,admin_active FROM admin WHERE admin_mail NOT IN(?) LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
		stmt.setInt(2, startRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("adminMail",rs.getString("admin_mail"));
			m.put("adminName",rs.getString("admin_name"));
			m.put("adminProfile",rs.getString("admin_profile"));
			m.put("adminActive",rs.getString("admin_active"));
			
			list.add(m);
		}
		conn.close();
		return list;
	}
	//호출 - updateStateAdminAction.jsp
	//param - String adminMail,String adminState
	//return int
	public static int updateState (String adminMail,String adminState) throws Exception {
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql = "UPDATE admin SET admin_active = ? WHERE admin_mail=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,adminState);
		stmt.setString(2, adminMail);
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
		
	}
	// 호출 - adminList.jsp
	//param - X
	//return int lastPage
	public static int page () throws Exception{
		int lastPage = 0;
		int rowPerPage = 10;
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT COUNT(*) FROM admin";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		int totalRow = 0;
		if(rs.next()){
			totalRow = rs.getInt("count(*)");
		}
		lastPage = totalRow/rowPerPage;
		if(totalRow%rowPerPage != 0){
			lastPage = lastPage +1;
		}
		conn.close();
		return lastPage;
	}
	//호출 -myPage.jsp
	//param - int adminNo
	//return HashMap<String,Object>
	public static HashMap<String,Object> selectMyPage (String adminMail) throws Exception{
		HashMap<String,Object> m = new HashMap<String,Object>();
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT admin_mail,admin_name,admin_gender,admin_birth,admin_contact,admin_profile,update_date FROM admin WHERE admin_mail =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			m.put("adminMail", rs.getString("admin_mail"));
			m.put("adminName", rs.getString("admin_name"));
			m.put("adminGender", rs.getString("admin_gender"));
			m.put("adminBirth", rs.getString("admin_birth"));
			m.put("adminContact", rs.getString("admin_contact"));
			m.put("adminProfile", rs.getString("admin_profile"));
			m.put("updateDate", rs.getString("update_date"));
			
		}
		conn.close();
		return m;
		
		}
	//호출 - updateMyPageForm.jsp
	//param - adminMail, adminName,adminGender,adminContact,adminProfile
	//return int
	public static int updateMyPage (String adminMail,String adminName,String adminGender,String adminContact,String adminProfile) throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql = "UPDATE admin SET admin_name =? ,admin_gender =?, admin_contact=?, admin_profile=?, update_date = now() WHERE admin_mail =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, adminName);
		stmt.setString(2, adminGender);
		stmt.setString(3, adminContact);
		stmt.setString(4, adminProfile);
		stmt.setString(5, adminMail);
		row = stmt.executeUpdate();
			
		conn.close();
		return row;
	}
	// 아이디 비번 확인하는 메서드 / 삭제확인폼
	public static boolean selectIdPwCk(String checkId, int checkPw) throws Exception{
		boolean ck = false;
		//db접근
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT admin_mail adminMail FROM admin WHERE admin_mail = ? AND admin_pw = PASSWORD(?) ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, checkId);
		stmt.setInt(2, checkPw);
		ResultSet rs = stmt.executeQuery();
		//읽어올 행이있으면 -> 이미 존재하는 아이디 ck = true , 없음 ck = false
		if(rs.next()) { // 인증완료 
			ck = true;
		}
		conn.close();
		return ck;
	}		
	// 호출 - updatePwAction.jsp - 이력추가하는 insert -> oldPw 일치해야하고, 최근 이력에  새 비번이 있으면 안됨 
	//param - String adminMail, String oldPw, String newPw
	//return int
	public static int insertNewPwHistory(String adminMail,String oldPw, String newPw)throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		String sql ="INSERT INTO admin_pw_history(admin_mail,admin_pw) SELECT ?,PASSWORD(?) WHERE "
				+ "(SELECT admin_pw FROM admin_pw_history WHERE admin_mail =? ORDER BY create_date DESC LIMIT 1)=PASSWORD(?) "
				+ "AND NOT EXISTS (SELECT admin_pw FROM (SELECT admin_pw FROM admin_pw_history "
				+ "WHERE admin_mail=?) "
				+ "AS recent_history WHERE admin_pw =PASSWORD(?))";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
		stmt.setString(2, newPw);
		stmt.setString(3, adminMail);
		stmt.setString(4, oldPw);
		stmt.setString(5, adminMail);
		stmt.setString(6, newPw);
		
		row = stmt.executeUpdate();
		conn.close();
		return row;
		
	}
	
	
}
