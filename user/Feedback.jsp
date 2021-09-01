<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
</head>
<body>
<%@ include file="../front/header.jsp" %>  
<body bgcolor=" #e6f3ff">
<% 
if(request.getParameter("success")!=null)
{
	%>
	<p> We have successfully received your feedback. Thank you! </p>
	
	<%	
}
%>

<div class="form">
<form action="insert_feedback.jsp" method="post">            
<fieldset style="width:500px">                
<legend>We'd love to hear your thoughts about Patrika!</legend>                
<br>
<label for="name"> Name: </label> 
<input type="text" name="name" required /><br><br>   

Your feedback:<br><br>
<label for="feedback"> </label> 
<textarea rows="10" cols="50" type="text" name="feedback" required></textarea>
<br>
<input type="submit" value="submit" > 
</fieldset>        
</form>    

</div>

</body>
</html>