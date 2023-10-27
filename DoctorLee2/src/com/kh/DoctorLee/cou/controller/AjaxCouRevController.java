package com.kh.DoctorLee.cou.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.cou.model.service.CouService;
import com.kh.DoctorLee.cou.model.vo.CouRev;

/**
 * Servlet implementation class AjaxCouRevController
 */
@WebServlet("/ajaxRev.cou")
public class AjaxCouRevController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCouRevController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기
		int couNo = Integer.parseInt(request.getParameter("cno"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int couScope = Integer.parseInt(request.getParameter("couScope"));
		String revContent = request.getParameter("revContent");
		
		// VO 가공
		CouRev c = new CouRev();
		c.setCouNo(couNo);
		c.setMemNo(memNo);
		c.setCouScope(couScope);
		c.setRevContent(revContent);
		
		// Service 요청
		int result = new CouService().insertCouRev(c);
		
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
