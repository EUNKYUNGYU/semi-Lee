package com.kh.DoctorLee.reservation.controller;

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
 * Servlet implementation class HosRsvtGuestController
 */
@WebServlet("/hosRsvt.guest")
public class HosRsvtGuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosRsvtGuestController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int hno = Integer.parseInt(request.getParameter("hno"));
		
		//Hospital hos = new HospitalService();
		// ArrayList<Doctor> docList = new HospitalService();
		
		//request.setAttribute("hos", hos);
		//	request.setAttribute("docList", docList);
		//System.out.println(docList);
		// http://localhost:8765/DoctorLee/hosRsvt.guest?hno=32
		request.getRequestDispatcher("/views/hospital/guestRsvtPage.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
