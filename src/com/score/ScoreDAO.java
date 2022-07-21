package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ScoreDAO {

	private Connection conn;

	public ScoreDAO(Connection conn) { // 의존성 주입
		this.conn = conn;
	}

	// 입력(write.jsp -> write_ok.jsp)
	public int insertData(ScoreDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
//			sql = "INSERT INTO SCORE VALUES(?, ?, ?, ?, ?)";
			sql = "INSERT INTO SCORE (HAK, NAME, KOR, ENG, MAT) ";
			sql += "VALUES(?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	// 전체데이터(list.jsp)
	public List<ScoreDTO> getLists() {

		List<ScoreDTO> lists = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT HAK, NAME, KOR, ENG, MAT,";
			sql += "(KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3 AS AVE,";
			sql += "RANK() OVER(ORDER BY (KOR + ENG + MAT) DESC) AS RANK ";
			sql += "FROM SCORE";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ScoreDTO dto = new ScoreDTO();

				dto.setHak(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setKor(rs.getInt(3));
				dto.setEng(rs.getInt(4));
				dto.setMat(rs.getInt(5));
				dto.setTot(rs.getInt(6));
				dto.setAve(rs.getInt(7));
				dto.setRank(rs.getInt(8));

				lists.add(dto);

			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	// 수정할 데이터 가져오기(update.jsp)
	public ScoreDTO getReadData(String hak) {

		ScoreDTO dto = null;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT * FROM SCORE WHERE HAK = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, hak);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new ScoreDTO();

				dto.setHak(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setKor(rs.getInt(3));
				dto.setEng(rs.getInt(4));
				dto.setMat(rs.getInt(5));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	// 수정(update.jsp -> update_ok.jsp)
	public int updateData(ScoreDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "UPDATE SCORE SET KOR = ?, ENG = ?, MAT = ? ";
			sql += "WHERE HAK = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getKor());
			pstmt.setInt(2, dto.getEng());
			pstmt.setInt(3, dto.getMat());
			pstmt.setString(4, dto.getHak());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	// 삭제(deldete_ok.jsp)
	public int deleteData(String hak) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "DELETE SCORE WHERE HAK = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

}
