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
	
	public int increaseVote(int quizeNo) {
		Connection conn = getConnection();
		int result = new QuizeDao().increaseVote(conn, quizeNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int quizeChoice(int quizeNo, int memNo, int choice) {
		
		Connection conn = getConnection();
		
		int result1 = 0; // increaseVote
		int result2 = 0; // quizeChoiceInsert 
		int result4 = 0; // quizeGetPoint
		
		result1 = new QuizeDao().increaseVote(conn, quizeNo);
		if(result1 > 0) { // increaseVote성공
			System.out.println("퀴즈 increaseVote 성공하면 1 실패하면 0 : " + result1);
			result2 = new QuizeDao().quizeChoiceInsert(conn, quizeNo, memNo, choice);
			
			if(result2 > 0) { // quizeChoiceInsert 퀴즈 답 제출 성공했을 경우 
				System.out.println("퀴즈 답 제출 성공하면 1 실패하면 0 : " + result2);
				
				// 답 제출까지 성공했을 경우 정답인지 오답인지만 알려주는 결과
				// quizeChoiceIsRight 정답인지 확인만 해줌, 트랜잭션 필요 없음
				int result3 = new QuizeDao().quizeChoiceIsRight(conn, quizeNo, choice);
				
				if(result3 > 0) { // 정답인 경우, 4번까지 진행하고 커밋
					System.out.println("퀴즈 정답 맞으면 1 틀리면 0 : " + result3);
					result4 = new QuizeDao().quizeGetPoint(conn, quizeNo, memNo);
					
					if(result4 > 0) { // 이건 정답이고 포인트 획득 자체도 성공적으로 된 경우
						System.out.println("퀴즈 포인트 획득하면 1 실패하면 0 : " + result4);
						commit(conn);
					} else { // 정답 제출까지는 성공했지만 포인트 획득에 실패
						System.out.println("퀴즈 포인트 획득하면 1 실패하면 0 : " + result4);
						rollback(conn);
					} 
					
				} else { // 오답인 경우 바로 커밋
					System.out.println("퀴즈 정답 맞으면 1 틀리면 0 : " + result3);
					commit(conn);
				}
			
			} else { // quizeChoiceInsert 퀴즈 답 제출 실패  
				System.out.println("퀴즈 답 제출 성공하면 1 실패하면 0 : " + result2);
				rollback(conn);
			}
		
		} else { // increaseVote실패
			System.out.println("퀴즈 increaseVote 성공하면 1 실패하면 0 : " + result1);
			rollback(conn);
		}
		
		close(conn);
		return ((result1 * result2) + result4);

	}
	
	public int quizeAnswerExist(int memNo, int quizeNo) {
		
		Connection conn = getConnection();
		int result = new QuizeDao().quizeAnswerExist(conn, memNo, quizeNo);
		close(conn);
		return result;
		
	}
}
