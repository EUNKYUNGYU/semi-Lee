package com.kh.DoctorLee.cli.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.cli.model.service.CliService;
import com.kh.DoctorLee.cli.model.vo.CliRes;
import com.kh.DoctorLee.cli.model.vo.Clinic;

/**
 * Servlet implementation class CliDetailController
 */
@WebServlet("/cliDetail.cli")
public class CliDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CliDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기
		int cliNo = Integer.parseInt(request.getParameter("cno"));
		
		// Service 요청
		Clinic c = new CliService().selectCli(cliNo);
		
		// 리뷰 버튼을 예약한 사용자에게만 보이게
		ArrayList<CliRes> list = new CliService().selectResMem(cliNo);
		
		request.setAttribute("c", c);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/cli/cliDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
