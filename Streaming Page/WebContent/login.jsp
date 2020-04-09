<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
  <jsp:include page="/navbar.jsp" />
  
  <p><br><br></p>

  <div class="text-center mb-4">
    <h1 class="h3 mb-3 font-weight-normal">Login</h1>    
  </div>
  
<div class="container" align="center"> 
   <div class="col-md-6 col-md-offset-6">
   
      <form class="form-signin" method = "post" action = "loginAction.jsp">  
        <div class="form-label-group">
          <input type="email" name ="userID" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
          <label for="inputEmail">Email address</label>
        </div>
      
        <div class="form-label-group">
          <input type="password" name= "userPassword" id="inputPassword" class="form-control" placeholder="Password" required autofocus>
          <label for="inputPassword">Password</label>
        </div>
      
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>     
      </form>
      
      
   </div>
</div>


</body>

</html>