<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <%
    	if(session.getAttribute("user") == null){
    		response.sendRedirect("admin.jsp");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<style>
body{
	background-color: LightSteelBlue ;
	 background-image: url("../image/addd.jpg");
	background-size:cover;
	margin:0;
}

.header {
  background-color:darkblue ;
  padding: 5px;
  text-align: center;
  margin:0px;
  
  
  
}

 .vertical-menu{
	width:200px;
	
}
.vertical-menu a{
	background-color:#333;
	color:white;
	display: block;
	padding: 13px;
	text-decoration: none;

}
.vertical-menu a:hover{
	background-color: #ccc;
}

.vertical-menu a.active {
	background-color: #4CAF50;
	color: white;
}
h2 {
  text-align: left;
}

</style>
</head>
<body>
<div class="header" >
<h2>Welcome <%=session.getAttribute("user") %>
<a href="logout.jsp" style="float:right;">Logout</a></h2>
</div>

<div class="vertical-menu">
	<a href="#" class="active">DashBoard</a>
	<a href="/LoginTest/admin/admincatpage.jsp?catName=sport&canonical_name=Sports">Sports</a>
	<a href="/LoginTest/admin/admincatpage.jsp?catName=entertainment&canonical_name=Entertainment">Entertainment</a>
	<a href="/LoginTest/admin/admincatpage.jsp?catName=weather&canonical_name=Weather">Weather</a>
	<a href="/LoginTest/admin/admincatpage.jsp?catName=politics&canonical_name=Politics">Politics</a>
	<a href="/LoginTest/admin/admincatpage.jsp?catName=health&canonical_name=Health">Health</a>
	<a href="/LoginTest/admin/admincatpage.jsp?catName=crime&canonical_name=Crime and Social Violence">Crime and Social Violence </a>
	<a href="/LoginTest/admin/admincatpage.jsp?catName=horoscope&canonical_name=Horoscope">Horoscope</a>
	<a href="/LoginTest/admin/admincatpage.jsp?catName=science&canonical_name=Science & Technology">Science & Technology</a>
	<a href="/LoginTest/admin/feedback_listing.jsp">Feedback</a>
	<a href="/LoginTest/admin/contactadmin.jsp">Contact</a>
</div>

</body>
</html>