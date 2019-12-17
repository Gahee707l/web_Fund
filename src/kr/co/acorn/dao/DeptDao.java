package kr.co.acorn.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acorn.dto.DeptDto;
import kr.co.acorn.util.connLocator;

public class DeptDao {
	//이제는...connc쪽은 하나도 필요 없다.

	//singleton은 유지
	public static DeptDao single;
	private DeptDao() {
	}
	public static DeptDao getInstance() {
		if (single == null) {
			single = new DeptDao();
		}
		return single;
	}

	public boolean insert(DeptDto dto) {
		// data transfer object
		boolean isSucess = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = connLocator.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO dept(deptno,dname,loc) VALUES(?,?,?)");
			pstmt = con.prepareStatement(sql.toString());

			int index = 0;
			pstmt.setInt(++index, dto.getNo());
			pstmt.setString(++index, dto.getName());
			pstmt.setString(++index, dto.getLoc());

			pstmt.executeUpdate();
			isSucess = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return isSucess;
	}

	public boolean update(DeptDto dto) {
		boolean isSucess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = connLocator.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE dept ");
			sql.append("SET dname = ?, loc = ? ");
			sql.append("WHERE deptno = ?");
			pstmt = con.prepareStatement(sql.toString());

			int index = 0;
			pstmt.setString(++index, dto.getName());
			pstmt.setString(++index, dto.getLoc());
			pstmt.setInt(++index, dto.getNo());

			pstmt.executeUpdate();
			isSucess = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return isSucess;
	}

	public boolean delete(int deptNo) {
		boolean isSucess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = connLocator.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("DELETE ");
			sql.append(" FROM dept ");
			sql.append("WHERE deptno = ?");
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, deptNo);

			pstmt.executeUpdate();
			isSucess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSucess;
	}

	public ArrayList<DeptDto> select() {
		ArrayList<DeptDto> list = new ArrayList<DeptDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = connLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT deptno,dname,loc ");
			sql.append("FROM dept ");
			sql.append("order BY deptno");

			pstmt = con.prepareStatement(sql.toString());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int index = 0;
				int deptno = rs.getInt(++index);
				String dname = rs.getString(++index);
				String loc = rs.getString(++index);

				list.add(new DeptDto(deptno,dname,loc));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public DeptDto select(int deptNo) {
		DeptDto dto = null;
		//이걸로 리턴되면 결과값이 없는것이다.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = connLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT deptno,dname,loc ");
			sql.append("FROM dept ");
			sql.append("where deptno= ?");

			pstmt = con.prepareStatement(sql.toString());
			
			int index = 0;
			pstmt.setInt(++index, deptNo);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				index = 0;
				int deptno = rs.getInt(++index);
				String dname = rs.getString(++index);
				String loc = rs.getString(++index);

				dto = new DeptDto(deptno,dname,loc);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
}
