package semi.biz;

import java.util.List;

import semi.dao.AlbumDao;
import semi.dto.AlbumDto;

public class AlbumBiz {
	
	AlbumDao dao = new AlbumDao();

	public List<AlbumDto> album_selectList(){
		return dao.album_selectList();
	}
	
	public AlbumDto album_selectOne(int seq) {
		return dao.album_selectOne(seq);
	}

	public int album_insert(AlbumDto dto){
		return dao.album_insert(dto);
	}
	
	public int album_delete(int seq){
		return dao.album_delete(seq);
	}
	
	public int album_update(AlbumDto dto){
		return dao.album_update(dto);
	}
}
