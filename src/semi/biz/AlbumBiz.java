package semi.biz;

import java.util.List;

import semi.dao.AlbumDao;
import semi.dto.AlbumDto;

public class AlbumBiz {
	
	AlbumDao dao = new AlbumDao();

	public List<AlbumDto> selectList_album(){
		return dao.selectList_album();
	}
	
	public AlbumDto selectOne_album(int seq) {
		return dao.selectOne_album(seq);
	}

	public int insert_album(AlbumDto dto){
		return dao.insert_album(dto);
	}
	
	public int delete_album(int seq){
		return dao.delete_album(seq);
	}
	
	public int update_album(AlbumDto dto){
		return dao.update_album(dto);
	}
}
