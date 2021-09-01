<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
<h3>Edit News Form</h3>
<%! ResultSet rs; String title; %>
<% 
    int id =Integer.parseInt( request.getParameter("spid"));
			try{
		
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
					String sql ="SELECT * FROM sport WHERE id=?";
					PreparedStatement ps = con.prepareStatement(sql);
		 			ps.setInt(1,id);
		 			rs = ps.executeQuery();
		 			rs.next();
		 			title = rs.getString("title");
		 			
		
				}catch(Exception e){
						e.printStackTrace();
					}

		%>
<form action="update.jsp" method="post">
<input type="hidden" name="id" value="<%=id %>" />
	Title: <input type="text" name="tl" value ="<%=title%>" /><br><br>
	Description:<br><br>
	<textarea rows="15" cols="50" name="ds"><%=rs.getString("description")%></textarea><br>
	<input type="file" name="image" /><br><br>
	<input type="submit" value="Send" />
</form>

</body>
</html>