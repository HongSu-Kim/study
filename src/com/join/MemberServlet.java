package com.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.util.DBConn;

public class MemberServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		Connection conn = DBConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		String url;
		
		if (uri.indexOf("created.do") != -1) {
			
			url = "/member/created.jsp";
			forward(req, resp, url);
			
		} else if (uri.indexOf("created_ok.do") != -1) {
			
			MemberDTO dto = new MemberDTO();

			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			
			dao.insertData(dto);
			
			url = cp;
			resp.sendRedirect(url);
			
		} else if (uri.indexOf("login.do") != -1) {

			url = "/member/login.jsp";
			forward(req, resp, url);
			
		} else if (uri.indexOf("login_ok.do") != -1) {
			
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			MemberDTO dto = dao.getReadData(userId);

			// 로그인 실패
			if (dto == null || !dto.getUserPwd().equals(userPwd)) {

				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요");
				url = "/member/login.jsp";
				forward(req, resp, url);
				return;
				
			}

			// 로그인성공
			// 세션에 올릴 데이터 객체
			CustomInfo info = new CustomInfo();

			info.setUserId(dto.getUserId());
			info.setUserName(dto.getUserName());
			
			// 세션 생성
			HttpSession session = req.getSession();
			
			session.setAttribute("customInfo", info);

			url = cp;
			resp.sendRedirect(url);
			
		} else if (uri.indexOf("logout_ok.do") != -1) {

			HttpSession session = req.getSession();
			
			session.removeAttribute("customInfo");
			session.invalidate();
			
			url = cp;
			resp.sendRedirect(url);
		
		} else if (uri.indexOf("searchpw.do") != -1) {

			url = "/member/searchpw.jsp";
			forward(req, resp, url);
			
		} else if (uri.indexOf("searchpw_ok.do") != -1) {
			
			String userId = req.getParameter("userId");
			String userTel = req.getParameter("userTel");
			
			MemberDTO dto = dao.getReadData(userId);

			// 로그인 실패
			if (dto == null || !dto.getUserPwd().equals(userTel)) {
				req.setAttribute("message", "회원정보가 존재하지 않습니다.");
			} else {
				req.setAttribute("message", "비밀본호는 [" + dto.getUserPwd() + "] 입니다.");
			}
			
			url = "/member/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("updated.do") != -1) {
			
			CustomInfo info = (CustomInfo)req.getSession().getAttribute("customInfo");
			String userId = info.getUserId();
			
			MemberDTO dto = dao.getReadData(userId);
			
			if (dto == null) {
				url = cp;
				resp.sendRedirect(url);
				return;
			}
			
			req.setAttribute("dto", dto);
			
			url = "/member/updated.jsp";
			forward(req, resp, url);
			
		} else if (uri.indexOf("updated_ok.do") != -1) {

			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			String userBirth = req.getParameter("userBirth");
			String userTel = req.getParameter("userTel");
			
			MemberDTO dto =  dao.getReadData(userId);
			dto.setUserPwd(userPwd);
			dto.setUserBirth(userBirth);
			dto.setUserTel(userTel);
			
			dao.updateData(dto);

			url = cp;
			resp.sendRedirect(url);
			
		} 
		
		DBConn.close();
		
	}
	
}
