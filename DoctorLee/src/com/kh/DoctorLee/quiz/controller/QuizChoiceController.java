package com.kh.DoctorLee.quiz.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.DoctorLee.quiz.model.service.QuizService;
import com.kh.DoctorLee.quiz.model.service.QuizServiceImpl;

/**
 * Servlet implementation class QuizChoice
 */
@WebServlet("/choice.qz")
public class QuizChoiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizChoiceController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 퀴즈의 정답을 제출 했을 때 일어나는 일
		// 1. 퀴즈의 vote를 1 update함 => increaseVote
		
		// 2. 위의 과정이 성공 했다면 해당 quizNo에 memNo이 선택한 선지의 번호(choice)가 insert됨 => ChoiceInsert
		
		// 3. memNo이 제출한 선지가 정답인지 판단함
		// 정답은 TB_QUIZ_ANSWER의 ANSWER컬럼에 저장되어 있음
		// 따라서 TB_QUIZ_ANSWER에서 ANSWER컬럼을 select했을 때 있다면 정답, 없다면 오답임 => 각 각 result값 1, 0으로 바꿈
		// => quizChoiceIsRight (이 과정은 정답인지 오답인지만 확인하는 과정이기 때문에 따로 트랜잭션이 필요하지 않음)
		
		// 4. 3번의 결과인 result값이 1이라면 포인트를 획득 => quizGetPoint
		//    3번의 결과인 result값이 0이라면 포인트 변화 없음
		
		// 정답일 경우 : increaseVote + quizChoiceInsert + quizGetPoint를 묶어서 하나의 트랜잭션으로 처리해야 함
		// 오답일 경우 : increaseVote + quizChoiceInsert를 묶어서 하나의 트랜잭션으로 처리해야 함
		
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int quizNo = Integer.parseInt(request.getParameter("quizNo"));
		int choice = Integer.parseInt(request.getParameter("choice"));

		HashMap<String, Integer> map = new HashMap();
		map.put("memNo", memNo);
		map.put("quizNo", quizNo);
		map.put("choice", choice);

		int resultExist = new QuizServiceImpl().quizAnswerExist(map);
		
		if(resultExist ==  0) { // 답안 제출 한적 없음
			System.out.println("답 제출 한 적 있는지 " + resultExist);
			int result = new QuizServiceImpl().quizChoice(map);
			
			System.out.println("quizChoiceService의 return값 : " + result);
			
			HttpSession session = request.getSession();
			
			System.out.println(result);
			if(result == 2) { // 정답, 포인트 획득 성공
				session.setAttribute("alertMsg", "정답입니다! 500포인트를 획득하였습니다.");
				System.out.println("500포인트");
			} else if(result == 1){ // 오답, 포인트 획득 실패
				System.out.println("오답");
				session.setAttribute("alertMsg", "오답입니다");
			} else if(result == 0) { // 실패
				System.out.println("이미 제출");
				session.setAttribute("alertMsg", "이미 답을 제출하셨습니다.");
			}
			request.getRequestDispatcher("/list.qz?cpage=1").forward(request, response);
			
			System.out.println("----------------------------");
			
		}  else { // 답안 제출 한 적 있음
			System.out.println("답 제출 했음");
			request.getSession().setAttribute("alertMsg", "이미 답을 제출하셨습니다.");
			request.getRequestDispatcher("/list.qz?cpage=1").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
