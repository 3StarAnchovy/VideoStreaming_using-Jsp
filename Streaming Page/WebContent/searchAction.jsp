<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.bbs" %>
<%@ page import="bbs.BbsDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

	String search = request.getParameter("search"); //검색값 받아와서
	bbs bbs=new bbs();
	BbsDAO bbsDAO = new BbsDAO();
	ArrayList<bbs> searchAction = bbsDAO.getSearch(search); //꼴아박음
	
	String[] thumbnailPaths = new String [searchAction.size()];
	
	
	for (int i = 0; i < searchAction.size(); i++) {
		thumbnailPaths[i] = searchAction.get(i).getThumbnailRealName();
		String src="upload/"+thumbnailPaths[i];
		System.out.println(src); //경로 체크 
%>
<tr>
							
   			<img src=<%=src %> height="300" width="200"><br>
			<td><a href="view.jsp?bbsID=<%=searchAction.get(i).getBbsID()%>"><%=searchAction.get(i).getBbsTitle()%></a></td><br>
			<td><%=searchAction.get(i).getUserID()%></td><br>
			<td><%=searchAction.get(i).getBbsDate().substring(0, 11) + searchAction.get(i).getBbsDate().substring(11, 13) + "시"
				+ searchAction.get(i).getBbsDate().substring(14, 16) + "분"%></td>

</tr>

<%
		}

%>
</body>
</html>