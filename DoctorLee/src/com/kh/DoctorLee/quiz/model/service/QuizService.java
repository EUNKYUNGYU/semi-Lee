package com.kh.DoctorLee.quiz.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.commit;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;
import static com.kh.DoctorLee.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.quiz.model.dao.QuizDao;
import com.kh.DoctorLee.quiz.model.vo.Quiz;
import com.kh.DoctorLee.quiz.model.vo.QuizAnswer;

public class QuizService {

	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new QuizDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Quiz> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Quiz> list = new QuizDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public QuizAnswer detailQuiz(int quizNo){
		
		Connection conn = getConnection();
		QuizAnswer answer = new QuizDao().detailQuiz(conn, quizNo);
		close(conn);
		return answer;
	}
	
	public int increaseVote(int quizNo) {
		Connection conn = getConnection();
		int result = new QuizDao().increaseVote(conn, quizNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int quizChoice(int quizNo, int memNo, int choice) {
		
		Connection conn = getConnection();
		
		int result1 = 0; // increaseVote
		int result2 = 0; // quizChoiceInsert 
		int result4 = 0; // quizGetPoint
		
		result1 = new QuizDao().increaseVote(conn, quizNo);
		if(result1 > 0) { // increaseVote성공
			result2 = new QuizDao().quizChoiceInsert(conn, quizNo, memNo, choice);
			
			if(result2 > 0) { // quizChoiceInsert 퀴즈 답 제출 성공했을 경우 
				
				// 답 제출까지 성공했을 경우 정답인지 오답인지만 알려주는 결과
				// quizChoiceIsRight 정답인지 확인만 해줌, 트랜잭션 필요 없음
				int result3 = new QuizDao().quizChoiceIsRight(conn, quizNo, choice);
				
				if(result3 > 0) { // 정답인 경우, 4번까지 진행하고 커밋
					result4 = new QuizDao().quizGetPoint(conn, quizNo, memNo);
					
					if(result4 > 0) { // 이건 정답이고 포인트 획득 자체도 성공적으로 된 경우
						commit(conn);
					} else { // 정답 제출까지는 성공했지만 포인트 획득에 실패
						rollback(conn);
					} 
					
				} else { // 오답인 경우 바로 커밋
					commit(conn);
				}
			
			} else { // quizChoiceInsert 퀴즈 답 제출 실패  
				rollback(conn);
			}
		
		} else { // increaseVote실패
			rollback(conn);
		}
		
		close(conn);
		return ((result1 * result2) + result4);

	}
	
	public int quizAnswerExist(int memNo, int quizNo) {
		
		Connection conn = getConnection();
		int result = new QuizDao().quizAnswerExist(conn, memNo, quizNo);
		close(conn);
		return result;
		
	}
}
