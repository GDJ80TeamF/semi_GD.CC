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
			
		String sql = " SELECT rsv.rsv_no rsvNo, review.review_no reviewNo, review.review_title reviewTitle, "
					+ " review.review_content reviewContent, review.review_score reviewScore, rsv.checkin_date checkinDate, "
					+ " rsv.checkout_date checkoutDate, review.create_date createDate, review.update_date updateDate "
					+ " FROM review_hotel review INNER JOIN rsv_hotel rsv "
					+ " ON review.rsv_no = rsv.rsv_no "
					+ " WHERE rsv_mail = ? ";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("reviewNo", rs.getInt("reviewNo"));
			m.put("rsvNo", rs.getInt("rsvNo"));
			m.put("reviewTitle", rs.getString("reviewTitle"));
			m.put("reviewContent", rs.getString("reviewContent"));
			m.put("reviewScore", rs.getInt("reviewScore"));
			m.put("checkinDate", rs.getString("checkinDate"));
			m.put("checkoutDate", rs.getString("checkoutDate"));
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
				
		String sql = " SELECT rsv.rsv_no rsvNo, review.review_no reviewNo, review.review_title reviewTitle, "
					+ " review.review_content reviewContent, review.review_score reviewScore, rsv.rsv_date rsvDate, "
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
			m.put("rsvNo", rs.getInt("rsvNo"));
			m.put("reviewTitle", rs.getString("reviewTitle"));
			m.put("reviewContent", rs.getString("reviewContent"));
			m.put("reviewScore", rs.getInt("reviewScore"));
			m.put("rsvDate", rs.getString("rsvDate"));
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
	// 호텔리뷰 총 개수 구하는 메서드 /Page
	public static int hotelReviewPage () throws Exception{
		int lastPage = 0;
		int rowPerPage = 1;
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT COUNT(*) FROM review_hotel";
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
	// 골프리뷰 총 개수 구하는 메서드 /Page
	public static int golfReviewPage () throws Exception{
		int lastPage = 0;
		int rowPerPage = 1;
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT COUNT(*) FROM review_golf";
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
	// reviewNo가 ?인 HotelReview 수정하는 메서드
	public static int updateHotelReview(String reviewTitle, String reviewContent, int reviewScore, int reviewNo) throws Exception {
		// 매개값 디버깅
		System.out.println(reviewTitle + "<-- reviewTitle ReviewDAO.updateHotelReview param");
		System.out.println(reviewContent + "<-- reviewContent ReviewDAO.updateHotelReview param");
		System.out.println(reviewScore + "<-- reviewScore ReviewDAO.updateHotelReview param");
		System.out.println(reviewNo + "<-- reviewNo ReviewDAO.updateHotelReview param");
			
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "UPDATE review_hotel SET review_title = ?, review_content = ?, review_score = ?, update_date = NOW()"
					+ "WHERE review_no = ?";
			
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setString(1, reviewTitle);
		stmt.setString(2, reviewContent);
		stmt.setInt(3, reviewScore);
		stmt.setInt(4, reviewNo);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}	
	// reviewNo가 ?인 GolfReview 수정하는 메서드
	public static int updateGolfReview(String reviewTitle, String reviewContent, int reviewScore, int reviewNo) throws Exception {
		// 매개값 디버깅
		System.out.println(reviewTitle + "<-- reviewTitle ReviewDAO.updateGolfReview param");
		System.out.println(reviewContent + "<-- reviewContent ReviewDAO.updateGolfReview param");
		System.out.println(reviewScore + "<-- reviewScore ReviewDAO.updateGolfReview param");
		System.out.println(reviewNo + "<-- reviewNo ReviewDAO.updateGolfReview param");
			
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "UPDATE review_golf SET review_title = ?, review_content = ?, review_score = ?, update_date = NOW()"
					+ "WHERE review_no = ?";
			
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setString(1, reviewTitle);
		stmt.setString(2, reviewContent);
		stmt.setInt(3, reviewScore);
		stmt.setInt(4, reviewNo);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}	
	// ReviewNo가 ?인 HotelReview 삭제하는 메서드
	public static int deleteHotelReview(int reviewNo) throws Exception {
		// 매개값 디버깅
		System.out.println(reviewNo + "<-- reviewNo ReviewDAO.deleteHotelReview param");
				
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "DELETE from review_hotel WHERE review_no = ?";
				
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, reviewNo);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
	// ReviewNo가 ?인 GolfReview 삭제하는 메서드
	public static int deleteGolfReview(int reviewNo) throws Exception {
		// 매개값 디버깅
		System.out.println(reviewNo + "<-- reviewNo ReviewDAO.deleteGolfReview param");
				
		int row = 0;
		// DB 접근
		Connection  conn = DBHelper.getConnection();

		String sql = "DELETE from review_golf WHERE review_no = ?";
				
		PreparedStatement stmt =  conn.prepareStatement(sql);
		stmt.setInt(1, reviewNo);

		row = stmt.executeUpdate();

		conn.close();
		return row;
	}
	// 호출 : /customer/reviewListPerCustomer.jsp
	// cusMail에 따라 hotelRsvState 출력하는 메서드
	public static String hotelRsvState(String cusMail) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail ReviewDAO.hotelRsvState param");
			
		String s = null;
			
		// DB연동
		Connection  conn = DBHelper.getConnection();
				
		String sql = "SELECT h.rsv_state state "
					+ "FROM rsv_hotel h "
					+ "INNER JOIN customer c ON h.rsv_mail = c.cus_mail "
					+ "WHERE c.cus_mail = ?";
				
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
			
		if(rs.next()) {
			s = (String)(rs.getString("state"));
		}
		conn.close();
		return s;		
	}
	// 호출 : /customer/reviewListPerCustomer.jsp
	// cusMail에 따라 golfRsvState 출력하는 메서드
	public static String golfRsvState(String cusMail) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail ReviewDAO.golfRsvState param");
			
		String s = null;
			
		// DB연동
		Connection  conn = DBHelper.getConnection();
				
		String sql = "SELECT g.rsv_state state "
					+ "FROM rsv_golf g "
					+ "INNER JOIN customer c ON g.rsv_mail = c.cus_mail "
					+ "WHERE c.cus_mail = ?";
				
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
			
		if(rs.next()) {
			s = (String)(rs.getString("state"));
		}
		conn.close();
		return s;		
	}
	// 호출 : /customer/reviewListPerCustomer.jsp
	// cusMail, rsvNo에 따라 호텔리뷰값있는지 없는지 출력하는 메서드 / 호텔리뷰는 1번만
	public static String hotelReviewCk(String cusMail, int rsvNo) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail ReviewDAO.hotelReviewCk param");
		System.out.println(rsvNo + "<-- rsvNo ReviewDAO.hotelReviewCk param");
			
		String s = null;
			
		// DB연동
		Connection  conn = DBHelper.getConnection();
				
		String sql = "SELECT review.review_title reviewTitle "
					+ " FROM review_hotel review INNER JOIN rsv_hotel rsv "
					+ " ON review.rsv_no = rsv.rsv_no "
					+ " WHERE rsv_mail = ? AND review.rsv_no = ?";
				
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		stmt.setInt(2, rsvNo);
		ResultSet rs = stmt.executeQuery();
			
		if(rs.next()) {
			s = (String)(rs.getString("reviewTitle"));
		}
		conn.close();
		return s;		
	}
	// 호출 : /customer/reviewListPerCustomer.jsp
	// cusMail, rsvNo에 따라 골프리뷰값있는지 없는지 출력하는 메서드 / 호텔리뷰는 1번만
	public static String golfReviewCk(String cusMail, int rsvNo) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail ReviewDAO.golfReviewCk param");
		System.out.println(rsvNo + "<-- rsvNo ReviewDAO.golfReviewCk param");
			
		String s = null;
			
		// DB연동
		Connection  conn = DBHelper.getConnection();
				
		String sql = "SELECT review.review_title reviewTitle "
					+ " FROM review_golf review INNER JOIN rsv_golf rsv "
					+ " ON review.rsv_no = rsv.rsv_no "
					+ " WHERE rsv_mail = ? AND review.rsv_no = ?";
				
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		stmt.setInt(2, rsvNo);
		ResultSet rs = stmt.executeQuery();
			
		if(rs.next()) {
			s = (String)(rs.getString("reviewTitle"));
		}
		conn.close();
		return s;		
	}
	// 호출 : /customer/reviewListPerCustomer.jsp
	// 고객이 예약한 호텔rsvNo 출력하는 메서드 / 리뷰작성리스트
	public static ArrayList<HashMap<String, Object>> selectHotelRsvNo(String cusMail) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail ReviewDAO.selectHotelRsvNo param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		// DB연동
		Connection  conn = DBHelper.getConnection();
			
		String sql = "SELECT rsv_no rsvNo, checkin_date checkinDate, checkout_date checkoutDate "
					+ "FROM rsv_hotel "
					+ "WHERE rsv_mail = ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("rsvNo", rs.getInt("rsvNo"));
			m.put("checkinDate", rs.getString("checkinDate"));
			m.put("checkoutDate", rs.getString("checkoutDate"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	// 호출 : /customer/reviewListPerCustomer.jsp
	// 고객이 예약한 골프rsvNo 출력하는 메서드 / 리뷰작성리스트
	public static ArrayList<HashMap<String, Object>> selectGolfRsvNo(String cusMail) throws Exception {
		// 매개값 디버깅
		System.out.println(cusMail + "<-- cusMail ReviewDAO.selectGolfRsvNo param");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		// DB연동
		Connection  conn = DBHelper.getConnection();
			
		String sql = "SELECT rsv_no rsvNo, rsv_course rsvCourse, rsv_date rsvDate "
					+ "FROM rsv_golf "
					+ "WHERE rsv_mail = ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cusMail);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("rsvNo", rs.getInt("rsvNo"));
			m.put("rsvCourse", rs.getString("rsvCourse"));
			m.put("rsvDate", rs.getString("rsvDate"));
			list.add(m);
		}
		conn.close();
		return list;
	}
}
