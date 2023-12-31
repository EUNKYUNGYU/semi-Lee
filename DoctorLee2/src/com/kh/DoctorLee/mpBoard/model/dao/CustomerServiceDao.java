package com.kh.DoctorLee.mpBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.member.model.dao.MemberDao;
import com.kh.DoctorLee.mpBoard.model.vo.Category;
import com.kh.DoctorLee.mpBoard.model.vo.CustomerService;

public class CustomerServiceDao {

private Properties prop = new Properties();
	
	public CustomerServiceDao() {
		
		String file = MemberDao.class.getResource("/sql/customerService/customerService-mapper.xml").getPath();
		//System.out.println(file);
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<CustomerService> selectCustomerServiceList(Connection conn){
		
		ArrayList<CustomerService>list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCustomerServiceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CustomerService cs = new CustomerService();
				cs.setInqNo(rset.getInt("INQ_NO"));
				cs.setMemNo(rset.getInt("MEM_NO"));
				cs.setInqType(rset.getInt("INQ_TYPE"));
				cs.setInqTitle(rset.getString("INQ_TITLE"));
				cs.setInqContent(rset.getString("INQ_CONTENT"));
				cs.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(cs);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	public CustomerService selectCustomerService(Connection conn, int customerServiceNo) {
		
		CustomerService cs = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCustomerService");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, customerServiceNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cs = new CustomerService();
				cs.setInqNo(rset.getInt("INQ_NO"));
				cs.setMemNo(rset.getInt("MEM_NO"));
				cs.setInqType(rset.getInt("INQ_TYPE"));
				cs.setInqTitle(rset.getString("INQ_TITLE"));
				cs.setInqContent(rset.getString("INQ_CONTENT"));
				cs.setCreateDate(rset.getDate("CREATE_DATE"));
				cs.setDelStatus(rset.getString("DEL_STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return cs;
	}
	
	public int deleteCustomerService(Connection conn, int customerServiceNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCustomerService");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, customerServiceNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int insertAdminInq(Connection conn, CustomerService cs) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdminInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cs.getMemNo());
			pstmt.setInt(2, Integer.parseInt(cs.getCategory()));
			pstmt.setString(3, cs.getInqTitle());
			pstmt.setString(4, cs.getInqContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Category> selectCategoryList(Connection conn){
		
		ArrayList<Category> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
			
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("CATEGORY_NO"),
									  rset.getString("CATEGORY_NAME")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}
