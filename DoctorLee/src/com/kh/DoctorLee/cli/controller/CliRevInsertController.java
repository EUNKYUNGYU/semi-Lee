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
 * Servlet implementation class CliRevInsertController
 */
@WebServlet("/cliRev.cli")
public class CliRevInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CliRevInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST => 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기(클리닉 번호, 리뷰작성자 번호, 평점, 리뷰 내용)
		int cliNo = Integer.parseInt(request.getParameter("cno"));
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		int scope = Integer.parseInt(request.getParameter("reviewStar"));
		
		String cliRev = request.getParameter("revContent");
		
		System.out.println(cliNo);
		System.out.println(memNo);
		System.out.println(scope);
		System.out.println(cliRev);
		
		// VO 가공
		CliRev c = new CliRev();
		c.setCliNo(cliNo);
		c.setMemNo(memNo);
		c.setCliScope(scope);
		c.setRevContent(cliRev);
		
		// Service 요청
		int result = new CliService().insertCliRev(c);
		
		// 화면 요청
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "클리닉 리뷰 등록 완료!");
			response.sendRedirect(request.getContextPath() + "/cliDetail.cli?cno="+cliNo);
		} else {
			request.getSession().setAttribute("alertMsg", "클리닉 리뷰 등록 실패");
			response.sendRedirect(request.getContextPath() + "/cliDetail.cli?cno="+cliNo);
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
