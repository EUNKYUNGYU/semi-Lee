package com.kh.DoctorLee.quize.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.member.model.vo.Member;
import com.kh.DoctorLee.quize.model.service.QuizeService;

/**
 * Servlet implementation class QuizeChoice
 */
@WebServlet("/choice.qz")
public class QuizeChoiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizeChoiceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 퀴즈의 정답을 제출 했을 때 일어나는 일
		// 1. 퀴즈의 vote를 1 update함 => increaseVote
		
		// 2. 위의 과정이 성공 했다면 해당 quizeNo에 memNo이 선택한 선지의 번호(choice)가 insert됨 => quizeChoiceInsert
		
		// 3. memNo이 제출한 선지가 정답인지 판단함
		// 정답은 TB_QUIZE_ANSWER의 ANSWER컬럼에 저장되어 있음
		// 따라서 TB_QUIZE_ANSWER에서 ANSWER컬럼을 select했을 때 있다면 정답, 없다면 오답임 => 각 각 result값 1, 0으로 바꿈
		// => quizeChoiceIsRight (이 과정은 정답인지 오답인지만 확인하는 과정이기 때문에 따로 트랜잭션이 필요하지 않음)
		
		// 4. 3번의 결과인 result값이 1이라면 포인트를 획득 => quizeGetPoint
		//    3번의 결과인 result값이 0이라면 포인트 변화 없음
		
		// 정답일 경우 : increaseVote + quizeChoiceInsert + quizeGetPoint를 묶어서 하나의 트랜잭션으로 처리해야 함
		// 오답일 경우 : increaseVote + quizeChoiceInsert를 묶어서 하나의 트랜잭션으로 처리해야 함
		
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int quizeNo = Integer.parseInt(request.getParameter("quizeNo"));
		int choice = Integer.parseInt(request.getParameter("choice"));

		System.out.println("quizeChoiceController에서 quizeNo " + quizeNo);
		System.out.println("quizeChoiceController에서 memNo " + memNo);
		System.out.println("quizeChoiceController에서 choice " + choice);
		
		
		int result = new QuizeService().quizeChoice(quizeNo, memNo, choice);
			
		System.out.println("quizeChoiceService의 return값 : " + result);
		
		System.out.println(result);
		if(result == 2) { // 정답, 포인트 획득 성공
			request.getSession().setAttribute("alertMsg", "500포인트를 획득하였습니다.");
			response.sendRedirect(request.getContextPath() + "/list.qz");
		} else if(result == 1){ // 오답, 포인트 획득 실패
			request.getSession().setAttribute("alertMsg", "포인트 획득에 실패하셨습니다.");
			response.sendRedirect(request.getContextPath() + "/list.qz");
		} else if(result == 0) { // 실패
			request.getSession().setAttribute("alertMsg", "제출에 실패하였습니다. 다시 시도해 주십시오.");
			response.sendRedirect(request.getContextPath() + "/list.qz");
		}

		System.out.println("----------------------------");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
