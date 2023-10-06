package com.kh.DoctorLee.quize.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.quize.model.service.QuizeService;
import com.kh.DoctorLee.quize.model.vo.QuizeChoice;

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
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int quizeNo = Integer.parseInt(request.getParameter("quizeNo"));
		int choice = Integer.parseInt(request.getParameter("choice"));
		
		int result1 = new QuizeService().quizeChoiceInsert(quizeNo, memNo, choice);
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
