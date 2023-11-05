package com.kh.DoctorLee.quiz.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.quiz.model.vo.Quiz;
import com.kh.DoctorLee.quiz.model.vo.QuizAnswer;

public class QuizDao {

	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("quizMapper.selectListCount");
	}
	
	public ArrayList<Quiz> selectList(SqlSession sqlSession, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("quizMapper.selectList", null, rowBounds);
	}
	
	public QuizAnswer detailQuiz(SqlSession sqlSession, int quizNo){
		return sqlSession.selectOne("quizMapper.detailQuiz", quizNo);
	}
	
	public int increaseVote(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("quizMapper.increaseVote", map);
	}
	
	public int quizChoiceInsert(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("quizMapper.quizChoice", map);
	}
	
	public int quizChoiceIsRight(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("quizMapper.quizChoiceIsRight", map);
	}
	
	public int quizGetPoint(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("quizMapper.quizGetPoint", map);
	}
	
	public int quizAnswerExist(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("quizMapper.quizAnswerExist", map);
	}

	
}
