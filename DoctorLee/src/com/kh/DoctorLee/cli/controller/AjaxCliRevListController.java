package com.kh.DoctorLee.cli.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.DoctorLee.cli.model.service.CliService;
import com.kh.DoctorLee.cli.model.vo.CliRev;

/**
 * Servlet implementation class AjaxCliRevListController
 */
@WebServlet("/ajaxRevList.cli")
public class AjaxCliRevListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCliRevListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 값 뽑기
		int cliNo = Integer.parseInt(request.getParameter("cno"));
		
//		System.out.println(cliNo);
		
		// Service 요청
		ArrayList<CliRev> list = new CliService().selectCliRevList(cliNo);
//		System.out.println(list);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
