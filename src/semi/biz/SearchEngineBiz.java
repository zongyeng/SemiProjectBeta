package semi.biz;

import java.util.List;

import semi.dao.SearchEngineDao;
import semi.dto.SearchEngineDto;

public class SearchEngineBiz {
	SearchEngineDao dao = new SearchEngineDao();
	
	public List<SearchEngineDto> searchartist(String searchcontent) {
		return dao.searchartist(searchcontent);
	}
	
	public List<SearchEngineDto> searchmusic(String searchcontent) {
		return dao.searchmusic(searchcontent);
	}


	public List<SearchEngineDto> searchalbum(String searchcontent) {
		return dao.searchalbum(searchcontent);
	}
	
}
