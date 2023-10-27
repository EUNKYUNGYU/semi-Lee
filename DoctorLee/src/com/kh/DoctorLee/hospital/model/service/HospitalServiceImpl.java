package com.kh.DoctorLee.hospital.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.common.template.Template;
import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.hospital.model.dao.HospitalDao;
import com.kh.DoctorLee.hospital.model.vo.Doctor;
import com.kh.DoctorLee.hospital.model.vo.Hospital;
import com.kh.DoctorLee.review.model.vo.Review;

public class HospitalServiceImpl {

	private HospitalDao hosDao = new HospitalDao();
	
	// 병원 개수 조회
	public int selectHosCount(String keyword) {
		SqlSession sqlSession = Template.getSqlSession();
		int hosCount = hosDao.selectHosCount(sqlSession, keyword);
		sqlSession.close();
		return hosCount;
	}
	
	// 병원 리스트 조회
	public ArrayList<Hospital> selectHosList(PageInfo pi, String keyword){
		SqlSession sqlSession = Template.getSqlSession();
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage() - 1) * pi.getBoardLimit()), pi.getBoardLimit());
		ArrayList<Hospital> hosList = hosDao.selectHosList(sqlSession, pi, keyword, rowBounds);
		sqlSession.close();
		return hosList;
	}
	
	// 병원 상세 조회
	public Hospital selectHosDetail(int hno) {
		SqlSession sqlSession = Template.getSqlSession();
		Hospital hos = hosDao.selectHosDetail(sqlSession, hno);
		sqlSession.close();
		return hos;
	}
	
	// 의료진 조회
	public ArrayList<Doctor> selectDoc(int hno) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Doctor> docList = hosDao.selectDoc(sqlSession, hno);
		sqlSession.close();
		return docList;
	}
	
	// 리뷰 조회
	public ArrayList<Review> selectReview(int hno) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Review> docList = hosDao.selectReview(sqlSession, hno);
		sqlSession.close();
		return docList;
	}
	

}
