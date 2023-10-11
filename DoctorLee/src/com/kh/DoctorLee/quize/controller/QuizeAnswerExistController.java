package com.kh.DoctorLee.quize.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.quize.model.service.QuizeService;

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
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int quizeNo = Integer.parseInt(request.getParameter("quizeNo"));
	
		int result = new QuizeService().quizeAnswerExist(memNo, quizeNo);
		
		if(result > 0) {
			
		} else {
			
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
