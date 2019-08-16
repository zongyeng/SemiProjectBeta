package semi.biz;

import semi.dao.loginDao;
import semi.dto.chattingDto;
import semi.dto.loginDto;


public class loginBiz {

	loginDao dao = new loginDao();
	
	public int signup(String userinfo_name,
			String userinfo_nickname, String userinfo_id, String userinfo_password1, String userinfo_password2,
			char userinfo_sex,int userinfo_age,String userinfo_phonenumber,String userinfo_email) {
		if(!userinfo_password1.equals(userinfo_password2)) {
			return -1;
		} else if(userinfo_password1.length()<9) {
			return -2;
		}
		return dao.signup(userinfo_name, userinfo_nickname, userinfo_id, userinfo_password1, userinfo_sex, userinfo_age, userinfo_phonenumber, userinfo_email);
	}
	public loginDto login(String id , String password) {
		return dao.login(id, password);
	}
	public boolean idchk(String id) {
		
		return dao.idchk(id);
	}
	public int update(loginDto updatedto,String userinfo_password2) {
		if(userinfo_password2.length()<9) {
			return -1;
		} else if(!updatedto.getUserinfo_password().equals(userinfo_password2)) {
			return -2;
		}
		return dao.update(updatedto);
	}
	public boolean nicknamechk(String nickname) {
		return dao.nicknamechk(nickname);
	}
	
	public boolean withdrawal(int userseq) {
		return dao.withdrawal(userseq);
	}
	
	public loginDto snslogin() {
		return dao.snslogin();
	}
	public loginDto searchid(loginDto dto) {
		return dao.searchid(dto);
	}
	public loginDto searchpassword(loginDto dto) {
		return dao.searchpassword(dto);
	}
}

	
