package semi.biz;

import java.util.List;

import semi.dao.PortfolioDao;
import semi.dto.AlbumDto;
import semi.dto.MusicDto;
import semi.dto.loginDto;

public class PortfolioBiz {
	
	PortfolioDao dao = new PortfolioDao();
	
	public loginDto searchbasicuserinfo(int userseq) {
		return dao.searchbasicuserinfo(userseq);
	}
	
	public List<MusicDto> searchusersongs(int userseq){
		return dao.searchusersongs(userseq);
	}
	
	public List<AlbumDto> searchuseralbums(int userseq){
		return dao.searchuseralbums(userseq);
	}
	
}
