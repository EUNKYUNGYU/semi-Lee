package com.kh.DoctorLee.medicine.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.medicine.model.service.MedicineService;
import com.kh.DoctorLee.medicine.model.vo.Medicine;

/**
 * Servlet implementation class SelectMedicineController
 */
@WebServlet("/select.med")
public class SelectMedicineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMedicineController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String medName = request.getParameter("medName");
		ArrayList<Medicine> medList = new MedicineService().selectMedicine(medName);
		request.setAttribute("medList", medList);
		request.getRequestDispatcher("views/medicine/medicineSearchAfter.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
