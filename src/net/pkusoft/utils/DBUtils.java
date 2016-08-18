package net.pkusoft.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

public class DBUtils {

	private static Logger logger = Logger.getLogger( DBUtils.class );

	private static String url = "jdbc:mysql://mysql.rdsmr4gvgm5y7lk.rds.bj.baidubce.com:3306/pku?useUnicode=true&characterEncoding=utf8";
	private static String username = "pku";
	private static String password = "pku123456";

	// 加载驱动
	static {
		try {
			Class.forName( "com.mysql.jdbc.Driver" );
		} catch ( ClassNotFoundException e ) {
			logger.error( "驱动加载出错!" );
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection( url, username, password );// 获取连接
	}

	// 释放连接
	public static void free( ResultSet rs, Statement st, Connection conn ) {
		try {
			if ( rs != null ) {
				rs.close(); // 关闭结果集
			}
		} catch ( SQLException e ) {
			e.printStackTrace();
		} finally {
			try {
				if ( st != null ) {
					st.close(); // 关闭Statement
				}
			} catch ( SQLException e ) {
				e.printStackTrace();
			} finally {
				try {
					if ( conn != null ) {
						conn.close(); // 关闭连接
					}
				} catch ( SQLException e ) {
					e.printStackTrace();
				}

			}

		}

	}


	public static void main( String[] args ) throws Exception {
		System.out.println( DBUtils.getConnection() );
	}
}