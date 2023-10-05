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
 * Servlet implementation class couVideoInsertController
 */
@WebServlet("/insertVideo.cou")
public class couVideoInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public couVideoInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String videoTitle = request.getParameter("title");
		String videoChannel = request.getParameter("channel");
		String videoAddress = request.getParameter("address");
		
		CouVideo cv = new CouVideo();
		cv.setVideoTitle(videoTitle);
		cv.setChannelName(videoChannel);
		cv.setVideoAddress(videoAddress);
		
		int result = new CouService().insertVideo(cv); 
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "동영상 등록 성공");
			response.sendRedirect(request.getContextPath() + "/couVideoList.cou?cpage=1");
		} else {
			request.getSession().setAttribute("alertMsg", "동영상 등록 실패");
			response.sendRedirect(request.getContextPath() + "/couVideoList.cou?cpage=1");
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
