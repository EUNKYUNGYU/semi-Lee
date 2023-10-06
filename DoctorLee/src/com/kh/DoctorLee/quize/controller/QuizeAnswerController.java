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
 * Servlet implementation class QuizeAnswerController
 */
@WebServlet("/detail.qz")
public class QuizeAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizeAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int quizeNo = Integer.parseInt(request.getParameter("qno"));
		QuizeAnswer answer = new QuizeService().detailQuize(quizeNo);
		request.setAttribute("answer", answer);
		request.getRequestDispatcher("views/quize/quizeDetail.jsp").forward(request, response);
		System.out.println("QuizeAnswerController" + quizeNo);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
