package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

	private Connection conn;

	public BoardDAO(Connection conn) {
		this.conn = conn;
	}

	// num의 최댓값
	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT NVL(MAX(NUM), 0) FROM BOARD";

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

	public int insertData(BoardDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "INSERT INTO BOARD (NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)";
			sql += "VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	// 전체데이터 가져오기
	public List<BoardDTO> getLists(int start, int end, String searchKey, String searchValue) {

		List<BoardDTO> lists = new ArrayList<>();
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";
			
			sql = "SELECT * FROM (";
			sql += "SELECT ROWNUM AS RNUM, DATA.* FROM (";
			sql += "SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED ";
//			sql += "FROM BOARD ORDER BY NUM DESC) DATA)";
			sql += "FROM BOARD 	WHERE " + searchKey + " LIKE ? ORDER BY NUM DESC) DATA)";
			sql += "WHERE RNUM >= ? AND RNUM <= ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	// 전체데이터의 갯수
	public int getDataCount(String searchKey, String searchValue) {

		int dataCount = 0;

		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {
			
			searchValue = "%" + searchValue + "%";

			sql = "SELECT NVL(COUNT(*), 0) FROM BOARD ";
			sql += "WHERE " + searchKey + " LIKE ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dataCount = rs.getInt(1);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dataCount;

	}

	// num으로 안갸의 데이터 가져오기
	public BoardDTO getReardData(int num) {

		BoardDTO dto = new BoardDTO();
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED ";
			sql += "FROM BOARD WHERE NUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto.setNum(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPwd(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setSubject(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setIpAddr(rs.getString(7));
				dto.setHitCount(rs.getInt(8));
				dto.setCreated(rs.getString(9));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	// 조회수 증가
	public int updateHitCount(int num) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "UPDATE BOARD SET HITCOUNT = (HITCOUNT + 1) WHERE NUM = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int updateData(BoardDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "UPDATE BOARD SET NAME = ?, PWD = ?, EMAIL = ?, SUBJECT = ?, CONTENT = ? ";
			sql += "WHERE NUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getNum());

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

			sql = "DELETE BOARD WHERE NUM = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

}
