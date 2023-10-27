package com.kh.DoctorLee.hospital.model.dao;

import java.sql.Connection;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.hospital.model.vo.Doctor;
import com.kh.DoctorLee.hospital.model.vo.Hospital;
import com.kh.DoctorLee.review.model.vo.Review;

public class HospitalDao {
	
	// 전체 병원 개수 조회(페이징 처리)
	public int selectHosCount(SqlSession sqlSession, String keyword) {
		return sqlSession.selectOne("hospitalMapper.selectHosCount", keyword);
	}
	
	// 전체 병원 리스트 조회
	public ArrayList<Hospital> selectHosList(SqlSession sqlSession, PageInfo pi, String keyword, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("hospitalMapper.selectHosList", keyword, rowBounds);
	}
	
	
	// 병원 상세페이지 데이터 조회
	public Hospital selectHosDetail(SqlSession sqlSession, int hno) {
		return sqlSession.selectOne("hospitalMapper.selectHosDetail", hno);
	}

	// 의료진 조회
	public ArrayList<Doctor> selectDoc(SqlSession sqlSession, int hno) {
		return (ArrayList)sqlSession.selectList("hospitalMapper.selectDoc", hno);
	}
	
	// 리뷰 조회
	public ArrayList<Review> selectReview(SqlSession sqlSession, int hno) {
		return (ArrayList)sqlSession.selectList("hospitalMapper.selectReview", hno);
	}
	
	
}
