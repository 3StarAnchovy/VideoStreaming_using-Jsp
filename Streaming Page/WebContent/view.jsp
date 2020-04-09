<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<% 
String userID = null;
if(session.getAttribute("userID")!=null){
	userID = (String) session.getAttribute("userID");
}		

int bbsID=0;
if(request.getParameter("bbsID") != null){
	bbsID = Integer.parseInt(request.getParameter("bbsID"));
}
if(bbsID ==0){ 
	PrintWriter script = response.getWriter();
	script.println("<script>"); 
	script.println("alert('유효하지 않은 글 입니다.')");
	script.println("location.href = 'main.jsp'");
	script.println("</script>");
}

bbs Bbs = new BbsDAO().getBbs(bbsID);
BbsDAO hitmaking = new BbsDAO();
int hit=hitmaking.hitMaker(bbsID);
String a =Bbs.getFileRealName();
//System.out.println(a);
String src = "upload/"+Bbs.getFileRealName();
//System.out.println(src); //null 찍힘 체크해야함


%>
<jsp:include page="/navbar.jsp" />
 
 <p><br><br></p>

<p align="center">
	<div id="video">
 			<video width="500" height="350" src=<%=src%> controls loop></video> <!-- 영상 -->	<hr>
	</div>
	<div id = "Title">
		<font size =15><%= Bbs.getBbsTitle() %></font><br> <!-- 타이틀 -->
		<p style ="text-align : right;">조회수 <%= Bbs.getHit() %>회   *<%=Bbs.getBbsDate() %> > 
		</p>
	</div><hr>
	<div> 
		<td colspan="2"><%= Bbs.getBbsContent() %></td><br> <!-- 내용 -->
		</div>
</p>
<br>
<!-- 따봉, 글제목 파라미터로 같이보냄 -->
<div id ="Like" class="row" >
	<div class="col-lg-6 mt-3">
	<img width="15" height="15" onclick = "javascript:location.href='./userLikeAction.jsp?Bbs.getBbsTitle()=<%=Bbs.getBbsTitle()%>'"
	     src = "upload/img/Like.png">
	</div>
</div><br>
  
   <%
if(userID != null && userID.equals(Bbs.getUserID())){ // 삭제 수정, action 추가할것 
%>
<div id="update">
	<img width="30" height="30" onclick = "javascript:location.href='update.jsp?videoID=<%=bbsID%>'"
  	 src = "upload/img/update.jpg"> <!-- 수정 -->
<img width="30" height="30" onclick = "javascript:location.href='deleteAction.jsp?videoID=<%=bbsID%>'" 
  	 src = "upload/img/delete.png"> <!-- 삭제 -->
</div>
<% 
}
%>	
</body>
</html>