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
}
