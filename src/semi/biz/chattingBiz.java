package semi.biz;

import semi.dao.chattingDao;
import semi.dto.chattingDto;

public class chattingBiz {

	chattingDao dao = new chattingDao();
	
	public chattingDto selectOne(int seq) {
		return dao.selectOne(seq);
	}
}
