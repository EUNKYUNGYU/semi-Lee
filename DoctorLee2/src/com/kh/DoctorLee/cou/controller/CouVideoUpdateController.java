package com.kh.DoctorLee.cou.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.cou.model.service.CouService;
import com.kh.DoctorLee.cou.model.vo.CouVideo;

/**
 * Servlet implementation class CouVideoUpdateController
 */
@WebServlet("/couVideoUpdate.cou")
public class CouVideoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouVideoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//POST 방식(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기
		int videoNo = Integer.parseInt(request.getParameter("videoNo"));
		String title = request.getParameter("title");
		String channel = request.getParameter("channel");
		String address = request.getParameter("address");
		
		// VO 가공
		CouVideo c = new CouVideo();
		c.setVideoNo(videoNo);
		c.setVideoTitle(title);
		c.setChannelName(channel);
		c.setVideoAddress(address);
		
		// Service 요청
		int result = new CouService().updateCouVideo(c);
		
		// 응답화면 지정
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "영상 수정 성공!");
			
			response.sendRedirect(request.getContextPath() + "/couVideoList.cou?cpage=1");
		} else {
			request.setAttribute("errorMsg", "영상 수정 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
