package gdcc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.net.*;
import java.util.*;

public class QnaDAO {
	// 고객 본인이 작성한 QnA 조회하는 메서드
	public static ArrayList<HashMap<String, Object>> selectQnAPerCus(String cusMail) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail QnaDAO.selectQnAPerCus param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		// DB연동
		Connection  conn = DBHelper.getConnection();
		
		String sql = " SELECT qna_no qnaNo, cus_mail cusMail, qna_title qnaTitle, "
					+ " qna_content qnaContent, create_date createDate, update_date updateDate "
					+ " FROM qna "
					+ " WHERE cus_mail = ? ";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("qnaNo", rs.getInt("qnaNo"));
			m.put("cusMail", rs.getString("cusMail"));
			m.put("qnaTitle", rs.getString("qnaTitle"));
			m.put("qnaContent", rs.getString("qnaContent"));
			m.put("createDate", rs.getString("createDate"));
			m.put("updateDate", rs.getString("updateDate"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	// QnA리스트 출력하는 메서드
	public static ArrayList<HashMap<String, Object>> selectQnAList(int startRow, int rowPerPage) throws Exception {
		// 매개값 디버깅
		System.out.println(startRow + "<-- startRow QnaDAO.selectQnAList param");
		System.out.println(rowPerPage + "<-- rowPerPage QnaDAO.selectQnAList param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		// DB연동
		Connection  conn = DBHelper.getConnection();
		
		String sql = " SELECT qna_no qnaNo, cus_mail cusMail, qna_title qnaTitle "
					+ " FROM qna"
					+ " ORDER BY qnaNo DESC LIMIT ?, ? ";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, startRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("qnaNo", rs.getInt("qnaNo"));
			m.put("cusMail", rs.getString("cusMail"));
			m.put("qnaTitle", rs.getString("qnaTitle"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	// QnA 총 개수 구하는 메서드 /Page
	public static int page () throws Exception{
		int lastPage = 0;
		int rowPerPage = 1;
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT COUNT(*) FROM qna";
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
	// QnA 작성하는 메서드
	public static int insertQnA(String cusMail, String title, String content) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail QnaDAO.insertQnA param");
		System.out.println(title + "<-- title QnaDAO.insertQnA param");
		System.out.println(content + "<-- content QnaDAO.insertQnA param");
		
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = " INSERT INTO qna (cus_mail, qna_title, qna_content, create_date, update_date) "
				   + " VALUES(?, ?, ?, NOW(), NOW()) ";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		stmt.setString(2, title);
		stmt.setString(3, content);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
	// qnaNo에 따라QnA 출력하는 메서드 / 상세보기
	public static HashMap<String, Object> selectQnAOne(int qnaNo) throws Exception {
		// 매개값 디버깅
		System.out.println(qnaNo + "<-- qnaNo QnaDAO.selectQnAOne param");
		
		HashMap<String, Object> resultMap = null;
		
		// DB연동
		Connection  conn = DBHelper.getConnection();
			
		String sql = " SELECT qna_no qnaNo, cus_mail cusMail, qna_title qnaTitle, "
					+ " qna_content qnaContent, create_date createDate, update_date updateDate"
					+ " FROM qna WHERE qna_no = ? ";
			
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, qnaNo);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			resultMap = new HashMap<String, Object>();
			resultMap.put("qnaNo", rs.getInt("qnaNo"));
			resultMap.put("cusMail", rs.getString("cusMail"));
			resultMap.put("qnaTitle", rs.getString("qnaTitle"));
			resultMap.put("qnaContent", rs.getString("qnaContent"));
			resultMap.put("createDate", rs.getString("createDate"));
			resultMap.put("updateDate", rs.getString("updateDate"));
		}
		conn.close();
		return resultMap;		
	}
	// qnaNo가 ?인 QnA 수정하는 메서드
	public static int updateQnA(String qnaTitle, String qnaContent, int qnaNo) throws Exception {
		// 매개값 디버깅
		System.out.println(qnaTitle + "<-- qnaTitle QnaDAO.updateQnA param");
		System.out.println(qnaContent + "<-- qnaContent QnaDAO.updateQnA param");
		System.out.println(qnaNo + "<-- qnaNo QnaDAO.updateQnA param");
			
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = " UPDATE qna SET qna_title = ?, qna_content = ?, update_date = NOW() "
					+ " WHERE qna_no = ? ";
			
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setString(1, qnaTitle);
		stmt.setString(2, qnaContent);
		stmt.setInt(3, qnaNo);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}	
	// qnaNo가 ?인 QnA 삭제하는 메서드
	public static int deleteQnA(int qnaNo) throws Exception {
		// 매개값 디버깅
		System.out.println(qnaNo + "<-- qnaNo QnaDAO.deleteQnA param");
				
		int row = 0;
		
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "DELETE from qna WHERE qna_no = ?";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, qnaNo);

		row = stmt.executeUpdate();
		if(row==1) { // QnA가 삭제되면 해당comment도 전부삭제
			
			String sql2 = "DELETE from qna_comment WHERE qna_no = ?";
			
			PreparedStatement stmt2 =  conn.prepareStatement(sql2);
			stmt2.setInt(1, qnaNo);
		}
		conn.close();
		return row;
	}
	// 아이디 비번 확인하는 메서드 / 삭제확인폼 <커밋
	public static boolean selectIdPwCk(String checkId, int checkPw) throws Exception{
		boolean ck = false;
		//db접근
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT admin_mail adminMail FROM admin where admin_mail = ? AND admin_pw = PASSWORD(?) ";
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
