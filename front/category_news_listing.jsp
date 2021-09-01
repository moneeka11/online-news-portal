<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All news from <%= category_canonical_name %></title>
</head>
<body>
<%@ include file="header.jsp" %>  
<%!String category;int id;ResultSet rs;String sql,category_canonical_name;
%>

<% 
String category_table=request.getParameter("category");
category_canonical_name=request.getParameter("canonical_name");
sql="SELECT * FROM "+category_table;
%>
<h3> <%= category_canonical_name%></h3>
<% 
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
				  int ID=rs.getInt("id");
		%>
								
						<div>
						<a href="/LoginTest/front/article_template.jsp?category=<%= category_table %>&newsID=<%=ID %>"><h5 class="headline"><% out.print(title);%></h5></a>
							<p><img src="/LoginTest/image/<% out.print(imgName); %>" width="900" height="600" /></p>
							</div>
					 
					 
			  <%}%>
</body>
</html>