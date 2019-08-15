package semi.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import semi.dto.AlbumDto;
import semi.dto.MusicDto;
import semi.dto.loginDto;

public class PortfolioDao {

	sqlMapConfig map = new sqlMapConfig();
	private String namespace = "Portfolio_mapper.";
	
	public loginDto searchbasicuserinfo(int userseq) {
		
		SqlSession session = null;
		loginDto dto = new loginDto();
		
		try {
			session = map.getPortfolioSessionFactory().openSession();
			dto = session.selectOne(namespace + "basicuserinfo",userseq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public List<MusicDto> searchusersongs(int userseq){
		SqlSession session = null;
		List<MusicDto> list = new ArrayList<MusicDto>();
		
		try {
			session = map.getPortfolioSessionFactory().openSession();
			list = session.selectList(namespace + "usersongsinfo",userseq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public List<AlbumDto> searchuseralbums(int userseq){
		SqlSession session = null;
		List<AlbumDto> list = new ArrayList<AlbumDto>();
		
		try {
			session = map.getPortfolioSessionFactory().openSession();
			list = session.selectList(namespace + "useralbumsinfo",userseq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

}
