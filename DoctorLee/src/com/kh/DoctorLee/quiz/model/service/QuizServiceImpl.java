package com.kh.DoctorLee.quiz.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.commit;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;
import static com.kh.DoctorLee.common.JDBCTemplate.rollback;
import static com.kh.DoctorLee.common.template.Template.getSqlSession;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.quiz.model.dao.QuizDao;
import com.kh.DoctorLee.quiz.model.vo.Quiz;
import com.kh.DoctorLee.quiz.model.vo.QuizAnswer;

public class QuizServiceImpl implements QuizServiceInterface{

	QuizDao quizDao = new QuizDao();
	
	@Override
	public int selectListCount() {
		SqlSession sqlSession = getSqlSession();
		int listCount = quizDao.selectListCount(sqlSession);
		sqlSession.close();
		return listCount;
	}

	@Override
	public ArrayList<Quiz> selectList(PageInfo pi) {
		SqlSession sqlSession = getSqlSession();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Quiz> list = quizDao.selectList(sqlSession, rowBounds);
		sqlSession.close();
		return list;
	}

	@Override
	public QuizAnswer detailQuiz(int quizNo) {
		SqlSession sqlSession = getSqlSession();
		QuizAnswer quizAnswer = quizDao.detailQuiz(sqlSession, quizNo);
		sqlSession.close();
		return quizAnswer;
	}

	@Override
	public int increaseVote(HashMap<String, Integer> map) {
		SqlSession sqlSession = getSqlSession();
		int result = quizDao.increaseVote(sqlSession, map);
		sqlSession.close();
		return result;
	}

	@Override
	public int quizChoice(HashMap<String, Integer> map) {
		
		SqlSession sqlSession = getSqlSession();
		
		int result1 = 0; // increaseVote
		int result2 = 0; // quizChoiceInsert 
		int result4 = 0; // quizGetPoint
		
		result1 = new QuizDao().increaseVote(sqlSession, map);
		if(result1 > 0) { // increaseVote성공
			result2 = new QuizDao().quizChoiceInsert(sqlSession, map);
			
			if(result2 > 0) { // quizChoiceInsert 퀴즈 답 제출 성공했을 경우 
				
				// 답 제출까지 성공했을 경우 정답인지 오답인지만 알려주는 결과
				// quizChoiceIsRight 정답인지 확인만 해줌, 트랜잭션 필요 없음
				int result3 = new QuizDao().quizChoiceIsRight(sqlSession, map);
				
				if(result3 > 0) { // 정답인 경우, 4번까지 진행하고 커밋
					result4 = new QuizDao().quizGetPoint(sqlSession, map);
					
					if(result4 > 0) { // 이건 정답이고 포인트 획득 자체도 성공적으로 된 경우
						sqlSession.commit();
					} else { // 정답 제출까지는 성공했지만 포인트 획득에 실패
						sqlSession.rollback();
					} 
					
				} else { // 오답인 경우 바로 커밋
					sqlSession.commit();
				}
			
			} else { // quizChoiceInsert 퀴즈 답 제출 실패  
				sqlSession.rollback();
			}
		
		} else { // increaseVote실패
			sqlSession.rollback();
		}
		sqlSession.close();
		return ((result1 * result2) + result4);
	}

	@Override
	public int quizAnswerExist(HashMap<String, Integer> map) {
		SqlSession sqlSession = getSqlSession();
		int result = quizDao.quizAnswerExist(sqlSession, map);
		sqlSession.close();
		return result;
	}

	
}
