package com.kh.DoctorLee.cli.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.cli.model.service.CliService;
import com.kh.DoctorLee.cli.model.vo.CliRes;

/**
 * Servlet implementation class CliResController
 */
@WebServlet("/insertCliRes.cli")
public class CliResController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CliResController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// POST 방식 => 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기
		int cliNo = Integer.parseInt(request.getParameter("cliNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String resDate = request.getParameter("resDate");
		String resTime = request.getParameter("resTime");
		
		System.out.println("클리닉 번호 : " + cliNo);
		
		// VO 데이터 가공
		CliRes c = new CliRes();
		c.setCliNo(cliNo);
		c.setMemNo(userNo);
		c.setResDate(resDate);
		c.setResTime(resTime);
		
		// Service 요청
		int result = new CliService().insertCliRes(c);
		
		// 응답화면 지정
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "클리닉 예약 성공");
			response.sendRedirect(request.getContextPath() + "/list.cli");
		} else {
			request.getSession().setAttribute("alertMsg", "클리닉 예약 실패");
			response.sendRedirect(request.getContextPath() + "/list.cli");
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
