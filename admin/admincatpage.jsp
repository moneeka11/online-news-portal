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
<%! ResultSet rs; String sql;String category,cat_canonical_name; %>
	<%

	if(request.getParameter("search") !=null){
		
		String search= request.getParameter("search");
		sql ="SELECT * FROM "+category+ " WHERE title LIKE '%" + search +"%'";
		
	}
	else if (request.getParameter("catName")!=null){
		category=request.getParameter("catName");
		cat_canonical_name=request.getParameter("canonical_name");
		sql ="SELECT * FROM "+category;
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
	<a href="addnewsform.jsp?catName=<%= category %>"> Add News </a>
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
					<td><a href="/LoginTest/front/article_template.jsp?newsID=<%= id %>&category=<%= category %>"> View </a>|<a href="edit.jsp?spid=<%=id %>&catName=<%= category %>"> Edit </a>|<a href="delete.jsp?sid=<%=id %>&catName=<%= category %>">Delete</a></td>
				 </tr>
		  <%}%>
		
		
	</table>
	<br>

	 <p> <a href="/LoginTest/front/category_news_listing.jsp?category=<%= category %>&canonical_name=<%= cat_canonical_name%>">View all news from <%=cat_canonical_name %></a>	

</body>
</html>