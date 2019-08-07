package semi.biz;

import semi.dao.loginDao;
import semi.dto.chattingDto;
import semi.dto.loginDto;


public class loginBiz {

	loginDao dao = new loginDao();
	
	public boolean signup(int userinfo_controlno,String userinfo_name,
			String userinfo_nickname, String userinfo_id, String userinfo_password,
			char userinfo_sex,int userinfo_age,int userinfo_phonenumber,String userinfo_email) {
		return dao.signup(userinfo_controlno, userinfo_name, userinfo_nickname, userinfo_id, userinfo_password, userinfo_sex, userinfo_age, userinfo_phonenumber, userinfo_email);
	}
	public loginDto login(String id , String password) {
		return dao.login(id, password);
	}
}

	
