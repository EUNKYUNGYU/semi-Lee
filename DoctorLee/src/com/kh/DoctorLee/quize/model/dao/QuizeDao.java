package com.kh.DoctorLee.quize.model.dao;

public class QuizeDao {

<<<<<<< HEAD
=======
	private Properties prop = new Properties();
	
	public QuizeDao() {
		String filePath = QuizeDao.class.getResource("/sql/quize/quize-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Quize> selectList(Connection conn){
		
		ArrayList<Quize> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				Quize q = new Quize();
				q.setQuizeNo(rset.getInt("QUIZE_NO"));
				q.setQuizeTitle(rset.getString("QUIZE_TITLE"));
				q.setQuizeContent(rset.getString("QUIZE_CONTENT"));
				q.setVote(rset.getInt("VOTE"));
				q.setCreateDate(rset.getString("CREATE_DATE"));
				q.setDeadline(rset.getString("DEADLINE"));
				q.setChoice1(rset.getString("CHOICE1"));
				q.setChoice2(rset.getString("CHOICE2"));
				q.setChoice3(rset.getString("CHOICE3"));
				q.setChoice4(rset.getString("CHOICE4"));
				
				list.add(q);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

>>>>>>> 165e7a4a7a8829564a6320af1d77ee9401a7faaa
}
