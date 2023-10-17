package com.kh.DoctorLee.medicine.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.medicine.model.service.MedicineService;
import com.kh.DoctorLee.medicine.model.vo.Medicine;

/**
 * Servlet implementation class UpdateMedicineController
 */
@WebServlet("/update.med")
public class UpdateMedicineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMedicineController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String updateMedName = request.getParameter("updateName");
		String updatePreInfo = request.getParameter("updatePreInfo");
		String updateCauction = request.getParameter("updateCauction");
		String medName = request.getParameter("mname");
		
		Medicine med = new Medicine();
		med.setMedName(updateMedName);
		med.setPreInfo(updatePreInfo);
		med.setCauction(updateCauction);
		int result = new MedicineService().updateMedicine(med,medName);
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/search.med" );
			
		} else {
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
