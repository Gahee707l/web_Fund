package kr.co.acorn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acorn.dto.DeptDto;
import kr.co.acorn.util.connLocator;

public class DeptDao {

	private static DeptDao single;

	private DeptDao() {

	}

	public static DeptDao getInstance() {
		if (single == null) {
			single = new DeptDao();
		}

		return single;
	}
	
	public ArrayList<DeptDto> select(int start,int len){
		ArrayList<DeptDto> list = new ArrayList<DeptDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = connLocator.getConnection();
			//보통은 여기부터 에러 잡아서...get connection에서 오류를 던지면 여기서 받는 걸로 한다.
			//이게 더 안전...하다.
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT deptno,dname,loc ");
			sql.append("FROM dept ");
			sql.append("order by deptno ");
			sql.append("LIMIT ?,?");
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setInt(++index,start);
			pstmt.setInt(++index,len);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 0;
				int no = rs.getInt(++index);
				String name = rs.getString(++index);
				String loc = rs.getString(++index);
				list.add(new DeptDto(no,name,loc));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(con != null) con.close();
					//이것은 반납
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		
		return list;
	}
	
	public boolean insert(DeptDto dto){
		return false;
	}
}
