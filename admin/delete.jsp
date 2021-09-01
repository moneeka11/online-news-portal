<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<% 
	int id =Integer.parseInt( request.getParameter("sid"));
    String category=request.getParameter("catName");
	
			try{
		
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
					String sql ="DELETE FROM "+category+ " WHERE id=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setInt(1, id);
					
					ps.executeUpdate();
					response.sendRedirect("admincatpage.jsp");
					
		
				}catch(Exception e){
						e.printStackTrace();
					}

		%>