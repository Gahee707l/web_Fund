package kr.co.acorn.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class connLocator {
//이제 여기서 커넥션 불러오겠다...
	
	public static Connection getConnection() throws SQLException{
		DataSource ds = null;
		Connection con = null;
		
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/acorn");
			//커넥션 풀 가져오기
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} 
		
		return con;
	}
}
