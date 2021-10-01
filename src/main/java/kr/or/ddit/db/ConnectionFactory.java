package kr.or.ddit.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.management.RuntimeErrorException;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

import oracle.jdbc.pool.OracleConnectionPoolDataSource;

/**
 * Factory Object[Method] Pattern
 * : consumer 에 의해 소비되는 객체 생성만을 전담하는 객체 운영.
 * 
 */
public class ConnectionFactory {
	//static 코드블럭. 클래스가 메모리에 적재되면, 그 후에 바로 실행된다. 그리고 한번만 실행된다.
	private static String url;
	private static String user;
	private static String password;
	private static DataSource dataSource;
	static {
		ResourceBundle bundle = ResourceBundle.getBundle("kr.or.ddit.db.dbinfo", Locale.ENGLISH);
		url = bundle.getString("url");
		user = bundle.getString("user");
		password = bundle.getString("password");
		int initialSize = Integer.parseInt(bundle.getString("initialSize"));
		Long maxWait = Long.parseLong(bundle.getString("maxWait"));
		int maxTotal = Integer.parseInt(bundle.getString("maxTotal"));
		//소요시간을 줄이고 어플리케이션의 성능을 높이기 위해
		//서버에 부하가 일정하게 걸린다
		BasicDataSource ds = new BasicDataSource();
		dataSource = ds;
		ds.setDriverClassName(bundle.getString("driverClassName"));
		ds.setUrl(url);
		ds.setUsername(user);
		ds.setPassword(password);
		ds.setInitialSize(initialSize);//커넥션을 만들어놓을 수
		ds.setMaxWaitMillis(maxWait);//2초 기다려라
		ds.setMaxTotal(maxTotal);//2초 기다린 후 5개까지 늘린다. 그래도 안되면 예외처리
		
		//Oracle DB에 종속된다.
//		OracleConnectionPoolDataSource ds;
//		try {
//			ds = new OracleConnectionPoolDataSource();
//			dataSource = ds;
//			ds.setURL(url);
//			ds.setUser(user);
//			ds.setPassword(password);
//		} catch (SQLException e) {
//			//발생한 에러를 톰캣에게 던진다
//			throw new RuntimeException(e);
//		}
//		try {//드라이버 로딩
//			Class.forName(bundle.getString("driverClassName"));
//			System.out.println(message);
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException(e);
//			//톰캣에게 에러를 넘겨주기 위해 에러의 종류를 바꾼다.
//		}
	}
	public static Connection getConnection() throws SQLException{
//		return DriverManager.getConnection(url, user, password);
		return dataSource.getConnection();
	}
}
