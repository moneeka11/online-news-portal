<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sport</title>
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
	<a href="addnewsform.jsp"> Add News </a>
	<br>
	<form action ="" method="get">
			<input type="text" name="search" value=""/>
			<input type="submit" name="go" value="Search"/>
		</form>
		<br>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
		<tr style="background-color:DodgerBlue;">
			<th>Id</th>
			<th>Title</th>
			<th>Image</th>
			<th>Description</th>
			<th>Action</th>
			
		</tr>
		 <%
		   while (rs.next()){ 
			   
			  int id= rs.getInt("id");
			  String title = rs.getString("title");
			  String imgName = rs.getString("image");
	%>
		

				<tr style="background-color:#;">
					<td><%=id %></td>
					<td><% out.print(title); %></td>
					<td><img src="/LoginTest/image/<% out.print(imgName); %>" width="100" height="100" /></td>
					<td><%=rs.getString("description")%></td>
					<td><a href="edit.jsp?spid=<%=id %>"> Edit </a>|<a href="delete.jsp?sid=<%=id %>">Delete</a></td>
				 </tr>
		  <%}%>
		
		
	</table>
	<br>

		

</body>
</html>