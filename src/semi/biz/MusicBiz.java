package semi.biz;

import java.util.List;
import semi.dao.MusicDao;
import semi.dto.MusicDto;
import semi.dto.MusiclistDto;

public class MusicBiz {
		
	MusicDao dao = new MusicDao();
	
	public List<MusicDto> selectList_music(){
		return dao.selectList_music();
	}
	
	public List<MusicDto> selectList_genremusicasc(String genre_name){
		return dao.selectList_genremusicasc(genre_name);
	}
	
	public List<MusicDto> selectList_genremusicdesc(String genre_name){
		return dao.selectList_genremusicdesc(genre_name);
	}
	
	public String artist_name(int music_seq){
		return dao.artist_name(music_seq);
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
