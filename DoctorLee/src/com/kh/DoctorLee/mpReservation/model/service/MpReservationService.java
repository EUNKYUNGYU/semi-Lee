package com.kh.DoctorLee.mpReservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.mpReservation.model.dao.MpReservationDao;
import com.kh.DoctorLee.mpReservation.model.vo.MpReservation;

public class MpReservationService {
	public ArrayList<MpReservation> selectReservation(int memNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<MpReservation> list = new MpReservationDao().selectReservation(conn,memNo);
		JDBCTemplate.close(conn);
		return list;
	}

}
