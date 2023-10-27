package com.kh.DoctorLee.mpBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.mpBoard.model.dao.CustomerServiceDao;
import com.kh.DoctorLee.mpBoard.model.vo.Category;
import com.kh.DoctorLee.mpBoard.model.vo.CustomerService;

public class CustomerServiceService {
	
	public ArrayList<CustomerService> selectCustomerServiceList(){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CustomerService> list = new CustomerServiceDao().selectCustomerServiceList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}
	
	public CustomerService selectCustomerService(int customerServiceNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		CustomerService cs = new CustomerServiceDao().selectCustomerService(conn, customerServiceNo);
		
		JDBCTemplate.close(conn);
		
		return cs;
	}
	
	public int deleteCustomerService(int customerServiceNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new CustomerServiceDao().deleteCustomerService(conn, customerServiceNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	}
	
	public int insertAdminInq(CustomerService cs) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new CustomerServiceDao().insertAdminInq(conn, cs);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	}
	
	public ArrayList<Category> selectCategoryList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Category> list = new CustomerServiceDao().selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	
	}
	
}
