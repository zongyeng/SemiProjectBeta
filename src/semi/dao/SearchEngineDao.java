package semi.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import semi.dto.SearchEngineDto;

public class SearchEngineDao {

	sqlMapConfig map = new sqlMapConfig();
	private String namespace = "SearchEngine_mapper.";
	
	public List<SearchEngineDto> searchartist(String searchcontent) {
		
		SqlSession session = null;
		List<SearchEngineDto> list = new ArrayList<SearchEngineDto>();
		
		try {
			session = map.getSearchEngineSessionFactory().openSession();
			list = session.selectList(namespace + "searchartist",searchcontent);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public List<SearchEngineDto> searchmusic(String searchcontent) {
		
		SqlSession session = null;
		List<SearchEngineDto> list = new ArrayList<SearchEngineDto>();
		
		try {
			session = map.getSearchEngineSessionFactory().openSession();
			list = session.selectList(namespace + "searchmusic",searchcontent);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}


	public List<SearchEngineDto> searchalbum(String searchcontent) {
		
		SqlSession session = null;
		List<SearchEngineDto> list = new ArrayList<SearchEngineDto>();
		
		try {
			session = map.getSearchEngineSessionFactory().openSession();
			list = session.selectList(namespace + "searchalbum",searchcontent);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
}
