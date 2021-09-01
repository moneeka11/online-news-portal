<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<style>
body{
	/* background-image: url("image/online.jpg");
	background-size:cover;
	background-repeat:no-repeat; */
	margin:0;
}
.wrap{
	width:100%;
	height:60px;
	margin:0;
	background:#366b82;
	
}
.navbar{
	height:60px;
	padding:0;
	margin:0;
	position:absolute;
	border-right:1px solid #54879d;
}
.navbar li{
	height:auto;
	width:195px;
	float:left;
	text-align:center;
	list-style:none;
	font-weight:bold:
	font-size:14px;
	font-family:Arial;
	padding:0;
	margin:0;
	background:#366b82;

}
.navbar a{
	padding: 20px;
	border-left:1px solid #54879d;
	border-right:1px solid #1f5065;
	text-decoration:none;
	color:white;
	display:block;
}
.navbar li:hover, a:hover{
	background:#54879d;
}

</style>
</head>
<body>
<%! ResultSet rs; String sql; %>

<% 	if(request.getParameter("cat") !=null) { %>
	
<div class="wrap">
	   <ul class="navbar">
		  <li><a class="active" href="index.jsp">Home</a></li>
 		   <li><a href="admin/admin.jsp">AdminLogin</a></li>
 		   <li><a href="#">Reporter</a></li>
 		   <li><a href="new/newsindex.jsp">News</a></li>
  		   <li><a href="front/contactus.jsp">Contact Us</a></li>
           <li><a href="front/aboutus.jsp">About Us</a></li>
           <li><a href="user/Feedback.jsp">FeedBack</a></li>
		</ul>
	
	
</div>
<div class="sidebar">
 <ul>
  <li><a class="active" href="index.jsp?cat=sport">Sport</a></li>
  <li><a href="#">Entertainment</a></li>
  <li><a href="#">Weather</a></li>
  <li><a href="#">Politics</a></li>
  <li><a href="#">Health</a></li>
  <li><a href="#">Crime and Social Violence</a></li>
  <li><a href="#">Horoscope</a></li>
  <li><a href="#">Science & Technology</a></li>
</ul>
</div>

<%
String cat= request.getParameter("cat");
sql ="SELECT * FROM "+cat;


try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");

PreparedStatement ps = con.prepareStatement(sql);
	 rs =  ps.executeQuery();
	
}catch(Exception e){
	e.printStackTrace();
}

		   while (rs.next()){ 
			   
			  
			  String title = rs.getString("title");
			  String imgName = rs.getString("image");
	%>
		
					<h2><% out.print(title); %></h2><br>
					<div>
						<p><img src="/LoginTest/image/<% out.print(imgName); %>" width="600" height="350" /></p>
						 <p><%=rs.getString("description")%></p>
					</div>
				 
		  <%}%>
	  <%} else {%>
	  
<div class="wrap">
	   <ul class="navbar">
		  <li><a class="active" href="index.jsp">Home</a></li>
 		   <li><a href="admin/admin.jsp">AdminLogin</a></li>
 		   <li><a href="#">Reporter</a></li>
 		   <li><a href="new/newsindex.jsp">News</a></li>
  		   <li><a href="front/contactus.jsp">Contact Us</a></li>
           <li><a href="front/aboutus.jsp">About Us</a></li>
           <li><a href="user/Feedback.jsp">FeedBack</a></li>
		</ul>
	
	
</div>
<div class="sidebar">
 <ul>
  <li><a class="active" href="index.jsp?cat=sport">Sport</a></li>
  <li><a href="#">Entertainment</a></li>
  <li><a href="#">Weather</a></li>
  <li><a href="#">Politics</a></li>
  <li><a href="#">Health</a></li>
  <li><a href="#">Crime and Social Violence</a></li>
  <li><a href="#">Horoscope</a></li>
  <li><a href="#">Science & Technology</a></li>
</ul>
</div>
<%} %>	  


	

</body>
</html>