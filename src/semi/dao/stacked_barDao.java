package semi.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import semi.dto.stacked_barDto;

public class stacked_barDao {
	
	private String namespace = "stacked_barmapper.";
	sqlMapConfig getSqlSessionFactory = new sqlMapConfig();
	
	public List<Date> selectReferrals(int songseq) {
		List<Date> list = new ArrayList<Date>();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory.getstacked_barSessionFactory().openSession();
			list = session.selectList(namespace+"selectReferrals",songseq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public List<Date> selectViews(int songseq) {
		List<Date> list = new ArrayList<Date>();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory.getstacked_barSessionFactory().openSession();
			list = session.selectList(namespace+"selectViews",songseq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public int userseq(String username) {
		
		SqlSession session = null;
		int usereq = 0;
		
		try {
			session = getSqlSessionFactory.getstacked_barSessionFactory().openSession();
			usereq = session.selectOne(namespace+"musicianseq", username);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return usereq;
	}
	
	public List<stacked_barDto> songs(int userseq) {
		
		SqlSession session = null;
		List<stacked_barDto> list = new ArrayList<stacked_barDto>();
		
		try {
			session = getSqlSessionFactory.getstacked_barSessionFactory().openSession();
			list = session.selectList(namespace+"songs", userseq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public String username(int userseq) {
		SqlSession session = null;
		String username = null;
		
		try {
			session = getSqlSessionFactory.getstacked_barSessionFactory().openSession();
			username = session.selectOne(namespace+"musicianname", userseq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return username;
	}

	public String songname(int songseq) {
		SqlSession session = null;
		String songname = null;
		
		try {
			session = getSqlSessionFactory.getstacked_barSessionFactory().openSession();
			songname = session.selectOne(namespace+"songname", songseq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return songname;
	}
	
}
