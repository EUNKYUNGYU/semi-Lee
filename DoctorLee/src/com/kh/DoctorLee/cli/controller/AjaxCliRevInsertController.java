package com.kh.DoctorLee.cli.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.cli.model.service.CliService;
import com.kh.DoctorLee.cli.model.vo.CliRev;

/**
 * Servlet implementation class AjaxCliRevInsertController
 */
@WebServlet("/cliRevInsert.cli")
public class AjaxCliRevInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCliRevInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST => 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기
		int cno = Integer.parseInt(request.getParameter("cno"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int cliScope = Integer.parseInt(request.getParameter("cliScope"));
		String revContent = request.getParameter("revContent");
		
		// VO 가공
		CliRev c = new CliRev();
		c.setCliNo(cno);
		c.setMemNo(memNo);
		c.setCliScope(cliScope);
		c.setRevContent(revContent);
		
		
		// Service 요청
		int result = new CliService().insertCliRev(c);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
