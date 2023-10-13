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
import com.kh.DoctorLee.cli.model.vo.CliResTime;

/**
 * Servlet implementation class AjaxTimeController
 */
@WebServlet("/ajaxTime.cli")
public class AjaxTimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTimeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 값 뽑기 
		int cliNo = Integer.parseInt(request.getParameter("cliNo"));
		String resDate = (request.getParameter("resDate")).replace(".", "-");
		
		// Service 요청
		ArrayList<CliResTime> timeList = new CliService().selectCliTimeList(cliNo, resDate);
		
//		System.out.println(timeList);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(timeList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
