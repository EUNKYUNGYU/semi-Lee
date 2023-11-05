package com.kh.DoctorLee.quiz.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.quiz.model.vo.Quiz;
import com.kh.DoctorLee.quiz.model.vo.QuizAnswer;

public interface QuizServiceInterface {

	int selectListCount(); 
	
	ArrayList<Quiz> selectList(PageInfo pi);
	
	QuizAnswer detailQuiz(int quizNo);
	
	int increaseVote(HashMap<String, Integer> map);
	
	int quizChoice(HashMap<String, Integer> map);
	
	int quizAnswerExist(HashMap<String, Integer> map); 
	
	
}
