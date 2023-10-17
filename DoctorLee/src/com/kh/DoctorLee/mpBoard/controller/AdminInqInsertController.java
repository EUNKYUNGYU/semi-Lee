package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.mpBoard.model.service.CustomerServiceService;
import com.kh.DoctorLee.mpBoard.model.vo.CustomerService;

/**
 * Servlet implementation class AdminInqInsertController
 */
@WebServlet("/insert.cs")
public class AdminInqInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInqInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String inqTitle = request.getParameter("inqTitle");
		String inqContent = request.getParameter("inqContent");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
	
		CustomerService cs = new CustomerService();
		cs.setInqTitle(inqTitle);
		cs.setInqContent(inqContent);
		cs.setMemNo(memNo);
		
		int result = new CustomerServiceService().insertAdminInq(cs);
		
		if(result > 0) {
			//request.getSession().setAttribute("alertMsg", "삭제성공");
			response.sendRedirect(request.getContextPath() + "/customerService.mp");
			
		} else {
			request.setAttribute("errorMsg", "실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
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
