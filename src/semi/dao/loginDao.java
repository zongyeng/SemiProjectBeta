package semi.dao;

import org.apache.ibatis.session.SqlSession;

import semi.dto.chattingDto;
import semi.dto.loginDto;

public class loginDao {
	
private String namespace = "loginmapper.";
	
	sqlMapConfig getSqlSessionFactory = new sqlMapConfig();
	
	public boolean signup(String userinfo_name,String userinfo_nickname, String userinfo_id, String userinfo_password,
			char userinfo_sex,int userinfo_age,String userinfo_phonenumber,String userinfo_email) {
		
		SqlSession session = null;
		loginDto dto = new loginDto();
		dto.setUserinfo_name(userinfo_name);
		dto.setUserinfo_nickname(userinfo_nickname);
		dto.setUserinfo_id(userinfo_id);
		dto.setUserinfo_password(userinfo_password);
		dto.setUserinfo_sex(userinfo_sex);
		dto.setUserinfo_age(userinfo_age);
		dto.setUserinfo_phonenumber(userinfo_phonenumber);
		dto.setUserinfo_email(userinfo_email);
		
		
		int res = 0;
		
		try {
			session = getSqlSessionFactory.getLoginSessionFactory().openSession();
			res = session.insert(namespace+"insert",dto);
			
			if(res > 0) {
				session.commit();
			}else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res>0;
	}
	public loginDto login(String id, String password) {
		
		SqlSession session = null;
		loginDto dto = new loginDto();
		
		dto.setUserinfo_id(id);
		dto.setUserinfo_password(password);
		
		try {
			session = getSqlSessionFactory.getLoginSessionFactory().openSession();
			dto = session.selectOne(namespace+"select",dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	public boolean idchk(String id) {

		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory.getLoginSessionFactory().openSession();
			res = session.selectOne(namespace+"idchk", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res==0;
	}
}
