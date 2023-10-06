package com.kh.DoctorLee.quize.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.quize.model.dao.QuizeDao;
import com.kh.DoctorLee.quize.model.vo.Quize;
import com.kh.DoctorLee.quize.model.vo.QuizeAnswer;
import com.kh.DoctorLee.quize.model.vo.QuizeChoice;

public class QuizeService {

	public ArrayList<Quize> selectList(){
		
		Connection conn = getConnection();
		ArrayList<Quize> list = new QuizeDao().selectList(conn);
		close(conn);
		return list;
	}
	
	public QuizeAnswer detailQuize(int quizeNo){
		
		Connection conn = getConnection();
		QuizeAnswer answer = new QuizeDao().detailQuize(conn, quizeNo);
		close(conn);
		return answer;
	}
	
	public int quizeChoiceInsert(int quizeNo,  int memNo, int choice) {
		
		Connection conn = getConnection();
		int result = new QuizeDao().quizeChoiceInsert(conn, quizeNo, memNo, choice);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
	
}
