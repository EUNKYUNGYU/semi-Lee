package com.kh.DoctorLee.review.model.service;

import java.sql.Connection;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.review.model.dao.ReviewDao;
import com.kh.DoctorLee.review.model.vo.Review;

public class ReviewService {
	
	public int insertReview(Review r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertReview(conn, r);
		if(result > 0) JDBCTemplate.commit(conn);
		else JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;		
	}

}
