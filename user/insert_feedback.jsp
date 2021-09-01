<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
//database entry
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
		String sql ="INSERT INTO feedback" +"(name,feedback) VALUES(?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("name"));
		ps.setString(2, request.getParameter("feedback"));
		ps.executeUpdate();
		response.sendRedirect("Feedback.jsp?success=true");
					
	}catch(Exception e){
		e.printStackTrace();
	}
%>