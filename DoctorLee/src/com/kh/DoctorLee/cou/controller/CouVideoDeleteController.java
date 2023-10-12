package com.kh.DoctorLee.cou.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.cou.model.service.CouService;

/**
 * Servlet implementation class CouVideoDeleteController
 */
@WebServlet("/deleteVideo.cou")
public class CouVideoDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouVideoDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 값 뽑기
		int videoNo = Integer.parseInt(request.getParameter("cvno"));
		
		// Service 요청
		int result = new CouService().deleteVideo(videoNo);
		
		// 응답화면 요청
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "영상 삭제 성공!");
			
		} else {
			request.getSession().setAttribute("alertMsg", "영상 삭제 실패");;
		}
		
		response.sendRedirect(request.getContextPath() + "/couVideoList.cou?cpage=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
