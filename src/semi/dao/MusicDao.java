package semi.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import semi.dto.MusicDto;

public class MusicDao extends SqlMapConfig_Music {
	
	private String namespace = "music_mapper.";
	
	public List<MusicDto> selectList_music(){
		
		SqlSession session = null;
		List<MusicDto> list = new ArrayList<MusicDto>();
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "selectList_music");
			System.out.println("selectList_music 실행" + list.size());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectList_music 실행 Error");
		} finally {
			session.close();
		}
		return list;
	}
	
	public MusicDto selectOne_music(int seq) {
		
		SqlSession session = null;
		MusicDto dto = new MusicDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "selectOne_music", seq);
			System.out.println("selectOne_music 실행"+dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectOne_music 실행 Error");
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public int insert_music(MusicDto dto){
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace + "insert_music", dto);
			System.out.println("insert_music 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert_music 실행 Error");
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}
	
	public int delete_music(int seq){
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.delete(namespace + "delete_music", seq);
			System.out.println("delete_music 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete_music 실행 Error");
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}
	
	public int update_music(MusicDto dto){
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "update_music", dto);
			System.out.println("update_music 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update_music 실행 Error");
		} finally {
			session.commit();			
			session.close();
		}
		return res;
	}
}
