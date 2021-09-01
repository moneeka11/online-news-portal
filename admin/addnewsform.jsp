<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add news - Patrika </title>
</head>
<body>
<h2>Add News </h2>
<div >
<%
String category=request.getParameter("catName");
%>
<form action="upload.jsp?catName=<%= category %>" method="post" enctype="multipart/form-data">
	Title: <input type="text" name="tl" /><br><br>
	Description:<br><br>
	<textarea rows="15" cols="50" name="ds"></textarea><br>
	Date:
	<input type="date" name="date"><br><br>
	<input type="file" name="image" /><br><br>
	<input type="submit" value="Send" />
		
</form>
</div>
</body>
</html>