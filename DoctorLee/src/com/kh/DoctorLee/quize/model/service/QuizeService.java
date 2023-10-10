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
	
	public int quizeChoice(int quizeNo, int memNo, int choice) {
		
		Connection conn = getConnection();
		int result1 = 0;
		int result2 = 0;
		int result3 = 1;
		
		/*
		result1 = new QuizeDao().quizeChoiceInsert(conn, quizeNo, memNo, choice);
		//result2 = new QuizeDao().quizeChoiceIsRight(conn, quizeNo, choice);
		//result3 = new QuizeDao().quizeGetPoint(conn, quizeNo, memNo);
		//마술인가?
		
		
		if(result1 > 0) {
			
			result2 = new QuizeDao().quizeChoiceIsRight(conn, quizeNo, choice);
			
			if(result2 > 0) {
				
				result3 = new QuizeDao().quizeGetPoint(conn, quizeNo, memNo);
				
				if(result3 > 0) {
					
					// 이건 정답이고 포인트 획득 자체도 성공적으로 된 경우
					// 알럿창으로 포인트 획득 했다고 띄워주기
					commit(conn);
					
				} else {
					// 이건 정답이지만 
					// 포인트 획득 insert문이 실패한 경우
					rollback(conn);
				}
				
			} else {
				// 이건 답안 제출은 성공했는데 오답인 경우
				// 알럿창으로 오답이라 포인트 획득을 못 했다고 띄워주기
				rollback(conn);
			}
			
		} else {
			// 이건 답안 제출자체를 실패했을 경우
			// 에러 메세지 띄워주기
			rollback(conn);
		}*/
		if(result1 > 0) {
			
			result2 = new QuizeDao().quizeChoiceIsRight(conn, quizeNo, choice);
			
			if(result2 > 0) {
				
				result3 = new QuizeDao().quizeGetPoint(conn, quizeNo, memNo);
				
				if(result3 > 0) {
					
					// 이건 정답이고 포인트 획득 자체도 성공적으로 된 경우
					// 알럿창으로 포인트 획득 했다고 띄워주기
					commit(conn);
					
				} 
			}}else if(result1 * result2 * result3 == 0) rollback(conn);
		
		
		
		return (result1 * result2 * result3);
	}
}
