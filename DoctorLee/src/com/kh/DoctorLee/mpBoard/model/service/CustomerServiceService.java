package com.kh.DoctorLee.mpBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.mpBoard.model.dao.CustomerServiceDao;
import com.kh.DoctorLee.mpBoard.model.vo.CustomerService;

public class CustomerServiceService {
	
	public ArrayList<CustomerService> selectCustomerServiceList(){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CustomerService> list = new CustomerServiceDao().selectCustomerServiceList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}

}
