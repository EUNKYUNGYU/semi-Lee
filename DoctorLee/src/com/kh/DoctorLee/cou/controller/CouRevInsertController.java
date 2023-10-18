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
 * Servlet implementation class CouRevInsertController
 */
@WebServlet("/couRevInsert.cou")
public class CouRevInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouRevInsertController() {
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
		int reviewStar = Integer.parseInt(request.getParameter("reviewStar"));
		String revContent = request.getParameter("revContent");
		
		System.out.println(reviewStar);
		
		// VO 가공
		CouRev c = new CouRev();
		c.setCouNo(couNo);
		c.setMemNo(memNo);
		c.setCouScope(reviewStar);
		c.setRevContent(revContent);
				
		// Service 요청
		int result = new CouService().insertCouRev(c);
		
		// 응답화면 지정
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "리뷰 작성 성공");
			response.sendRedirect(request.getContextPath() + "/couDetail.cou?cno="+couNo);
		} else {
			request.getSession().setAttribute("alertMsg", "리뷰 작성 실패");
			response.sendRedirect(request.getContextPath() + "/couDetail.cou?cno="+couNo);
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
