package semi.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import semi.dto.MusicBoardDto;

public class MusicBoardDao extends SqlMapConfig_MusicBD {
	
	private String namespace = "musicbd_mapper.";
	
	public List<MusicBoardDto> selectList_musicbd(){
		
		SqlSession session = null;
		List<MusicBoardDto> list = new ArrayList<MusicBoardDto>();
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "selectList_musicbd");
			System.out.println("selectList_musicbd 실행" + list.size());
			//System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectList_musicbd 실행 Error");
		} finally {
			session.close();
		}
		return list;
	}
	
	public MusicBoardDto selectOne_musicbd(int seq) {
		
		SqlSession session = null;
		MusicBoardDto dto = new MusicBoardDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "selectOne_musicbd", seq);
			System.out.println("selectOne_musicbd 실행"+dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectOne_musicbd 실행 Error");
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public int insert_musicbd(MusicBoardDto dto){
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace + "insert_musicbd", dto);
			System.out.println("insert_musicbd 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert_musicbd 실행 Error");
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}
	
	public int delete_musicbd(int seq){
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.delete(namespace + "delete_musicbd", seq);
			System.out.println("delete_musicbd 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete_musicbd 실행 Error");
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}
	
	public int update_musicbd(MusicBoardDto dto){
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "update_musicbd", dto);
			System.out.println("update_musicbd 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update_musicbd 실행 Error");
		} finally {
			session.commit();			
			session.close();
		}
		return res;
	}
	
	public int answerInsert(MusicBoardDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace + "insert_answer", dto);
			System.out.println("insert_answer 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert_answer 실행 Error");
		} finally {
			session.commit();			
			session.close();
		}
		return res;
	}
	
	public int answerUpdate(int boardno) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "update_answer", boardno);
			System.out.println("update_answer 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update_answer 실행 Error");
		} finally {
			session.commit();			
			session.close();
		}
		return res;
	}
}
