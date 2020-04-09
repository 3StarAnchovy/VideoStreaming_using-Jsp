<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="bbs.bbs"%>
<%@ page import="bbs.BbsDAO"%> <!-- src 받아오기 위한 다오 import -->
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


</head>
<body>
<p><br></p>
<%
int pageNumber = 1; //기본 페이지 넘버
//페이지넘버값이 있을때
//if (request.getParameter("pageNumber") != null) {
	//pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
//}
bbs bbs=new bbs();
BbsDAO bbsDAO = new BbsDAO();

ArrayList<bbs> list = bbsDAO.getList(pageNumber);
String[] thumbnailPaths = new String [list.size()];

for (int i = 0; i < list.size(); i++) {
	thumbnailPaths[i] = list.get(i).getThumbnailRealName();
	String src="upload/"+thumbnailPaths[i];
	System.out.println(src); //경로 체크 
%>

<div id = "thing">
	<table border = "1">
		<tr><td><img src=<%=src %> height="300" width="200"></td></tr>
		<tr><td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td></tr>
		<tr><td><%=list.get(i).getUserID()%></td></tr>
		<tr><td>
			<%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
			+ list.get(i).getBbsDate().substring(14, 16) + "분"%> * <%=list.get(i).getHit() %> 회 
			</td>
		</tr>
	</table>
</div>


<%
	}

%>
</body>
</html>