package com.fileTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FileTestDAO {

	private Connection conn = null;

	public FileTestDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT NVL(MAX(NUM), 0) FROM FILETEST";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}

	public void insertData(FileTestDTO dto) {

		PreparedStatement pstmt;
		String sql;

		try {

			sql = "INSERT INTO FILETEST VALUES(?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getSaveFileName());
			pstmt.setString(4, dto.getOriginalFileName());

			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	public List<FileTestDTO> getLists() {

		List<FileTestDTO> lists = new ArrayList<FileTestDTO>();
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT * FROM FILETEST ORDER BY NUM DESC";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				FileTestDTO dto = new FileTestDTO();

				dto.setNum(rs.getInt(1));
				dto.setSubject(rs.getString(2));
				dto.setSaveFileName(rs.getString(3));
				dto.setOriginalFileName(rs.getString(4));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	public FileTestDTO getReadData(int num) {

		FileTestDTO dto = null;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT * FROM FILETEST WHERE NUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new FileTestDTO();

				dto.setNum(rs.getInt(1));
				dto.setSubject(rs.getString(2));
				dto.setSaveFileName(rs.getString(3));
				dto.setOriginalFileName(rs.getString(4));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	public void deleteData(int num) {

		PreparedStatement pstmt;
		String sql;

		try {

			sql = "DELETE FILETEST WHERE NUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeQuery();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
