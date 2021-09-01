<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<% 
	int id =Integer.parseInt( request.getParameter("sid"));
	
			try{
		
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
					String sql ="DELETE FROM sport WHERE id=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setInt(1, id);
					
					ps.executeUpdate();
					response.sendRedirect("sportindex.jsp");
					
		
				}catch(Exception e){
						e.printStackTrace();
					}

		%>