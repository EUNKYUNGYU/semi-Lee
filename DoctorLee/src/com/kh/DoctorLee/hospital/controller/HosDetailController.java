package com.kh.DoctorLee.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.hospital.model.service.HospitalService;
import com.kh.DoctorLee.hospital.model.vo.Doctor;
import com.kh.DoctorLee.hospital.model.vo.Hospital;

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
		//http://localhost:8765/DoctorLee/views/hospital/hosDetail.dy?hno=4
		int hno = Integer.parseInt(request.getParameter("hno"));
		
		Hospital hos = new HospitalService().hosDetail(hno);
		ArrayList<Doctor> docList = new HospitalService().selectDoc(hno);
		
		if(hos != null) {
			request.setAttribute("hos", hos);
			request.setAttribute("docList", docList);
			request.getRequestDispatcher("views/hospital/hosDetail.jsp").forward(request, response);
		} else {
			
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
