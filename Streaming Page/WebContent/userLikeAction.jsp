<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO"%>

<%@ page import="bbs.BbsDAO"%>

<%@ page import="likey.LikeyDAO"%>

<%@ page import="java.io.PrintWriter"%>



<%!
	public static String getClientIP(HttpServletRequest request)
	{
    	String ip = request.getHeader("X-FORWARDED-FOR"); 
    	if (ip == null || ip.length() == 0) {
        	ip = request.getHeader("Proxy-Client-IP");
        	}

    	if (ip == null || ip.length() == 0) {
        	ip = request.getHeader("WL-Proxy-Client-IP");
        	}

    	if (ip == null || ip.length() == 0) {
        	ip = request.getRemoteAddr() ;
        	}
    	
    	return ip;
    }

%>



<%
        //세션 체크
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	request.setCharacterEncoding("UTF-8");

        // 이전의 파라매터로 보낸 게시판 글제목 가져오기
	String bbsTitle = null;
	if(request.getParameter("Bbs.getBbsTitle()") != null) {
		bbsTitle = (String) request.getParameter("Bbs.getBbsTitle()");
	}

	BbsDAO BbsDAO = new BbsDAO();
	LikeyDAO likeyDAO = new LikeyDAO();

	//테이블 likey에 있는 아이디랑 제목 컬럼은 중복이 불가함

	int result = likeyDAO.like(userID, bbsTitle, getClientIP(request));

	// 정상 작동시 1 리턴

	if (result == 1) {

		result = BbsDAO.like(bbsTitle);

		if (result == 1) { // 1인경우 디비에서 해당 게시물 추천 완료

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('추천이 완료되었습니다.');");

			script.println("location.href='main.jsp'");

			script.println("</script>");

			script.close();		
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			
			return;

		}

	} else { // 중복되어있으면 1 반환 x
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 추천을 누른 글입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;

	}
%>