package com.kh.DoctorLee.cou.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.cou.model.service.CouService;
import com.kh.DoctorLee.cou.model.vo.CouRes;

/**
 * Servlet implementation class CouResController
 */
@WebServlet("/insertCouRes.cou")
public class CouResController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouResController() {
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
		int couNo = Integer.parseInt(request.getParameter("couNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String resDate = request.getParameter("resDate");
		String resTime = request.getParameter("resTime");
		
		// VO 가공
		CouRes c = new CouRes();
		c.setCouNo(couNo);
		c.setMemNo(memNo);
		c.setResDate(resDate);
		c.setResTime(resTime);
		
		// Service 요청
		int result = new CouService().insertCouRes(c);
		
		// 응답화면 지정
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "상담 예약 성공");
			response.sendRedirect(request.getContextPath() + "/couResList.cou");
		} else {
			request.getSession().setAttribute("alertMsg", "상담 예약 실패");
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
