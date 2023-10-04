package com.kh.DoctorLee.quize.model.service;

public class QuizeService {

<<<<<<< HEAD
=======
	public ArrayList<Quize> selectList(){
		
		Connection conn = getConnection();
		ArrayList<Quize> list = new QuizeDao().selectList(conn);
		close(conn);
		return list;
	}
	
	
	
	
>>>>>>> 165e7a4a7a8829564a6320af1d77ee9401a7faaa
}
