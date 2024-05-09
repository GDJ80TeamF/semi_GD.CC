package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class NoticeDAO {
	public static int insertNotice(int noticeNo, int adminNo, String noticeTitle, String noticeContent) throws Exception{
		int row = 0;
		
		Connection conn = null;
		conn = DBHelper.getConnection();
		
		String sql = "INSERT INTO notice(notice_no noticeNo, admin_no adminNo, notice_title noticeTitle, notice_content noticeContent) VALUES(?, ?, ?, ?)";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeNo);
		stmt.setInt(2, adminNo);
		stmt.setString(3, noticeTitle);
		stmt.setString(4, noticeContent);
		
		conn.close();
		return row;
	}
	
	public static ArrayList<HashMap<String, Object>> 
		selectNoticeAdmin(int adminNo) throws Exception{
		ArrayList<HashMap<String, Object>> list2 = new ArrayList<HashMap<String, Object>>();
		
		Connection conn = null;
		conn = DBHelper.getConnection();
		
		String sql2 ="SELECT";
		
		return list2;
	}

	
	
	// 공지 리스트
	public static ArrayList<HashMap<String, Object>> 
		selectNotice(int startRow, int rowPerPage)throws Exception{
		
		ArrayList<HashMap<String, Object>> list1 = new ArrayList<HashMap<String, Object>>();
		
		Connection conn1 = DBHelper.getConnection();
		
		String sql1 = "SELECT notice_no noticeNo, admin_no adminNo, "
				+ "notice_title noticeTitle, notice_content noticeContent "
				+ "FROM notice "
				+ "ORDER BY LIMIT ?, ? ";
		
		PreparedStatement stmt1 = null;
		stmt1 = conn1.prepareStatement(sql1);
		stmt1.setInt(1, startRow);
		stmt1.setInt(2, rowPerPage);
		
		ResultSet rs1 = null;
		rs1 = stmt1.executeQuery();
		
		while(rs1.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("noticeNo", rs1.getInt("noticeNo"));
			m.put("adminNo", rs1.getInt("adminNo"));
			m.put("noticeTitle", rs1.getString("noticeTitle"));
			m.put("noticeContent", rs1.getString("noticeContent"));
		}
		
		return list1;
	}
}
