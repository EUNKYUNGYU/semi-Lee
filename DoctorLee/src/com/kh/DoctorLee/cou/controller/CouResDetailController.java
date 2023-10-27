package com.kh.DoctorLee.cou.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.DoctorLee.cou.model.service.CouService;
import com.kh.DoctorLee.cou.model.vo.Cou;
import com.kh.DoctorLee.cou.model.vo.CouCar;
import com.kh.DoctorLee.cou.model.vo.CouRes;
import com.kh.DoctorLee.cou.model.vo.CouRev;
import com.kh.DoctorLee.member.model.vo.Member;

/**
 * Servlet implementation class CouResDetailController
 */
@WebServlet("/couDetail.cou")
public class CouResDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouResDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기
		int couNo = Integer.parseInt(request.getParameter("cno"));
		
		// Service 요청
		Cou c = new CouService().selectCou(couNo);
		
		// 리뷰 버튼을 예약한 사용자에게만 보이게
		HttpSession session = request.getSession(); 
				
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		CouRes cr = new CouRes();
		cr.setCouNo(couNo);
		cr.setMemNo(loginUser.getMemNo());
				
		int result = new CouService().selectResMem(cr);
		
		// 리뷰는 한 사람당 한 번만 작성 가능하게
		int result2 = new CouService().selectRevCount(cr);
		
		// 상담사 경력 및 자격 가져오기
		ArrayList<CouCar> list = new CouService().selectCouCarList(couNo);
		
		request.setAttribute("c", c);
		request.setAttribute("result", result);
		request.setAttribute("result2", result2);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/cou/couResDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
