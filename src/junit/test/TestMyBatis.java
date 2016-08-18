package junit.test;

import java.io.InputStream;
import java.util.List;

import net.pkusoft.model.JbxxCzrk;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

public class TestMyBatis {
	SqlSessionFactory sqlSessionFactory = null;

	@Test
	@Before
	public void testInitMyBatis() throws Exception {
		// 装载总配置文件
		String resource = "sqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream( resource );
		sqlSessionFactory = new SqlSessionFactoryBuilder().build( inputStream );
	}

	@Test
	public void test_getTotalNum() throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		// namespace + SQL-id 唯一标识一条SQL
		// namespace : net.pkusoft.bean.JbxxCzrk.
		// SQL-id : getTotalNum
		int total = session.selectOne( "net.pkusoft.bean.JbxxCzrk.getTotalNum" );
		System.out.println( total );
		session.close();
	}
	@Test
	public void test_getJbxxCzrkById() throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		JbxxCzrk jbxxCzrk = session.selectOne( "net.pkusoft.bean.JbxxCzrk.getJbxxCzrkById", 14 );
		System.out.println( jbxxCzrk.getXm() );
		session.close();
	}
	@Test
	public void test_getJbxxCzrkList() throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		List<JbxxCzrk> jbxxCzrkList = session.selectList( "net.pkusoft.bean.JbxxCzrk.getJbxxCzrkList" );
		for ( int i = 0; i < jbxxCzrkList.size(); i++ ) {
			System.out.println( jbxxCzrkList.get(i).getXm() );
		}
		session.close();
	}

	/*
	 * <select id="selectUserById" parameterType="string"
	 * resultType="com.hehe.mybatis.domain.User"> select * from user where id =
	 * #{id} </select>
	 * 
	 * @Test public void testSelectUserById() throws Exception { SqlSession
	 * session = sqlSessionFactory.openSession(); // namespace + SQL-id
	 * 唯一标识一条SQL // namespace : com.hehe.mybatis.domain.User // SQL-id :
	 * selectUserById User user =
	 * session.selectOne("com.hehe.mybatis.domain.User.selectUserById", "0001");
	 * System.out.println(user); session.close(); }
	 */
}