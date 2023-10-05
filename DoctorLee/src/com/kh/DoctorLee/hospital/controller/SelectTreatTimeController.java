package com.kh.DoctorLee.hospital.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.hospital.model.service.HospitalService;
import com.kh.DoctorLee.hospital.model.vo.Hospital;

/**
 * Servlet implementation class SelectTreatTimeController
 */
@WebServlet("/SelectTreatTimeController")
public class SelectTreatTimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectTreatTimeController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Hospital hos = new HospitalService().selectTreatTime();
		
		int hosNo = hos.getHosNo();
		String hosBegin = hos.getTreatBegin();
		String hosEnd = hos.getTreatEnd();
		System.out.println(hosBegin);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
