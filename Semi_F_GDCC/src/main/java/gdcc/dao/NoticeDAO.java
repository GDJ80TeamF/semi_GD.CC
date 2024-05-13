package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.sql.*;

public class NoticeDAO {
	// 공지 추가
	public static int insertNotice(int adminEmail, String noticeTitle, String noticeContent) throws Exception{
		int row = 0;
		
		Connection conn = null;
		conn = DBHelper.getConnection();
		
		String sql = "INSERT INTO notice(admin_email, notice_title, notice_content) VALUES(?, ?, ?)";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, adminEmail);
		stmt.setString(2, noticeTitle);
		stmt.setString(3, noticeContent);
		
		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}

	// 공지 리스트
	public static ArrayList<HashMap<String, Object>> 
		selectNotice(int startRow, int rowPerPage)throws Exception{
		
		ArrayList<HashMap<String, Object>> List = new ArrayList<HashMap<String, Object>>();
		
		Connection conn1 = DBHelper.getConnection();
		
		String sql1 = "SELECT notice_no noticeNo, admin_email adminEmail, "
				+ "notice_title noticeTitle, notice_content noticeContent "
				+ "FROM notice "
				+ "ORDER BY noticeNo ASC LIMIT ?, ? ";
		
		PreparedStatement stmt1 = conn1.prepareStatement(sql1);
		stmt1.setInt(1, startRow);
		stmt1.setInt(2, rowPerPage);
		
		ResultSet rs1 = stmt1.executeQuery();
		
		while(rs1.next()) {
			HashMap<String, Object> m1 = new HashMap<String, Object>();
			m1.put("noticeNo", rs1.getInt("noticeNo"));
			m1.put("adminEmail", rs1.getInt("adminEmail"));
			m1.put("noticeTitle", rs1.getString("noticeTitle"));
			m1.put("noticeContent", rs1.getString("noticeContent"));
			List.add(m1);
		}
		
		conn1.close();
		return List;
	}
	
	// 공지 상세보기
	public static HashMap<String, Object>
		selectNoticeOne(int noticeNo)throws Exception{
		
		HashMap<String, Object> resuMap = new HashMap<String, Object>();
		
		// db연결
		Connection conn2 = DBHelper.getConnection();
		
		String sql2 = "SELECT notice_no noticeNo, admin_email adminEmail, "
				+ "notice_title noticeTitle, notice_content noticeContent "
				+ "FROM notice WHERE notice_no=? ";
		
		PreparedStatement stmt2 = null;
		stmt2 = conn2.prepareStatement(sql2);
		stmt2.setInt(1, noticeNo);

		
		ResultSet rs2 = null;
		rs2 = stmt2.executeQuery();
		
		if(rs2.next()) {
			resuMap = new HashMap<String, Object>();
			resuMap.put("noticeNo", rs2.getInt("noticeNo"));
			resuMap.put("adminEmail", rs2.getInt("adminEmail"));
			resuMap.put("noticeTitle", rs2.getString("noticeTitle"));
			resuMap.put("noticeContent", rs2.getString("noticeContent"));
		}
		
		conn2.close();
		return resuMap;
	}
	
	
	  // 공지 수정 
	  public static int updateNotice(int noticeNo, int adminEmail, String noticeTitle, String noticeContent) throws Exception{ 
		  int row3 = 0;
	  
		  Connection conn3 = DBHelper.getConnection();
		  
		  String sql3 = "UPDATE notice SET admin_email=?, notice_title=?, notice_content=? WHERE notice_no=? ";
		  PreparedStatement stmt3 = null;
		  stmt3  = conn3.prepareStatement(sql3);
		  stmt3.setInt(1, adminEmail);
		  stmt3.setString(2, noticeTitle);
		  stmt3.setString(3, noticeContent);
		  stmt3.setInt(4, noticeNo);
		  
		  row3 = stmt3.executeUpdate();
		  
		  conn3.close();
		  return row3; 
	  }
	  
	  // 공지 삭제
	   public static int deleteNotice(int noticeNo) throws Exception{
		   int row = 0;
		   Connection conn = DBHelper.getConnection();
		   
		   String sql = "DELETE FROM notice WHERE notice_no=? ";                                  
		   PreparedStatement stmt = null;
		   stmt = conn.prepareStatement(sql);
		   stmt.setInt(1, noticeNo);
		   
		   row = stmt.executeUpdate();
		   
		   conn.close();
		   return row;
	   }
	  
}
