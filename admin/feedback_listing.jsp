<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body bgcolor=" #e6f3ff">
<a href="/LoginTest/admin/dashboard.jsp">Go back to dashboard</a><br>
<%!String category;int id;ResultSet rs;String sql,category_canonical_name;
%>

<% 
String category_table=request.getParameter("category");
category_canonical_name=request.getParameter("canonical_name");
sql="SELECT * FROM feedback ORDER BY creation_date DESC;";
%>
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
				   
				  
				  String name = rs.getString("name");
				  String feedback = rs.getString("feedback");
				  String date= rs.getString("creation_date");
				 %>
					<fieldset style="width:500px">
				 <div class="feedback_section">
				 
				 <p> Name: <%= name %></p></div>
				 <p> Feedback: <%= feedback %></p>
				  <p> Date: <%= date %> </p>
				
				 </fieldset>
				  <br>
			   <% }%>
		
</body>
</html>