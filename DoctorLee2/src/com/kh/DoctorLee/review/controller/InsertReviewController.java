package com.kh.DoctorLee.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.DoctorLee.review.model.service.ReviewService;
import com.kh.DoctorLee.review.model.vo.Review;

/**
 * Servlet implementation class InsertReviewController
 */
@WebServlet("/review.hos")
public class InsertReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hno = Integer.parseInt(request.getParameter("hno"));
		String writer = request.getParameter("rvWriter");
		String content = request.getParameter("rvContent");
		int scope = Integer.parseInt(request.getParameter("scope"));
		//String rvWriter = request.getParameter("rvWriter");
		
		Review r = new Review();
		r.setReviewHos(hno);
		r.setScope(scope);
		r.setContent(content);
		r.setReviewWriter(writer);
		System.out.println(r);
		
		int result = new ReviewService().insertReview(r);
		
		if(result > 0) {
			response.setContentType("application/json; charset=UTF-8");
			JSONObject jO = new JSONObject();
			jO.put("writer", r.getReviewWriter());
			jO.put("content", r.getContent());
			response.getWriter().print(jO);
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
