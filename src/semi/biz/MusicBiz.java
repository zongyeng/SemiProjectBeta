package semi.biz;

import java.util.List;
import semi.dao.MusicDao;
import semi.dto.MusicDto;

public class MusicBiz {
		
	MusicDao dao = new MusicDao();
	
	public List<MusicDto> selectList_music(){
		return dao.selectList_music();
	}
	
	public MusicDto selectOne_music(int seq) {
		return dao.selectOne_music(seq);
	}

	public int insert_music(MusicDto dto){
		return dao.insert_music(dto);
	}
	
	public int delete_music(int seq){
		return dao.delete_music(seq);
	}
	
	public int update_music(MusicDto dto){
		return dao.update_music(dto);
	}
}
