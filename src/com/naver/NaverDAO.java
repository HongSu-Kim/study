package com.naver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NaverDAO {

	private Connection conn;

	public NaverDAO(Connection conn) {
		this.conn = conn;
	}

	public int insertData(NaverDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "INSERT INTO NAVER ";
			sql += "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setInt(4, dto.getYear());
			pstmt.setInt(5, dto.getMonth());
			pstmt.setInt(6, dto.getDay());
			pstmt.setString(7, dto.getGender());
			pstmt.setString(8, dto.getEmail());
			pstmt.setString(9, dto.getTel());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public List<NaverDTO> getLists() {

		List<NaverDTO> lists = new ArrayList<>();
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT * FROM NAVER";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				NaverDTO dto = new NaverDTO();

				dto.setId(rs.getString(1));
				dto.setPwd(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setYear(rs.getInt(4));
				dto.setMonth(rs.getInt(5));
				dto.setDay(rs.getInt(6));
				dto.setGender(rs.getString(7));
				dto.setEmail(rs.getString(8));
				dto.setTel(rs.getString(9));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	public NaverDTO getReadData(String id) {

		NaverDTO dto = null;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT * FROM NAVER WHERE ID = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new NaverDTO();

				dto.setId(rs.getString(1));
				dto.setPwd(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setYear(rs.getInt(4));
				dto.setMonth(rs.getInt(5));
				dto.setDay(rs.getInt(6));
				dto.setGender(rs.getString(7));
				dto.setEmail(rs.getString(8));
				dto.setTel(rs.getString(9));

			}
			
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	public int updateData(NaverDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "UPDATE NAVER SET PWD = ?, NAME = ?, YEAR = ?, MONTH = ?, DAY = ?, GRNDER = ?, EMAIL = ?, TEL = ? ";
			sql += "WHERE ID = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getYear());
			pstmt.setInt(4, dto.getMonth());
			pstmt.setInt(5, dto.getDay());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getEmail());
			pstmt.setString(8, dto.getTel());
			pstmt.setString(9, dto.getId());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int deleteData(String id) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "DELETE NAVER WHERE ID = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

}
