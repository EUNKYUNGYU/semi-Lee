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
 * Servlet implementation class InsertMedicine
 */
@WebServlet("/insert.med")
public class InsertMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMedicine() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String medName = request.getParameter("medName");
		String preInfo = request.getParameter("preInfo");
		String cauction = request.getParameter("cauction");
		
		Medicine med = new Medicine();
		
		med.setMedName(medName);
		med.setPreInfo(preInfo);
		med.setCauction(cauction);
		
		int result = new MedicineService().insertMedicine(med);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/search.med");
		}else {
			request.setAttribute("errorMsg", "등록 실패");
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
