package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class CommentDAO {
	
	// qnaNo가 ? 인 QnAComment리스트 출력하는 메서드
	public static ArrayList<HashMap<String, Object>> selectComment(int qnaNo) throws Exception {
		// 매개값 디버깅
		System.out.println(qnaNo + "<-- qnaNo CommentDAO.selectComment param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		// DB연동
		Connection  conn = DBHelper.getConnection();
		
		String sql = "SELECT comment_no commentNo, comment_content commentContent, create_date createDate, update_date updateDate "
					+ " FROM qna_comment "
					+ " WHERE qna_no = ? ";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, qnaNo);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("commentNo", rs.getInt("commentNo"));
			m.put("commentContent", rs.getString("commentContent"));
			m.put("createDate", rs.getString("createDate"));
			m.put("updateDate", rs.getString("updateDate"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	// QnAComment 작성하는 메서드
	public static int insertQnAComment(int qnaNo, String adminMail, String commentContent) throws Exception {
		// 매개값 디버깅
		System.out.println(qnaNo + "<-- qnaNo CommentDAO.insertQnAComment param");
		System.out.println(adminMail + "<-- adminMail CommentDAO.insertQnAComment param");
		System.out.println(commentContent + "<-- commentContent CommentDAO.insertQnAComment param");
		
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "INSERT INTO qna_comment (qna_no, admin_mail, comment_content, create_date, update_date) "
					+ " VALUES(?, ?, ?, NOW(), NOW())";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, qnaNo);
		stmt.setString(2, adminMail);
		stmt.setString(3, commentContent);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
	// commentNo가 ?인 QnAComment 삭제하는 메서드
	public static int deleteQnAComment(int commentNo) throws Exception {
		// 매개값 디버깅
		System.out.println(commentNo + "<-- commentNo CommentDAO.deleteQnAComment param");
				
		int row = 0;
		
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "DELETE from qna_comment WHERE comment_no = ?";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, commentNo);

		row = stmt.executeUpdate();
		
		conn.close();
		return row;
	}	
}
