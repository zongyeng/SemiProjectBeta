package semi.biz;

import semi.dao.loginDao;


public class loginBiz {

	loginDao dao = new loginDao();
	
	public boolean signup(int userinfo_controlno,String userinfo_name,
			String userinfo_nickname, String userinfo_id, String userinfo_password,
			char userinfo_sex,int userinfo_age,int userinfo_phonnumber,String userinfo_email) {
		return dao.signup(userinfo_controlno, userinfo_name, userinfo_nickname, userinfo_id, userinfo_password, userinfo_sex, userinfo_age, userinfo_phonnumber, userinfo_email);
	}
	
}
