<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%!String category;int id; String title="", date , description,imageURL;
ResultSet rs;
%>
<!DOCTYPE html>

<html>

<head>
<meta charset="ISO-8859-1">
<title>News - Patrika</title>

<style>
body{
	/* background-image: url("image/online.jpg");
	background-size:cover;
	background-repeat:no-repeat; */
	margin:0!important;
	
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
	height:60px;
	width:auto;
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
	height:20px!important;
}
.top_banner_ad{
padding:20px;
}

.news_content {
padding:20px;

}

.label_title {
color: #D32F2F;
}

.date {
color: #D32F2F;
font-weight: 600;
text-align:center;
}


.headline {
color: #D32F2F;
font-weight: 400;
}

</style>

</head>
<body>
<%@ include file="header.jsp" %>  


<div class="news_content">


<%
id=Integer.parseInt(request.getParameter("newsID"));
category=request.getParameter("category");
try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
	String sql ="SELECT * FROM "+ category+" WHERE id=?";
	PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,id);
		rs = ps.executeQuery();
		rs.next();
		 title = rs.getString("title");
		description= rs.getString("description");
		date= rs.getString("date");
		imageURL = rs.getString("image");

		
		

}catch(Exception e){
		e.printStackTrace();
	}
%>

							<h5 class="headline"><% out.print(title); %></h5><br>
							<h5><% out.print(date); %></h5><br>
							<div>
								<p><img src="/LoginTest/image/<% out.print(imageURL); %>" width="600" height="350" /></p>
								 <p><%=rs.getString("description")%></p>
							</div>
							</div>
</body>
</html>