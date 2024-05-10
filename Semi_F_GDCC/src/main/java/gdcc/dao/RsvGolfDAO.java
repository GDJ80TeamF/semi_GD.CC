package gdcc.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RsvGolfDAO {

	//rsv_golf 회원의 골프예약 리스트
	//호출 : /customer/golf/rsvGolfList.jsp
	//param : void
	//return : ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>> selectRsvList(String cusMail) throws Exception{
		ArrayList<HashMap<String,Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="SELECT c.cus_name cusName,r.rsv_no rsvNo, r.rsv_date rsvDate, r.rsv_course rsvCourse,"
				+ " r.rsv_Ttime rsvTtime "
				+ "FROM customer c "
				+ "INNER JOIN rsv_golf r "
				+ "ON c.cus_mail = r.rsv_mail "
				+ "WHERE c.cus_mail = ? "
				+ "ORDER BY r.create_date DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, cusMail);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()){
			
			HashMap<String,Object> m = new HashMap<String,Object>();
			
			m.put("cusName", rs.getString("cusName"));
			m.put("rsvNo", rs.getInt("rsvNo"));
			m.put("rsvDate", rs.getString("rsvDate"));
			m.put("rsvCourse", rs.getString("rsvCourse"));
			m.put("rsvTtime", rs.getString("rsvTtime"));
			
			list.add(m);
		}
		
		
		conn.close();
		return list;
	}
	
	//예약한 회원의 상세보기 페이지
	//호출 : 
	// 1. customer/golf/rsvGolfOne.jsp
	// 2. customer/golf/udpateRsvForm.jsp
	//param : int
	//return : HashMap<String,Object>
	
	public static HashMap<String,Object> selectRsvOne(int rsvNo) throws Exception{
		HashMap<String,Object> one = new HashMap<String,Object>();
			
			Connection conn = DBHelper.getConnection();
			
			String sql ="SELECT rsv_course rsvCourse, rsv_mail rsvMail, rsv_date rsvDate, "
					+ "rsv_member rsvMember, rsv_request rsvRequest, rsv_state rsvState, rsv_Ttime rsvTtime "
					+ "FROM rsv_golf "
					+ "WHERE rsv_no = ?";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, rsvNo);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				one.put("rsvCourse", rs.getString("rsvCourse"));
				one.put("rsvMail", rs.getString("rsvMail"));
				one.put("rsvDate", rs.getString("rsvDate"));
				one.put("rsvMember", rs.getInt("rsvMember"));
				one.put("rsvRequest", rs.getString("rsvRequest"));
				one.put("rsvState", rs.getString("rsvState"));
				one.put("rsvTtime", rs.getString("rsvTtime"));
			}
		conn.close();
		return one;
	}
	
	//골프 코스 가져오기
	//호출 : /customer/golf/inserNewRsvForm.jsp
	//param : void
	//return: ArrayList
	
	public static ArrayList<HashMap<String,Object>> courseList() throws Exception{
		ArrayList<HashMap<String,Object>> list 
			= new ArrayList<HashMap<String,Object>>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT * FROM golf_course";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("courseName", rs.getString("course_name"));
			m.put("courseInfo", rs.getString("course_info"));
			
			list.add(m);
		}
		
		conn.close();
		return list;
		
	}
	//예약코스, 시간, 날짜에 값이 있는지 확인하기
	//호출 : /customer/action/insertNewRsvAction.jsp
	//param : String
	//return : boolean
	
	public static boolean checkList(
			String rsvCourseCheck, String rsvDateCheck, String rsvTtimeCheck) throws Exception{
		boolean result = false;
		
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT rsv_course, rsv_date, rsv_Ttime "
					+ "FROM rsv_golf "
					+ "WHERE rsv_course = ? AND rsv_date = ? AND rsv_Ttime = ? ";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, rsvCourseCheck);
			stmt.setString(2, rsvDateCheck);
			stmt.setString(3, rsvTtimeCheck);
		
		ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				//해당행이 존재하는 것이기 때문에 true값이지만 결과는 실패
				 result = false;
			}else {
				result = true;
				//해당행이 존재하지 않기 때문에 false값이지만
				//예약가능
			}
			
		return result;
	}
	
	
	//예약정보 테이블에 넣기
	//호출 : /customer/action/insertNewRsvAction.jsp
	//param : String, int
	//return : int
	
	public static int insertNewRsv(
			String rsvCourse, String rsvMail, String rsvDate, int rsvMember, String rsvRequest, String rsvTtime ) throws Exception{
				int row = 0;
				
				Connection conn = DBHelper.getConnection();
				
				String sql ="INSERT INTO rsv_golf(rsv_course, rsv_mail, rsv_date, rsv_member, rsv_request, rsv_Ttime, "
							+ "create_date, update_date) "
							+"VALUES (?,?,?,?,?,?,NOW(), NOW())";
				
				PreparedStatement stmt = conn.prepareStatement(sql);
				 stmt.setString(1, rsvCourse);
				 stmt.setString(2, rsvMail);
				 stmt.setString(3, rsvDate);
				 stmt.setInt(4, rsvMember);
				 stmt.setString(5, rsvRequest);
				 stmt.setString(6, rsvTtime);
				 
				 row = stmt.executeUpdate();
				 
				 conn.close();
				return row;
	}
	
	//예약테이블에서 rsv_Ttime가져오기
	//호출 : /customer/golf/insertNewRsvForm.jsp
	//param : String
	//return : ArrayList
	
	public static ArrayList<HashMap<String,Object>> selectRsvTtime(
			String checkCourse, String checkDate) throws Exception{
		ArrayList<HashMap<String,Object>> time = new ArrayList<HashMap<String,Object>>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT rsv_Ttime "
					+ "FROM rsv_golf "
					+ "WHERE rsv_course =? AND rsv_date =?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, checkCourse);
			stmt.setString(2, checkDate);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("rsvTtime", rs.getString("rsv_Ttime"));
			time.add(m);
		}
		
		return time;
	}
	//골프 예약 변경update
	//호출 : /customer/update/updateRsvAction.jsp
	//param : String,int
	//retunr : int

	public static int updateRsv(
			String rsvCourse, String rsvDate, int rsvMember ,String rsvTtime, int rsvNo) throws Exception{
		int row = 0;
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="UPDATE rsv_golf "
				+ "SET rsv_course=?, rsv_date=?, rsv_member=?, rsv_Ttime=?, "
				+ "create_date = NOW() WHERE rsv_no =?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, rsvCourse);
			stmt.setString(2, rsvDate);
			stmt.setInt(3, rsvMember);
			stmt.setString(4, rsvTtime);
			stmt.setInt(5, rsvNo);
			
		row = stmt.executeUpdate();
		
		return row;
	}
	
}
