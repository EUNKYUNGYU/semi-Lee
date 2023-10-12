package com.kh.DoctorLee.cou.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.cli.model.vo.CliResDate;
import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.cou.model.vo.CouVideo;

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
	
	public int selectVideoListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectVideoListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	public ArrayList<CouVideo> selectVideoList(Connection conn, PageInfo pi) {
		
		ArrayList<CouVideo> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectVideoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
			
			pstmt.setString(1, cv.getVideoTitle());
			pstmt.setString(2, cv.getChannelName());
			pstmt.setString(3, cv.getVideoAddress());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public CouVideo selectCouVideo(Connection conn, int videoNo) {
		
		CouVideo c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCouVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, videoNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new CouVideo();
				c.setVideoNo(rset.getInt("VIDEO_NO"));
				c.setMemNo(rset.getInt("MEM_NO"));
				c.setVideoTitle(rset.getString("VIDEO_TITLE"));
				c.setChannelName(rset.getString("CHANNEL_NAME"));
				c.setVideoAddress(rset.getString("VIDEO_ADDRESS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}
	
	public int updateCouVideo(Connection conn, CouVideo c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCouVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getVideoTitle());
			pstmt.setString(2, c.getChannelName());
			pstmt.setString(3, c.getVideoAddress());
			pstmt.setInt(4, c.getVideoNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteVideo(Connection conn, int videoNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteVideo");
		 
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, videoNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
