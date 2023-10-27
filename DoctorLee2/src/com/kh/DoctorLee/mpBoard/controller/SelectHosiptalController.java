package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.hospital.model.vo.Hospital;
import com.kh.DoctorLee.mpBoard.model.service.BookmarkService;

/**
 * Servlet implementation class SelectHosiptalController
 */
@WebServlet("/selectHos.mk")
public class SelectHosiptalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectHosiptalController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String hosName  = request.getParameter("hosName");
		
		ArrayList<Hospital> hosList = new BookmarkService().selectHospital(hosName);
		request.setAttribute("hosList", hosList);
		request.setAttribute("hosName", hosName);
		
		request.getRequestDispatcher("views/myPage/bookmarkSearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
