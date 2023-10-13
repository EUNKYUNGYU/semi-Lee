package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.mpBoard.model.service.MedManagementService;
import com.kh.DoctorLee.mpBoard.model.vo.MedManagement;

/**
 * Servlet implementation class MedManagementDetailController
 */
@WebServlet("/detail.medi")
public class MedManagementDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MedManagementDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int medManNo = Integer.parseInt(request.getParameter("nno"));
		//System.out.println(medManNo);
		
		MedManagement mm = new MedManagementService().selectMedManagement(medManNo);
		request.setAttribute("mm", mm);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/medManagementDetail.jsp");
		view.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
