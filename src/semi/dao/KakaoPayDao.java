package semi.dao;

import org.apache.ibatis.session.SqlSession;

import semi.dto.UserInfo;
import semi.dao.KakaoPayMapConfig;

	public class KakaoPayDao extends KakaoPayMapConfig {

	private String namespace = "kakaopaymapper.";	
	
	public boolean update(UserInfo dto) {
		int res = 0;
		SqlSession session = null;
		
		System.out.println(dto.getUserinfo_cache());
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "update", dto);
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		System.out.println(dto.getUserinfo_cache());
		
		return (res > 0)? true:false;
	}
}
