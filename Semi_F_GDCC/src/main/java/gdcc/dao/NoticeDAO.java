package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.sql.*;

public class NoticeDAO {
	// 공지 추가
	public static int insertNotice(String adminMail, String noticeTitle, String noticeContent) throws Exception{
		int row = 0;
		
		Connection conn = null;
		conn = DBHelper.getConnection();
		
		String sql = "INSERT INTO notice(admin_mail, notice_title, notice_content) VALUES(?, ?, ?)";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, adminMail);
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
		
		String sql1 = "SELECT notice_no noticeNo, admin_mail adminMail, "
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
			m1.put("adminMail", rs1.getString("adminMail"));
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
		
		String sql2 = "SELECT notice_no noticeNo, admin_mail adminMail, "
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
			resuMap.put("adminMail", rs2.getString("adminMail"));
			resuMap.put("noticeTitle", rs2.getString("noticeTitle"));
			resuMap.put("noticeContent", rs2.getString("noticeContent"));
		}
		
		conn2.close();
		return resuMap;
	}
	
	
	  // 공지 수정 
	  public static int updateNotice(int noticeNo, String adminMail, String noticeTitle, String noticeContent) throws Exception{ 
		  int row3 = 0;
	  
		  Connection conn3 = DBHelper.getConnection();
		  
		  String sql3 = "UPDATE notice SET admin_mail=?, notice_title=?, notice_content=? WHERE notice_no=? ";
		  PreparedStatement stmt3 = null;
		  stmt3  = conn3.prepareStatement(sql3);
		  stmt3.setString(1, adminMail);
		  stmt3.setString(2, noticeTitle);
		  stmt3.setString(3, noticeContent);
		  stmt3.setInt(4, noticeNo);
		  
		  row3 = stmt3.executeUpdate();
		  
		  conn3.close();
		  return row3; 
	  }
	  
	  // 공지 삭제 전 비번 체크 확인
	  public static boolean noticeCheckIdPw(String checkId, String checkPw) throws Exception{
		  boolean result = false; 
		  
		  // db 사용
		  Connection conn = DBHelper.getConnection();
		  String sql = "SELECT admin_mail adminMail FROM admin WHERE admin_mail =? AND admin_pw=PASSWORD(?) ";
		  PreparedStatement stmt = null;
		  stmt = conn.prepareStatement(sql);
		  stmt.setString(1, checkId);
		  stmt.setString(2, checkPw);
		  ResultSet rs = null;
		  rs = stmt.executeQuery();
		  if(rs.next()) {
			  result = true;
		  }
		  conn.close();
		  return result;
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
	// 공지 리스트
		public static ArrayList<HashMap<String, Object>> 
			noticeListForMain()throws Exception{
			
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			
			Connection conn1 = DBHelper.getConnection();
			
			String sql1 = "SELECT notice_no noticeNo, admin_mail adminMail, "
					+ "notice_title noticeTitle, notice_content noticeContent "
					+ "FROM notice "
					+ "ORDER BY noticeNo DESC LIMIT 8";
			
			PreparedStatement stmt1 = conn1.prepareStatement(sql1);
			
			
			ResultSet rs1 = stmt1.executeQuery();
			
			while(rs1.next()) {
				HashMap<String, Object> m1 = new HashMap<String, Object>();
				m1.put("noticeNo", rs1.getInt("noticeNo"));
				m1.put("adminMail", rs1.getString("adminMail"));
				m1.put("noticeTitle", rs1.getString("noticeTitle"));
				m1.put("noticeContent", rs1.getString("noticeContent"));
				list.add(m1);
			}
			
			conn1.close();
			return list;
		}
		//공지페이징 -총 행 개수 구하기 
		public static int countNotice() throws Exception{
			int totalRow = 0;
			Connection conn = DBHelper.getConnection();
			String sql = "SELECT COUNT(*) cnt FROM notice";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				totalRow = rs.getInt("cnt");
			}
			conn.close();
			return totalRow;
		}
	  
}
