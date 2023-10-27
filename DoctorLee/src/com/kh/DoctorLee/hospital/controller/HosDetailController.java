package com.kh.DoctorLee.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.DoctorLee.hospital.model.service.HospitalServiceImpl;
import com.kh.DoctorLee.hospital.model.vo.Doctor;
import com.kh.DoctorLee.hospital.model.vo.Hospital;
import com.kh.DoctorLee.review.model.vo.Review;

/**
 * Servlet implementation class HosDetailController
 */
@WebServlet("/hosDetail.dy")
public class HosDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosDetailController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HospitalServiceImpl hosService = new HospitalServiceImpl();
		
		//http://localhost:8765/DoctorLee/views/hospital/hosDetail.dy?hno=4
		int hno = Integer.parseInt(request.getParameter("hno"));
		
		Hospital hos = hosService.selectHosDetail(hno);
		ArrayList<Doctor> docList = hosService.selectDoc(hno);
		ArrayList<Review> reviewList = hosService.selectReview(hno);
		
		HttpSession session = request.getSession();
		session.setAttribute("hos", hos);
		request.setAttribute("docList", docList);
		request.setAttribute("reviewList", reviewList);
		
		request.getRequestDispatcher("views/hospital/hosDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
