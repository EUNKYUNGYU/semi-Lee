package com.kh.DoctorLee.mpBoard.model.service;

import java.util.ArrayList;

import com.kh.DoctorLee.mpBoard.model.vo.FamDiary;
import com.kh.DoctorLee.mpBoard.model.vo.MyDiary;

public interface DiaryServiceI {
	ArrayList<MyDiary> selectMyDiary();
	ArrayList<FamDiary> selectFamDiary();

}
