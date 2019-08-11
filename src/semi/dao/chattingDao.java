package semi.dao;

import org.apache.ibatis.session.SqlSession;

import semi.dto.chattingDto;

public class chattingDao {
	
	private String namespace = "webchattingmapper.";
	
	sqlMapConfig getSqlSessionFactory = new sqlMapConfig();
	
	public chattingDto selectOne(int seq) {
		SqlSession session = null;
		chattingDto dto = new chattingDto();
		try {
			session = getSqlSessionFactory.getChattingSessionFactory().openSession();
			dto = session.selectOne(namespace+"chatting_selectOne",seq);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	
}
