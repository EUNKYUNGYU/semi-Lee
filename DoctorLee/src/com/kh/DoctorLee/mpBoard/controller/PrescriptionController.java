package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.mpBoard.model.service.MedManagementService;
import com.kh.DoctorLee.mpBoard.model.vo.MedManagement;

/**
 * Servlet implementation class PrescriptionController
 */
@WebServlet("/prescription.h")
public class PrescriptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrescriptionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int memNo = Integer.parseInt(request.getParameter("mno"));
		ArrayList<MedManagement> list = new MedManagementService().selectMedManagementh(memNo);
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/prescription/prescription.jsp");
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
