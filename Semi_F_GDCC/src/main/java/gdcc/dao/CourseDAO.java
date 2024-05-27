package gdcc.dao;
import java.util.HashMap;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.ResultSet;

public class CourseDAO {
	
	//코스 리스트 출력하기
	//호출 : admin/courseList.jsp
	//param : void
	//return : ArrayList<HashMap<
	
	public static ArrayList<HashMap<String,Object>> selectCourseList() throws Exception{
		ArrayList<HashMap<String,Object>> list = 
				new ArrayList<HashMap<String, Object>>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT course_name,course_state FROM golf_course";
		
		PreparedStatement stmt =conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
			while(rs.next()) {
				HashMap<String,Object> m = new HashMap<String,Object>();
				
				m.put("courseName", rs.getString("course_name"));
				m.put("courseState", rs.getString("course_state"));
				
				list.add(m);
			}
		conn.close();
		return list;
			
		
	}
	
	//코스 정보 출력
	//호출 : admin/courseOne.jsp
	//param : void
	//return : HashMap<String,Object>
	
	public static HashMap<String,Object> selectCourse() throws Exception{
		HashMap<String,Object>course = new HashMap<String,Object>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql ="SELECT course_name,course_state,course_info,create_date,update_date FROM golf_course";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			course.put("name", rs.getString("course_name"));
			course.put("state", rs.getString("course_state"));
			course.put("info", rs.getString("course_info"));
			course.put("createDate", rs.getString("create_date"));
			course.put("updateDate", rs.getString("update_date"));
		}
		return course;
	}
	
	
	//코스 상태 업데이트 해주기 
	//호출 : admin/updateCourseAction.jsp
	//param : String courseState, courseName
	//return : int

	public static int updateCourseState(String courseState, String courseName) throws Exception{
		int row = 0;

		Connection conn = DBHelper.getConnection();
		
		String sql = "UPDATE golf_course "
				+ "SET course_state = ? "
				+ "WHERE course_name = ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, courseState);
			stmt.setString(2, courseName);
			
			row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	
	//코스 내용 업데이트
	//호출 : admin/action/courseInfoAction.jsp
	//param : String courseInfo, courseName
	//return : int
	
	public static int updateCourseInfo(String courseInfo, String courseName) throws Exception{
		int row = 0;
		
		Connection conn = DBHelper.getConnection();
		
		String sql = "UPDATE golf_course "
				+ "SET course_info = ? "
				+ "WHERE course_name = ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, courseInfo);
			stmt.setString(2, courseName);
			
			row = stmt.executeUpdate();
			conn.close();
		return row;
		
	}
}
