<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sport</title>
<style>
h2{
 margin:0;
 padding:0px;
}
div {
  border: 1px solid #333;
  padding:9px;
  margin: 1px;
  
}

</style>
</head>
<body>
<%! ResultSet rs; String sql; %>
	<%

	if(request.getParameter("search") !=null){
		
		String search= request.getParameter("search");
		sql ="SELECT * FROM sport WHERE title LIKE '%" + search +"%'";
		
	}
	else{
		
		sql ="SELECT * FROM sport";
	}
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
		
		PreparedStatement ps = con.prepareStatement(sql);
			 rs =  ps.executeQuery();
			
	   }catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	<br>
	<form action ="" method="get">
			<input type="text" name="search" value=""/>
			<input type="submit" name="go" value="Search"/>
		</form>
		<br>

			
			
	
		 <%
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
		
		
	
	

		

</body>
</html>