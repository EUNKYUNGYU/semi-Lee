package com.kh.DoctorLee.cli.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.cli.model.service.CliService;
import com.kh.DoctorLee.cli.model.vo.CliResDate;
import com.kh.DoctorLee.cli.model.vo.Clinic;

/**
 * Servlet implementation class CliResFormController
 */
@WebServlet("/cliRes.cli")
public class CliResFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CliResFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 값 뽑기
		int cliNo = Integer.parseInt(request.getParameter("cno"));
		
		// Service 요청
		// 클리닉 정보 불러오기
		Clinic c = new CliService().selectCli(cliNo);
		
		// 클리닉 예약 가능 날짜 불러오기
		ArrayList<CliResDate> dateList = new CliService().selectCliDateList(cliNo);
		
		System.out.print(dateList);
		
		// 응답화면 요청
		request.setAttribute("c", c);
		request.getRequestDispatcher("views/cli/cliResView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
