package com.kh.DoctorLee.cou.model.service;

import java.util.ArrayList;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.cou.model.vo.Cou;
import com.kh.DoctorLee.cou.model.vo.CouCar;
import com.kh.DoctorLee.cou.model.vo.CouRes;
import com.kh.DoctorLee.cou.model.vo.CouResTime;
import com.kh.DoctorLee.cou.model.vo.CouRev;
import com.kh.DoctorLee.cou.model.vo.CouVideo;
import com.kh.DoctorLee.member.model.vo.Member;

public interface CouServiceI {

	int selectVideoListCount();
	
	ArrayList<CouVideo> selectVideoList(PageInfo pi);
	
	int insertVideo(CouVideo cv);
	
	CouVideo selectCouVideo(int videoNo);
	
	int updateCouVideo(CouVideo c);
	
	int deleteVideo(int videoNo);
	
	ArrayList<Cou> selectCouList();
	
	Cou selectCou(int couNo);
	
	ArrayList<CouResTime> selectCouDate(int couNo);
	
	ArrayList<CouResTime> selectCouTimeList(int couNo, String resDate);
	
	int insertCouRes(CouRes c);
	
	int selectResMem(CouRes cr);
	
	int insertCouRev(CouRev c);
	
	ArrayList<CouRev> selectCouRevList(int couNo);
	
	int selectRevCount(CouRes cr);
	
	ArrayList<CouCar> selectCouCarList(int couNo);
	
	Double selectCouScope(int couNo);
}

