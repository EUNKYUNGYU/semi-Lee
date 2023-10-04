package com.kh.DoctorLee.quize.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.quize.model.dao.QuizeDao;
import com.kh.DoctorLee.quize.model.vo.Quize;
import com.kh.DoctorLee.quize.model.vo.QuizeAnswer;

public class QuizeService {

	public ArrayList<Quize> selectList(){
		
		Connection conn = getConnection();
		ArrayList<Quize> list = new QuizeDao().selectList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<QuizeAnswer> QuizeAnswer(){
		
		Connection conn = getConnection();
		ArrayList<QuizeAnswer> list = new QuizeDao().QuizeAnswer(conn);
		close(conn);
		return list;
	}
	
	
	
	
	
}
