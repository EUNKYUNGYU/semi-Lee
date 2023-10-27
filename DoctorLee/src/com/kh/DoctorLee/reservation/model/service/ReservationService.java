package com.kh.DoctorLee.reservation.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.commit;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;
import static com.kh.DoctorLee.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.common.tempate.Template;
import com.kh.DoctorLee.reservation.model.dao.ReservationDao;
import com.kh.DoctorLee.reservation.model.vo.GuestReservation;
import com.kh.DoctorLee.reservation.model.vo.Reservation;
public class ReservationService{

	private ReservationDao rsvtDao = new ReservationDao();
	
	// 진료 시간 체크
	public int checkRsvtTreat(HashMap<String, String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = rsvtDao.checkRsvtTreat(sqlSession, map);
		return result;
	}
	
	// 예약 insert
	public int insertRsvt(Reservation rsvt) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = rsvtDao.insertRsvt(sqlSession, rsvt);
		if(result > 0) sqlSession.commit();
		sqlSession.close();
		return result;
	}
				
	// 예약 조회
	public Reservation selectRsvt(String rsvtName) {
		SqlSession sqlSession = Template.getSqlSession();
		Reservation rsvt = rsvtDao.selectRsvt(sqlSession, rsvtName);
		return rsvt;
		
	}
	
	// 비회원
	public int checkRsvtTreatG(HashMap<String, String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		int checkRsvtResult = rsvtDao.checkRsvtTreatG(sqlSession, map);
		sqlSession.close();
		return checkRsvtResult;
	}
	
	public int insertRsvtG(GuestReservation gRsvt) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = rsvtDao.insertRsvtG(sqlSession, gRsvt);
		if(result > 0) sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public GuestReservation selectRsvtG(String rsvtNameG) {
		SqlSession sqlSession = Template.getSqlSession();
		GuestReservation gRsvt = rsvtDao.selectRsvtG(sqlSession, rsvtNameG);
		sqlSession.close();
		return gRsvt;
	}
	
}
