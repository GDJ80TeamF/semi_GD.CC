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
	
		String sql1 = "SELECT cus_mail cusMail, cus_pw cusPW FROM customer WHERE cus_mail=? AND cus_pw=?";
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
		
		String sql3 = "INSERT INTO customer(cus_mail, cus_name, cus_pw, cus_gender, cus_birth, cus_contact, cus_profile) VALUES(?, ?, ?, ?, ?, ?, ?)";
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
}
