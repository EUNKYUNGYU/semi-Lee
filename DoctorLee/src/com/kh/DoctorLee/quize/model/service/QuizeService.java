package com.kh.DoctorLee.quize.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.quize.model.dao.QuizeDao;
import com.kh.DoctorLee.quize.model.vo.Quize;

public class QuizeService {

	public ArrayList<Quize> selectList(){
		
		Connection conn = getConnection();
		ArrayList<Quize> list = new QuizeDao().selectList(conn);
		close(conn);
		return list;
	}
	
	
}
