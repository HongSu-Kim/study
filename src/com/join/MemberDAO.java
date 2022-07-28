package com.join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	private Connection conn;

	public MemberDAO(Connection conn) {
		this.conn = conn;
	}

	public void insertData(MemberDTO dto) {

		PreparedStatement pstmt;
		String sql;

		try {

			sql = "INSERT INTO MEMBER(USERID, USERPWD, USERNAME, USERBIRTH, USERTEL) ";
			sql += "VALUES(?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserBirth());
			pstmt.setString(5, dto.getUserTel());

			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	public MemberDTO getReadData(String userId) {

		MemberDTO dto = null;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT * FROM MEMBER WHERE USERID = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new MemberDTO();

				dto.setUserId(rs.getString(1));
				dto.setUserPwd(rs.getString(2));
				dto.setUserName(rs.getString(3));
				dto.setUserBirth(rs.getString(4));
				dto.setUserTel(rs.getString(5));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	public void updateData(MemberDTO dto) {

		PreparedStatement pstmt;
		String sql;

		try {

			sql = "UPDATE MEMBER SET USERPWD = ?, USERBIRTH = ?, USERTEL = ? WHERE USERID = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserPwd());
			pstmt.setString(2, dto.getUserBirth());
			pstmt.setString(3, dto.getUserTel());
			pstmt.setString(4, dto.getUserId());

			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
