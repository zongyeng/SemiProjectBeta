package semi.dto;

import java.util.Date;

public class UserInfo {

	private int userinfo_seq;
	private int userinfo_controlno;
	private String userinfo_name;
	private String userinfo_nickname;
	private String userinfo_id;
	private String userinfo_password;
	private char userinfo_sex;
	private int userinfo_age;
	private String userinfo_phonnumber;
	private String userinfo_email;
	private Date userinfo_signdate;
	private char userinfo_enable;
	private int userinfo_cache;
	
	
	public UserInfo() {
		super();
	}

	public UserInfo(int userinfo_seq, int userinfo_controlno, String userinfo_name, String userinfo_nickname,
			String userinfo_id, String userinfo_password, char userinfo_sex, int userinfo_age,
			String userinfo_phonnumber, String userinfo_email, Date userinfo_signdate, char userinfo_enable,
			int userinfo_cache) {
		super();
		this.userinfo_seq = userinfo_seq;
		this.userinfo_controlno = userinfo_controlno;
		this.userinfo_name = userinfo_name;
		this.userinfo_nickname = userinfo_nickname;
		this.userinfo_id = userinfo_id;
		this.userinfo_password = userinfo_password;
		this.userinfo_sex = userinfo_sex;
		this.userinfo_age = userinfo_age;
		this.userinfo_phonnumber = userinfo_phonnumber;
		this.userinfo_email = userinfo_email;
		this.userinfo_signdate = userinfo_signdate;
		this.userinfo_enable = userinfo_enable;
		this.userinfo_cache = userinfo_cache;
	}
	
	public int getUserinfo_seq() {
		return userinfo_seq;
	}
	public void setUserinfo_seq(int userinfo_seq) {
		this.userinfo_seq = userinfo_seq;
	}
	public int getUserinfo_controlno() {
		return userinfo_controlno;
	}
	public void setUserinfo_controlno(int userinfo_controlno) {
		this.userinfo_controlno = userinfo_controlno;
	}
	public String getUserinfo_name() {
		return userinfo_name;
	}
	public void setUserinfo_name(String userinfo_name) {
		this.userinfo_name = userinfo_name;
	}
	public String getUserinfo_nickname() {
		return userinfo_nickname;
	}
	public void setUserinfo_nickname(String userinfo_nickname) {
		this.userinfo_nickname = userinfo_nickname;
	}
	public String getUserinfo_id() {
		return userinfo_id;
	}
	public void setUserinfo_id(String userinfo_id) {
		this.userinfo_id = userinfo_id;
	}
	public String getUserinfo_password() {
		return userinfo_password;
	}
	public void setUserinfo_password(String userinfo_password) {
		this.userinfo_password = userinfo_password;
	}
	public char getUserinfo_sex() {
		return userinfo_sex;
	}
	public void setUserinfo_sex(char userinfo_sex) {
		this.userinfo_sex = userinfo_sex;
	}
	public int getUserinfo_age() {
		return userinfo_age;
	}
	public void setUserinfo_age(int userinfo_age) {
		this.userinfo_age = userinfo_age;
	}
	public String getUserinfo_phonnumber() {
		return userinfo_phonnumber;
	}
	public void setUserinfo_phonnumber(String userinfo_phonnumber) {
		this.userinfo_phonnumber = userinfo_phonnumber;
	}
	public String getUserinfo_email() {
		return userinfo_email;
	}
	public void setUserinfo_email(String userinfo_email) {
		this.userinfo_email = userinfo_email;
	}
	public Date getUserinfo_signdate() {
		return userinfo_signdate;
	}
	public void setUserinfo_signdate(Date userinfo_signdate) {
		this.userinfo_signdate = userinfo_signdate;
	}
	public char getUserinfo_enable() {
		return userinfo_enable;
	}
	public void setUserinfo_enable(char userinfo_enable) {
		this.userinfo_enable = userinfo_enable;
	}
	public int getUserinfo_cache() {
		return userinfo_cache;
	}
	public void setUserinfo_cache(int userinfo_cache) {
		this.userinfo_cache = userinfo_cache;
	}

	
	
}