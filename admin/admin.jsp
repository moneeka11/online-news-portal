<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin login </title>
<style>

body {
  margin: 0;
  background-image: url("../image/addd.jpg");
	background-size:cover;
	background-repeat:no-repeat; 
}

.white_text {
color:white;
font-weight:600px;
}
h2 {

color:white;
}
/* Style the header */
.header {
  background-color: lightblue;
  padding: 3px;
  text-align: left;
  
  
  
}
h1 {
  font-size: 36px;
  
  padding: 0px;
  }
#logo {
	margin-top:10px;
	width:300px;
	float:left;
	margin-right:10px;
	padding: 8px;
	height:50px;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 75px;
  text-decoration: none;
}

li a:hover {
  background-color: #ccc;
}
h2 {
  
  text-align: center;
}
</style>

</head>
<body>
<%@ include file="../front/header.jsp" %>  

<div style="height:400px;">
  <%
		if(request.getParameter("login") != null){
			String username = request.getParameter("uname");
			String password = request.getParameter("pwd");
			boolean error = false;
			String msg= "";
			
			if(username.isEmpty()){
				error = true;
				msg +="Enter Username<br>";
				
			}

			if(password.isEmpty()){
				error = true;
				msg +="Enter Password<br>";
				
			}
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
					String sql ="SELECT * FROM user WHERE username=? AND password=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, username);
					ps.setString(2, password);
					
					ResultSet rs = ps.executeQuery();
					if(rs.next()){
						session.setAttribute("user", username);
						response.sendRedirect("dashboard.jsp");
					}
					else{
						out.print("<p>Invalid user</p>");
					}
					
					
					
		
				}catch(Exception e){
						e.printStackTrace();
					}

				
			}
			else{
				out.print("<p>" + msg + "</p>");
			}
		}
	%>
	<h2> Admin login </h2>
	<div align="center">
	<form action="" method="post" class="white_text">
		Username: <input type="text" name="uname"/><br><br>
		Password: <input type="password" name="pwd"/><br><br>
		<input type="submit" name="login" value="Log in"/>
		
	</form>
	</div>
	</div>
</body>
</html>