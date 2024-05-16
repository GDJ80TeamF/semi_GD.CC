package gdcc.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.sql.Connection;


public class CustomerDAO {
	public static HashMap<String, String> selectCusLogin(String cusMail, String cusPw) throws Exception{
		HashMap<String, String> map = null;
		Connection conn1 = null;
		conn1 = DBHelper.getConnection();
	
		String sql1 = "SELECT cus_mail cusMail, cus_pw cusPW FROM customer WHERE cus_mail=? AND cus_pw=PASSWORD(?)";
		PreparedStatement stmt1 = null;
		stmt1 = conn1.prepareStatement(sql1);
		stmt1.setString(1, cusMail);
		stmt1.setString(2, cusPw);
		
		ResultSet rs1 = stmt1.executeQuery();
		if(rs1.next()) {
			map = new HashMap<String, String>();
			map.put("cusMail", rs1.getString("cusMail"));
			map.put("cusPw", rs1.getString("cusPw"));
		}
		
		return map;
		
	}
	
	public static boolean customerCheckId(String checkId) throws Exception {
		boolean result = false;
		
		Connection conn2 = null;
		conn2 = DBHelper.getConnection();
		
		String sql2 = "SELECT cus_mail cusMail FROM customer WHERE cus_mail=?";
		PreparedStatement stmt2 = null;
		stmt2 = conn2.prepareStatement(sql2);
		stmt2.setString(1, checkId);
		ResultSet rs2 = stmt2.executeQuery();
		if(!rs2.next()) { // 사용불가
			result = true;
		}
		
		conn2.close();
		return result;
	}
	
	public static int insertCustomer(String cusMail, String cusName, 
			String cusPw, String cusGender, String cusBirth, String cusContact, String cusFilename) throws Exception{
		int row3 = 0;
		Connection conn3 = null;
		conn3 = DBHelper.getConnection();
		
		String sql3 = "INSERT INTO customer(cus_mail, cus_name, cus_pw, cus_gender, cus_birth, cus_contact, cus_profile) VALUES(?, ?, password(?), ?, ?, ?, ?)";
		PreparedStatement stmt3 = null;
		stmt3 = conn3.prepareStatement(sql3);
		stmt3.setString(1, cusMail);
		stmt3.setString(2, cusName);
		stmt3.setString(3, cusPw);
		stmt3.setString(4, cusGender);
		stmt3.setString(5, cusBirth);
		stmt3.setString(6, cusContact);
		stmt3.setString(7, cusFilename);
		row3 = stmt3.executeUpdate();
			
		conn3.close();
		return row3;	
	}
	
	
	//고객정보 불러오기
	//호출 1. customer/myPage.jsp
	//호출 2. customer/updateMyInfoForm.jsp
		//param : String cusMail
		//return : HahshMap<String,Object>
	public static HashMap<String,Object> selectCustomerInfo(
			String cusMail) throws Exception{
		HashMap<String, Object> info = 
				new HashMap<String, Object>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="SELECT cus_mail cusMail, cus_name cusName, cus_pw cusPw, cus_gender cusGender, "
					+ "cus_birth cusBirth, cus_contact cusContact, cus_profile cusProfile "
					+ "FROM customer "
					+ "WHERE cus_mail = ?";
		
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		 stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
		
		
		  if(rs.next()) { 
		  info.put("cusMail", rs.getString("cusMail"));
		  info.put("cusName", rs.getString("cusName")); 
		  info.put("cusPw", rs.getString("cusPw")); 
		  info.put("cusGender", rs.getString("cusGender"));
		  info.put("cusBirth", rs.getString("cusBirth")); 
		  info.put("cusContact", rs.getString("cusContact")); 
		  info.put("cusProfile", rs.getString("cusProfile")); }
		 
		  conn.close();
		return info;
	}
	
	
	//고객정보 변경
	//호출 : customer/action/updateMyInfoAction.jsp
	//param : String
	//return : int
	
