package com.kh.DoctorLee.reservation.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.reservation.model.vo.GuestReservation;
import com.kh.DoctorLee.reservation.model.vo.Reservation;

public class ReservationDao {
	
	// 진료 시간 체크 
	public int checkRsvtTreat(SqlSession sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("rsvtMapper.checkRsvtTreat", map);
	}
	
	// 예약 insert
	public int insertRsvt(SqlSession sqlSession, Reservation rsvt) {
		return sqlSession.insert("rsvtMapper.insertRsvt", rsvt);
	}
	
	// 예약 조회
	public Reservation selectRsvt(SqlSession sqlSession, String rsvtName) {
		return sqlSession.selectOne("rsvtMapper.selectRsvt", rsvtName);
	}
	
	// ----- 비회원 예약 코드 ----
	public int checkRsvtTreatG(SqlSession sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("rsvtMapper.checkRsvtTreatG", map);
	}
	
	public int insertRsvtG(SqlSession sqlSession, GuestReservation rsvtG) {
		return sqlSession.insert("rsvtMapper.insertRsvtG", rsvtG);
	}
	
	public GuestReservation selectRsvtG(SqlSession sqlSession, String rsvtNameG) {
		return sqlSession.selectOne("rsvtMapper.selectRsvtG", rsvtNameG);
	}
	
}
