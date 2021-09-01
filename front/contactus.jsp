<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
</head>
<body>
<%@ include file="../front/header.jsp" %> 

<body bgcolor=" #e6f3ff">
      <%
		if(request.getParameter("submit") != null){
			String Name = request.getParameter("nm");
			String Email = request.getParameter("em");
			String Message= request.getParameter("Mg");
			boolean error = false;
			String msg= "";
			
			if(Name.isEmpty()){
				error = true;
				msg +="Enter Name<br>";
				
			}


			if(Email.isEmpty()){
				error = true;
				msg +="Enter Email<br>";
				
			}
			
			if(Message.isEmpty()){
				error = true;
				msg +="Enter Message<br>";
				
			}
			
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
					String sql ="INSERT INTO contactform (Name, Email, Message)  VALUES (?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, Name);
					ps.setString(2, Email);
					ps.setString(3, Message);
					int rs = 0;
					rs = ps.executeUpdate();
					if(rs!=0){
						
						response.sendRedirect("contactus.jsp" );
						
					}
					else{
						out.print("<p>Invalid contact</p>");
					}
					
					
				}catch(Exception e){
					
						e.printStackTrace();
					}

				
			}
			else{
				out.print("<p>" + msg + "</p>");
			}
			
			
		}
      
	%>   
<div class="container">
<h1 align="center">Contact Us</h1>
   <form action="" method="post">
   <table align="center"> 
   
     <tr>
       <td>Name:<br>
       <input placeholder=" Your Name" type="text" size='66' name="nm" value="" required  /></td>
       </tr> 
    
       <tr>
 
       <td> Email:<br>
         <input placeholder=" Your Email" type="text" size="66" name="em" value="" required /><br>
       </td>
       </tr>   
          
       <tr>
          
           <td>Message:<br>
           <textarea placeholder="Write something" rows="10" cols="68" name="Mg" value="" required/></textarea> </td>
       </tr>   
    
         
    
       <tr>
         <td><input type="submit" name="submit" value="Send"  /></td>
       </tr>
  
     </table>
     
     
     </form>
</div>
<%@ include file="../front/footer.jsp" %> 
</body>
</html>