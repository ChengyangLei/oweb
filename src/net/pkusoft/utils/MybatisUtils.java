package net.pkusoft.utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class MybatisUtils {
	private static Logger logger = Logger.getLogger( MybatisUtils.class );
	private static SqlSessionFactory sqlSessionFactory;
	private static String resource = "sqlMapConfig.xml";
	
	static {
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream( resource );
		} catch ( IOException e ) {
			e.printStackTrace();
			logger.error( e.getMessage() );
			throw new RuntimeException( e );
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build( inputStream );
	}
	
	public static SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}
	
}
