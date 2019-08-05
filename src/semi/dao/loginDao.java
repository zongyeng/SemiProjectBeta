package semi.dao;

import org.apache.ibatis.session.SqlSession;

import semi.dto.chattingDto;
import semi.dto.loginDto;

public class loginDao {
	
private String namespace = "loginmapper.";
	
	sqlMapConfig getSqlSessionFactory = new sqlMapConfig();
	
	public boolean signup(int userinfo_controlno,String userinfo_name,
			String userinfo_nickname, String userinfo_id, String userinfo_password,
			char userinfo_sex,int userinfo_age,int userinfo_phonnumber,String userinfo_email) {
		
		SqlSession session = null;
		loginDto dto = new loginDto();
		int res = 0;
		
		try {
			session = getSqlSessionFactory.getLoginSessionFactory().openSession();
			res = session.insert(namespace+"signup",dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res>0;
	}
	
}

