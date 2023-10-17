package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.mpBoard.model.service.CustomerServiceService;
import com.kh.DoctorLee.mpBoard.model.vo.CustomerService;

/**
 * Servlet implementation class CustomerServiceDetailController
 */
@WebServlet("/detail.cs")
public class CustomerServiceDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServiceDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int customerServiceNo = Integer.parseInt(request.getParameter("nno"));
		System.out.println(customerServiceNo);
		
		CustomerService cs = new CustomerServiceService().selectCustomerService(customerServiceNo);
		request.setAttribute("cs", cs);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/customerServiceDetail.jsp");
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
