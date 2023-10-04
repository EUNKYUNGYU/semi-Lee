package com.kh.DoctorLee.cou.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.cou.model.vo.CouVideo;
import static com.kh.DoctorLee.common.JDBCTemplate.*;

public class CouDao {
	
	private Properties prop = new Properties();
	
	public CouDao() {
		String filePath = CouDao.class.getResource("/sql/cou/cou-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<CouVideo> selectVideoList(Connection conn) {
		
		ArrayList<CouVideo> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectVideoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CouVideo cv = new CouVideo();
				cv.setVideoNo(rset.getInt("VIDEO_NO"));
				cv.setMemNo(rset.getInt("MEM_NO"));
				cv.setVideoTitle(rset.getString("VIDEO_TITLE"));
				cv.setChannelName(rset.getString("CHANNEL_NAME"));
				cv.setVideoAddress(rset.getString("VIDEO_ADDRESS"));
				
				list.add(cv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int insertVideo(Connection conn, CouVideo cv) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

}
