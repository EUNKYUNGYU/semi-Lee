package com.kh.DoctorLee.cou.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.cou.model.service.CouService;
import com.kh.DoctorLee.cou.model.vo.Cou;

/**
 * Servlet implementation class CouResFormController
 */
@WebServlet("/resForm.cou")
public class CouResFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouResFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 값 뽑기
		int couNo = Integer.parseInt(request.getParameter("cno"));
		
		// Service 요청
		// 상담사 정보 불러오기
		Cou c = new CouService().selectCou(couNo);
		
		// 응답화면 요청
		request.setAttribute("c", c);
		request.getRequestDispatcher("/views/cou/CouResView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
