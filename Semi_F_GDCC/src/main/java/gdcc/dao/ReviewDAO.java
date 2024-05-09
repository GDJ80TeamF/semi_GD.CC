package gdcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class ReviewDAO {
	//고객 본인이 작성한 호텔review 조회하는 메서드
	public static ArrayList<HashMap<String, Object>> selectHotelReviewPerCus(String cusMail) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail ReviewDAO.selectHotelReviewPerCus param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		// DB연동
		Connection  conn = DBHelper.getConnection();
			
		String sql = " SELECT review.review_no reviewNo, review.review_title reviewTitle, "
					+ " review.review_content reviewContent, review.review_score reviewScore, "
					+ " review.create_date createDate, review.update_date updateDate "
					+ " FROM review_hotel review INNER JOIN rsv_hotel rsv "
					+ " ON review.rsv_no = rsv.rsv_no "
					+ " WHERE rsv_mail = ? ";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("reviewNo", rs.getInt("reviewNo"));
			m.put("reviewTitle", rs.getString("reviewTitle"));
			m.put("reviewContent", rs.getString("reviewContent"));
			m.put("reviewScore", rs.getString("reviewScore"));
			m.put("createDate", rs.getString("createDate"));
			m.put("updateDate", rs.getString("updateDate"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	//고객 본인이 작성한 골프review 조회하는 메서드
	public static ArrayList<HashMap<String, Object>> selectGolfReviewPerCus(String cusMail) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail ReviewDAO.selectGolfReviewPerCus param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		// DB연동
		Connection  conn = DBHelper.getConnection();
				
		String sql = " SELECT review.review_no reviewNo, review.review_title reviewTitle, "
					+ " review.review_content reviewContent, review.review_score reviewScore, "
					+ " review.create_date createDate, review.update_date updateDate "
					+ " FROM review_golf review INNER JOIN rsv_golf rsv "
					+ " ON review.rsv_no = rsv.rsv_no "
					+ " WHERE rsv_mail = ? ";
			
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
			
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("reviewNo", rs.getInt("reviewNo"));
			m.put("reviewTitle", rs.getString("reviewTitle"));
			m.put("reviewContent", rs.getString("reviewContent"));
			m.put("reviewScore", rs.getString("reviewScore"));
			m.put("createDate", rs.getString("createDate"));
			m.put("updateDate", rs.getString("updateDate"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	// 호텔reviewList 조회하는 메서드
	public static ArrayList<HashMap<String, Object>> selectHotelReviewList(int startRow, int rowPerPage) throws Exception {
		// 매개값 디버깅
		System.out.println(startRow + "<-- startRow ReviewDAO.selectHotelReviewList param");
		System.out.println(rowPerPage + "<-- rowPerPage ReviewDAO.selectHotelReviewList param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		// DB연동
		Connection  conn = DBHelper.getConnection();
				
		String sql = "SELECT review_no reviewNo, review_title reviewTitle "
					+ "FROM review_hotel LIMIT ?,?";
			
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, startRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
			
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("reviewNo", rs.getInt("reviewNo"));
			m.put("reviewTitle", rs.getString("reviewTitle"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	// 골프reviewList 조회하는 메서드
	public static ArrayList<HashMap<String, Object>> selectGolfReviewList(int startRow, int rowPerPage) throws Exception {
		// 매개값 디버깅
		System.out.println(startRow + "<-- startRow ReviewDAO.selectGolfReviewList param");
		System.out.println(rowPerPage + "<-- rowPerPage ReviewDAO.selectGolfReviewList param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		// DB연동
		Connection  conn = DBHelper.getConnection();
				
		String sql = "SELECT review_no reviewNo, review_title reviewTitle "
					+ "FROM review_golf LIMIT ?,?";
			
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, startRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
			
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("reviewNo", rs.getInt("reviewNo"));
			m.put("reviewTitle", rs.getString("reviewTitle"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	// reviewNo에 따라 HotelReview 출력하는 메서드 / 상세보기
	public static HashMap<String, Object> selectHotelReviewOne(int reviewNo) throws Exception {
		// 매개값 디버깅
		System.out.println(reviewNo + "<-- reviewNo ReviewDAO.selectQnAOne param");
			
		HashMap<String, Object> resultMap = null;
			
		// DB연동
		Connection  conn = DBHelper.getConnection();
				
		String sql = "SELECT review_no reviewNo, rsv_no rsvNo, review_title reviewTitle, "
				   + " review_content reviewContent, review_score reviewScore, "
			  	   + " create_date createDate, update_date updateDate "
				   + " FROM review_hotel "
				   + " where review_no = ?";
				
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, reviewNo);
		ResultSet rs = stmt.executeQuery();
			
		if(rs.next()) {
			resultMap = new HashMap<String, Object>();
			resultMap.put("reviewNo", rs.getInt("reviewNo"));
			resultMap.put("rsvNo", rs.getInt("rsvNo"));
			resultMap.put("reviewTitle", rs.getString("reviewTitle"));
			resultMap.put("reviewContent", rs.getString("reviewContent"));
			resultMap.put("reviewScore", rs.getString("reviewScore"));
			resultMap.put("createDate", rs.getString("createDate"));
			resultMap.put("updateDate", rs.getString("updateDate"));
		}
		conn.close();
		return resultMap;		
	}
	// reviewNo에 따라 GolfReview 출력하는 메서드 / 상세보기
	public static HashMap<String, Object> selectGolfReviewOne(int reviewNo) throws Exception {
		// 매개값 디버깅
		System.out.println(reviewNo + "<-- reviewNo ReviewDAO.selectQnAOne param");
			
		HashMap<String, Object> resultMap = null;
			
		// DB연동
		Connection  conn = DBHelper.getConnection();
				
		String sql = "SELECT review_no reviewNo, rsv_no rsvNo, review_title reviewTitle, "
				   + " review_content reviewContent, review_score reviewScore, "
			  	   + " create_date createDate, update_date updateDate "
				   + " FROM review_golf "
				   + " where review_no = ?";
				
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, reviewNo);
		ResultSet rs = stmt.executeQuery();
			
		if(rs.next()) {
			resultMap = new HashMap<String, Object>();
			resultMap.put("reviewNo", rs.getInt("reviewNo"));
			resultMap.put("rsvNo", rs.getInt("rsvNo"));
			resultMap.put("reviewTitle", rs.getString("reviewTitle"));
			resultMap.put("reviewContent", rs.getString("reviewContent"));
			resultMap.put("reviewScore", rs.getString("reviewScore"));
			resultMap.put("createDate", rs.getString("createDate"));
			resultMap.put("updateDate", rs.getString("updateDate"));
		}
		conn.close();
		return resultMap;		
	}
	// hotelReview 작성하는 메서드
	public static int insertHotelReview(int rsvNo, String reviewTitle, String reviewContent, int reviewScore) throws Exception {
		// 매개값 디버깅
		System.out.println(reviewTitle + "<-- reviewTitle ReviewDAO.insertHotelReview param");
		System.out.println(reviewContent + "<-- reviewContent ReviewDAO.insertHotelReview param");
		System.out.println(reviewScore + "<-- reviewScore ReviewDAO.insertHotelReview param");
		
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "INSERT INTO review_hotel (rsv_no, review_title, review_content, "
					+ " review_score, create_date, update_date) "
					+ " VALUES(?, ?, ?, ?, NOW(), NOW())";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, rsvNo);
		stmt.setString(2, reviewTitle);
		stmt.setString(3, reviewContent);
		stmt.setInt(4, reviewScore);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
	// golfReview 작성하는 메서드
	public static int insertGolfReview(int rsvNo, String reviewTitle, String reviewContent, int reviewScore) throws Exception {
		// 매개값 디버깅
		System.out.println(rsvNo + "<-- rsvNo ReviewDAO.insertGolfReview param");
		System.out.println(reviewTitle + "<-- reviewTitle ReviewDAO.insertGolfReview param");
		System.out.println(reviewContent + "<-- reviewContent ReviewDAO.insertGolfReview param");
		System.out.println(reviewScore + "<-- reviewScore ReviewDAO.insertGolfReview param");
		
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "INSERT INTO review_golf (rsv_no, review_title, review_content, "
					+ " review_score, create_date, update_date) "
					+ " VALUES(?, ?, ?, ?, NOW(), NOW())";
		
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, rsvNo);
		stmt.setString(2, reviewTitle);
		stmt.setString(3, reviewContent);
		stmt.setInt(4, reviewScore);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
}
