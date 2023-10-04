package com.kh.DoctorLee.cou.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.cou.model.dao.CouDao;
import com.kh.DoctorLee.cou.model.vo.CouVideo;

public class CouService {

	public ArrayList<CouVideo> selectVideoList() {
		Connection conn = getConnection();
		
		ArrayList<CouVideo> list = new CouDao().selectVideoList(conn);
		
		close(conn);
		
		return list;
		
	}

	public int insertVideo(CouVideo cv) {
		Connection conn = getConnection();
		return 0;
	}

}
