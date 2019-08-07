package semi.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import semi.dto.AlbumDto;

public class AlbumDao extends SqlMapConfig_Music {

	private String namespace = "album_mapper.";
	
	public List<AlbumDto> album_selectList(){
		
		SqlSession session = null;
		List<AlbumDto> list = new ArrayList<AlbumDto>();
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "selectList_album");
			System.out.println("selectList_album 실행" + list.size());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectList_album 실행 Error");
		}
		return list;
	}
	
	public AlbumDto album_selectOne(int seq) {
		
		SqlSession session = null;
		AlbumDto dto = new AlbumDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "selectOne_album", seq);
			System.out.println("selectOne_album 실행" + dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectOne_album 실행 Error");
		} finally {
			session.close();
		}
		return dto;
	}

	public int album_insert(AlbumDto dto){
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace + "insert_album", dto);
			System.out.println("insert_album 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert_album 실행 Error");
		} finally {
			session.close();
		}
		return res;
	}
	
	public int album_delete(int seq){
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.delete(namespace + "delete_album", seq);
			System.out.println("delete_album 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete_album 실행 Error");
		} finally {
			session.close();
		}
		return res;
	}
	
	public int album_update(AlbumDto dto){
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "update_album", dto);
			System.out.println("update_album 실행" + res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update_album 실행 Error");
		} finally {
			session.close();
		}
		return res;
	}
}
