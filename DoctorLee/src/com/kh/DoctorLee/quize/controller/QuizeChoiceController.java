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
		
		request.setCharacterEncoding("UTF-8");
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int quizeNo = Integer.parseInt(request.getParameter("quizeNo"));
		int choice = Integer.parseInt(request.getParameter("choice"));
		
		//int memNo = 2;
		//int quizeNo = 11;
		//int choice = 2;

		System.out.println("quizeNo" + quizeNo);
		System.out.println("memNo" + memNo);
		System.out.println("choice" + choice);
		
		int result = new QuizeService().quizeChoice(quizeNo, memNo, choice);
		System.out.println("QuizeListController" + result);
		if(result > 0) { // 포인트 획득 성공
			request.getSession().setAttribute("alertMsgPoint", "500포인트를 획득하였습니다.");
			response.sendRedirect(request.getContextPath() + "/list.qz");
		} else { // 실패
			request.getSession().setAttribute("alertMsgPoint", "포인트 획득에 실패하셨습니다.");
			response.sendRedirect(request.getContextPath() + "/list.qz");
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
