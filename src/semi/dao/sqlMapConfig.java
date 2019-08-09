package semi.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class sqlMapConfig {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getChattingSessionFactory() {

		String resource = "semi/webchatting-config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}
	
	
	public SqlSessionFactory getLoginSessionFactory() {

		String resource = "semi/login-config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}
	
	public SqlSessionFactory getstacked_barSessionFactory() {

		String resource = "semi/stacked_bar-config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}
}
