<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<% 
    int id =Integer.parseInt( request.getParameter("id"));
	String title = request.getParameter("tl");
	String description = request.getParameter("ds");
	
			try{
		
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
					String sql ="UPDATE sport SET title=?,description =? WHERE id=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, title);
					ps.setString(2, description);
					ps.setInt(3,id);
					ps.executeUpdate();
					response.sendRedirect("sportindex.jsp");
					
		
				}catch(Exception e){
						e.printStackTrace();
					}

		%>