	public static int updateCustomerInfo(
			String cusName, String cusGender, String cusContact, String cusProfile, String cusMail) throws Exception{
		int row = 0;
		
			Connection conn = DBHelper.getConnection();
			
			String sql = "UPDATE customer "
						+ "SET cus_name=?, cus_gender=?, cus_contact=?, cus_profile=?, update_date = NOW() "
						+ "WHERE cus_mail=?";
						
			
			PreparedStatement stmt = conn.prepareStatement(sql);
				//값 들어오면 "" 자리에 넣어주기 
				stmt.setString(1, "cusName");
				stmt.setString(2, "cusGender");
				stmt.setString(3, "cusContact");
				stmt.setString(4, "cusProfile");
				stmt.setString(5, "cusMail");
				
			row= stmt.executeUpdate();
			conn.close();
		return row;
		
		
	}
	//고객 로그인 페이지에서 고객 비밀번호 찾기&변경
	//호출 : customer/action/updatePwAction.jsp
	//param : String(mail, newPw)
	//return : int
	
	
	public static int updatePw(String mail, String newPw) throws Exception{
		int row = 0;
		
			Connection conn = DBHelper.getConnection();
			
			String sql ="INSERT INTO customer_pw_history(cus_mail, cus_pw, create_date) "
					+ "VALUES(?, ?, NOW())";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, mail);
				stmt.setString(2, newPw);
			row = stmt.executeUpdate();
			conn.close();
		return row;
	}
	
	
	//고객 비밀번호 이력을 확인하는 메소드
	//customer/updatePwAction.jsp
	//param : mail, oldPw, newPw
	//return : int
	
	public static int insertPw(String mail, String oldPw, String newPw) throws Exception{
		int row = 0;
		
			Connection conn = DBHelper.getConnection();
			
			String sql ="INSERT INTO customer_pw_history(cus_mail,cus_pw) SELECT ?,PASSWORD(?) WHERE "
					+ "(SELECT cus_pw FROM cus_pw_history WHERE cus_mail =? ORDER BY create_date DESC LIMIT 1)=PASSWORD(?) "
					+ "AND NOT EXISTS (SELECT cus_pw FROM (SELECT cus_pw FROM customer_pw_history "
					+ "WHERE cus_mail=?) "
					+ "AS recent_history WHERE cus_pw =PASSWORD(?))";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, mail);
				stmt.setString(2, newPw);
				stmt.setString(3, mail);
				stmt.setString(4, oldPw);
				stmt.setString(5, mail);
				stmt.setString(6, newPw);
			row = stmt.executeUpdate();
			conn.close();
		return row;
	}
	
	//pw_history에 추가하는쿼리
	//호출 : customerResetPwACtion.jsp
	//param : String mail, String newPw
	//return : int
	
	public static int insetPwHistory(String mail, String newPw)throws Exception{
		
		int row = 0;
		Connection conn = DBHelper.getConnection();
		
		String sql ="INSERT INTO customer_pw_history(cus_mail, cus_pw) SELECT ?,PASSWORD(?) "
				+ "WHERE NOT EXISTS (SELECT cus_pw FROM(SELECT cus_pw From customer_pw_history WHERE cus_mail=?) "
				+ "AS recent_histhory WHERE cus_pw = ? )";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
			stmt.setString(1, mail );
			stmt.setString(2, newPw);
			stmt.setString(3, mail);
			stmt.setString(4, newPw);
			
		 row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	
	
	//historyPw과 기존 customer테이블 연결하기
	//호출 : customer/action/updatePwAction.jsp
	//호출2 : customer/action/customerResetPwAction.jsp
	//join문 사용하지말고
	//param : String mail
	//return : int
	
	public static int updatePw2(String mail) throws Exception{
		int row = 0;
		
			Connection conn = DBHelper.getConnection();
			
			String sql ="UPDATE customer "
					+ "SET cus_pw = (SELECT h.cus_pw FROM customer c INNER JOIN customer_pw_history h ON c.cus_mail = h.cus_mail ORDER BY h.create_date DESC LIMIT 1) "
					+ "WHERE cus_mail = ?";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, mail);
			
				row = stmt.executeUpdate();
			
				conn.close();
				
		return row;
	}
	
	//비밀번호 수졍용 insert문 사용
	
	//회원 탈퇴를 위해 개인정보 일치하는지 확인
	//호출 : customer/action/deleteCustomerAction.jsp
	
	public static int deleteCus(String cusMail, String pw) throws Exception{
		int row = 0;
			
			Connection conn = DBHelper.getConnection();
			
			String sql ="DELETE FROM customer WHERE cus_mail = ? AND cus_pw = ?";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, cusMail);
				stmt.setString(2, pw);
				
			row = stmt.executeUpdate();
			
			conn.close();
		return row;
	}
	
	//예약취소를 위해 고객 비밀번호 확인작업
	//호출 : customer/golf/rsvCancelPwCk.jsp
	//param : String(cusMail, ckPw)
	//return : boolean
	
	public static boolean selectCustomePwCk(
			String cusMail, String ckPw) throws Exception{
		
		boolean result = false;
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="SELECT cus_pw "
				+ "FROM customer "
				+ "WHERE cus_mail=? AND cus_pw=password(?)";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, cusMail);
			stmt.setString(2, ckPw);
			
		ResultSet rs = stmt.executeQuery();
		
			if(rs.next()) {
				//값이 존재함 비밀번호가 일치함!
				result = true;
			}else {
				//결과값이 없음
				result = false;
			}
		
		conn.close();
		return result;
	}
	
	//회원 아이디 찾기
	//호출 : customer/action/findIdAction.jsp
	//param :
	//return : 
	
	public static HashMap<String,Object>selectFindId(
			String cusName, String cusBirth, String cusContact) throws Exception{
		HashMap<String,Object>find = new HashMap<String,Object>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="SELECT cus_mail "
				+ "FROM customer "
				+ "WHERE cus_name = ? AND cus_birth = ? AND cus_contact = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, cusName);
			stmt.setString(2, cusBirth);
			stmt.setString(3, cusContact);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				find.put("cusMail", rs.getString("cus_mail"));
			}
		conn.close();
		return find;
	}
	//회원 비밀번호변경위해 고객정보확인
	//호출 : customer/action/findPwAction.jsp
	//param : 
	//return : HashMap<String,Object>
	
	public static HashMap<String,Object>selectFindPw(String cusMail, String cusName, String cusContact) throws Exception{
		HashMap<String,Object> find = new HashMap<String,Object>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT cus_mail FROM customer WHERE cus_mail = ? AND cus_name =? AND cus_contact =?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, cusMail);
			stmt.setString(2, cusName);
			stmt.setString(3, cusContact);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				find.put("mail", rs.getString("cus_mail"));
			}
		
		return find;
		
	}
	
	// 아이디 비번 확인하는 메서드 / 삭제확인폼
	public static boolean selectIdPwCk(String checkId, int checkPw) throws Exception{
	boolean ck = false;
	//db접근
	Connection conn = DBHelper.getConnection();
	
	String sql = "SELECT cus_mail cusMail FROM customer where cus_mail = ? AND cus_pw = PASSWORD(?) ";
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
}
