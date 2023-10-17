package com.kh.DoctorLee.reservation.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.DoctorLee.reservation.model.dao.ReservationDao;
import com.kh.DoctorLee.reservation.model.vo.Reservation;
public class ReservationService {

	// 진료 시간 체크
	public int checkRsvtTreat(String rsvtDate, String rsvtTime) {
		Connection conn = getConnection();
		int checkRsvtResult = new ReservationDao().checkRsvtTreat(conn, rsvtDate, rsvtTime);
		close(conn);
		return checkRsvtResult;
	}
	
	// 예약 insert
	public int insertRsvt(Reservation rsvt) {
		Connection conn = getConnection();
		int result = new ReservationDao().insertRsvt(conn, rsvt);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
				
	// 예약 조회
	public Reservation selectRsvt(String rsvtName) {
		Connection conn = getConnection();
		Reservation selectRsvt = new ReservationDao().selectRsvt(conn, rsvtName);
		close(conn);
		return selectRsvt;
		
	}
	
}
