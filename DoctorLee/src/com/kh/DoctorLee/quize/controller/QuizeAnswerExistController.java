package com.kh.DoctorLee.quize.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.quize.model.service.QuizeService;
import com.kh.DoctorLee.quize.model.vo.QuizeAnswer;

/**
 * Servlet implementation class QuizeAnswerExistController
 */
@WebServlet("/answerExist.qz")
public class QuizeAnswerExistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizeAnswerExistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 퀴즈 제출시 이미 제출한 값이 있는지 없는지 판단
		// 제출 값이 있다면 정답 확인 가능하게
		// 제출 값이 없다면 정답 확인 불가능하게
		
		String due = request.getParameter("due"); // due가 true일 경우 제출 기한이 남음, false일 경우 제출 기한이 지남
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		if(due.equals("true")) { // 제출 기한이 남은 경우
			
			int result = new QuizeService().quizeAnswerExist(memNo, qno);
			
			if(result > 0) { // 답안 제출 한적 있음, 정답 화면 보여주기
				int qno1 = Integer.parseInt(request.getParameter("qno"));
				QuizeAnswer answer = new QuizeService().detailQuize(qno1);
				request.setAttribute("answer", answer);
				request.getRequestDispatcher("views/quize/quizeDetail.jsp").forward(request, response);
			} else { // 답안 제출 한 적 없음, 답 제출 먼저 하라고 alert창 띄워주기
				request.getSession().setAttribute("alertMsg", "답을 먼저 제출해주십시오");
				response.sendRedirect(request.getContextPath() + "/list.qz?cpage=1");
			}
			
		} else { // 제출 기한이 지난 경우 답 제출 한 적 없어도, 정답 화면 보여주기
			int qno1 = Integer.parseInt(request.getParameter("qno"));
			QuizeAnswer answer = new QuizeService().detailQuize(qno1);
			request.setAttribute("answer", answer);
			request.getRequestDispatcher("views/quize/quizeDetail.jsp").forward(request, response);
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
