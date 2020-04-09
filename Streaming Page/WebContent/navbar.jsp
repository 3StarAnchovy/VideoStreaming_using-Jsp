<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

<%
	String userID=null;
	if(session.getAttribute("userID")!=null)
	{
   		userID=(String)session.getAttribute("userID");
	}
	System.out.println("gasdf");

%>

<nav class = "navbar navbar-dark bg-dark">
   <a class="navbar-brand" href="#">FANTA</a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="true" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>

   <div class="collapse navbar-collapse" id="navbarsExample01" >
      <ul class="navbar-nav mr-auto">
         <c:choose>
            <c:when test="${empty userID }"> <!-- 세션 없을 때 -->
               <li class="nav-item active">
                    <a class="nav-link" href=./main.jsp#">Home <span class="sr-only">(current)</span></a>
                 </li>
                  <li class="nav-item">
                    <a class="nav-link" href="./login.jsp">Login</a>
                  </li>
                 <li class="nav-item">
                    <a class="nav-link" href="./join.jsp">Sign Up</a>
                 </li>
            </c:when>
                  
            <c:otherwise> <!-- 세션 있을 때 -->
               <li style="padding-top: 7px; color:white">[<%=userID%>님]</li>
               <li class="nav-item active">
                    <a class="nav-link" href=./main.jsp#">Home <span class="sr-only">(current)</span></a>
                 </li>
               <li class="nav-item">
                    <a class="nav-link" href="./logoutAction.jsp">Logout</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="./updateInfo.jsp">Update Info</a>
                  </li>
            </c:otherwise>
         </c:choose>
         
         <form name = search action = searchAction.jsp seclass="form-inline my-2 my-md-0"> <!-- 검색 -->
               <input class="form-control" type="text" name = search placeholder="Search" aria-label="Search">
         </form>
      </ul>   
   </div>   
</nav>
<!-- BootStrap --> 
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>