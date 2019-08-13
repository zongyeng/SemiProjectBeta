package semi.biz;

import java.sql.Date;
import java.util.List;

import semi.dao.stacked_barDao;
import semi.dto.stacked_barDto;

public class stacked_barBiz {
	
	stacked_barDao dao = new stacked_barDao();

	public List<Date> selectReferrals(int songseq) {
		return dao.selectReferrals(songseq);
	}
	
	public List<Date> selectViews(int songseq) {
		return dao.selectViews(songseq);
	}
	
	public int userseq(String username) {
		
		return dao.userseq(username);
	}
	
	public List<stacked_barDto> songs(int userseq) {
		return dao.songs(userseq);
	}

	public String username(int userseq) {
		return dao.username(userseq);
	}

	public String songname(int songseq) {
		return dao.songname(songseq);
	}
	
}
