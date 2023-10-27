package com.kh.DoctorLee.quiz.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.quiz.model.vo.Quiz;
import com.kh.DoctorLee.quiz.model.vo.QuizAnswer;

public class QuizDao {

	private Properties prop = new Properties();
	
	public QuizDao() {
		String filePath = QuizDao.class.getResource("/sql/quiz/quiz-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Quiz> selectList(Connection conn, PageInfo pi){
		
		ArrayList<Quiz> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
			
				Quiz q = new Quiz();
				q.setQuizNo(rset.getInt("QUIZ_NO"));
				q.setQuizTitle(rset.getString("QUIZ_TITLE"));
				q.setQuizContent(rset.getString("QUIZ_CONTENT"));
				q.setVote(rset.getInt("VOTE"));
				q.setCreateDate(rset.getString("CREATE_DATE"));
				q.setDeadline(rset.getString("DEADLINE"));
				q.setChoice1(rset.getString("CHOICE1"));
				q.setChoice2(rset.getString("CHOICE2"));
				q.setChoice3(rset.getString("CHOICE3"));
				q.setChoice4(rset.getString("CHOICE4"));
				
				list.add(q);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	
	public QuizAnswer detailQuiz(Connection conn, int quizNo){
		
		QuizAnswer answer = new QuizAnswer();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("detailQuiz");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quizNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				answer.setQuizTitle(rset.getString("QUIZ_TITLE"));
				answer.setAnswer(rset.getInt("ANSWER"));
				answer.setAnswerDetail(rset.getString("ANSWER_DETAIL"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return answer;
		
	}
	
	public int increaseVote(Connection conn, int quizNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseVote");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quizNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		
		return result;
		
	}
	
	public int quizChoiceInsert(Connection conn, int quizNo, int memNo, int choice) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("quizChoice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quizNo);
			pstmt.setInt(2, memNo);
			pstmt.setInt(3, choice);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 

		return result;
		
	}
	
	public int quizChoiceIsRight(Connection conn, int quizNo, int choice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("quizChoiceIsRight");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quizNo);
			pstmt.setInt(2, choice);
			
			rset = pstmt.executeQuery();
			if(rset.next()) result = 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		
		return result;
	}
	
	public int quizGetPoint(Connection conn, int quizNo, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("quizGetPoint");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		
		return result;
		
	}
	
	public int quizAnswerExist(Connection conn, int memNo, int quizNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("quizAnswerExist");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2,  quizNo);

			rset = pstmt.executeQuery();
			if(rset.next()) result = 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		
		return result;
	}
	

	
}
