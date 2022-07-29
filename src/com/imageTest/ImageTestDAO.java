package com.imageTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ImageTestDAO {

	private Connection conn;

	public ImageTestDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT NVL(MAX(NUM), 0) FROM IMAGETEST";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}

	public int getDataCount() {

		int data = 0;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT NVL(COUNT(*), 0) FROM IMAGETEST";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				data = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return data;

	}

	public int insertData(ImageTestDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "INSERT INTO IMAGETEST ";
			sql += "VALUES(?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getSaveFileName());
			pstmt.setString(4, dto.getOriginalFileName());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int deleteData(int num) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "DELETE IMAGETEST WHERE NUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public List<ImageTestDTO> getLists(int start, int end) {

		List<ImageTestDTO> lists = new ArrayList<ImageTestDTO>();
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT * FROM  (";
			sql += "SELECT ROWNUM RNUM, DATA.* FROM (";
			sql += "SELECT NUM, SUBJECT, SAVEFILENAME, ORIGINALFILENAME ";
			sql += "FROM IMAGETEST ORDER BY NUM DESC) DATA) ";
			sql += "WHERE RNUM BETWEEN ? AND ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ImageTestDTO dto = new ImageTestDTO();

				dto.setNum(rs.getInt("NUM"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setSaveFileName(rs.getString("SAVEFILENAME"));
				dto.setOriginalFileName(rs.getString("ORIGINALFILENAME"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	public ImageTestDTO getReadData(int num) {

		ImageTestDTO dto = null;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT * FROM IMAGETEST WHERE NUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new ImageTestDTO();

				dto.setNum(rs.getInt(1));
				dto.setSubject(rs.getString(2));
				dto.setSaveFileName(rs.getString(3));
				dto.setOriginalFileName(rs.getString(4));

			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

}
