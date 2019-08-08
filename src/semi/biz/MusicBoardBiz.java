package semi.biz;

import java.util.List;

import semi.dao.MusicBoardDao;
import semi.dto.MusicBoardDto;

public class MusicBoardBiz {
		
	MusicBoardDao dao = new MusicBoardDao();
	
	public List<MusicBoardDto> selectList_musicbd(){
		return dao.selectList_musicbd();
	}
	
	public MusicBoardDto selectOne_musicbd(int seq) {
		return dao.selectOne_musicbd(seq);
	}

	public int insert_musicbd(MusicBoardDto dto){
		return dao.insert_musicbd(dto);
	}
	
	public int delete_musicbd(int seq){
		return dao.delete_musicbd(seq);
	}
	
	public int update_musicbd(MusicBoardDto dto){
		return dao.update_musicbd(dto);
	}
	
	public int answerProc(MusicBoardDto dto) {
		
		int resupdate = dao.answerUpdate(dto.getMusicbd_boardno());
		int resinsert = dao.answerInsert(dto);
		return (resupdate + resinsert);
	}
}
