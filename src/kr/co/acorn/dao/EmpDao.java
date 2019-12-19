package kr.co.acorn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acorn.dto.EmpDto;
import kr.co.acorn.util.connLocator;

public class EmpDao {

private static EmpDao single;

private EmpDao() {
}

public static EmpDao getInstance() {
	if (single == null) {
		single = new EmpDao();
	}
	return single;
}
	
	
	
	public int getTotalRows() {
		int rows = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = connLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(deptno) ");
			sql.append("FROM DEPT");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			int index = 0;
			if (rs.next()) {
				rows = rs.getInt(++index);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {// 요부분은 따로 close() 로 뺴 볼것
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return rows;
	}
	
}
