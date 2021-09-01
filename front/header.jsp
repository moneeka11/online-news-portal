<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
body{
	/* background-image: url("image/online.jpg");
	background-size:cover;
	background-repeat:no-repeat; */
	margin:0!important;
}
.wrap{
	width:100%;
	height:60px;
	margin:0;
	background:#37098a;
	
}
.navbar{
	height:60px;
	padding:0;
	margin:0;
	position:absolute;
	
}
.navbar li{
	height:60px;
	width:auto;
	float:left;
	text-align:center;
	list-style:none;
	font-weight:bold:
	font-size:14px;
	font-family:Arial;
	padding:0;
	margin:0;
	background:#37098a;

}
.navbar a{

	padding: 20px;
	
	text-decoration:none;
	color:white;
	display:block;
}
.navbar li:hover, a:hover{
	background:#11022d;
	height:20px!important;
}
.top_banner_ad{
padding:20px;
}

.news_content {
padding: 0px 0px 20px 20px;


}

.label_title {
color: #D32F2F;
}

.date {
color: #D32F2F;
font-weight: 600;
text-align:center;
}


.headline {
color: #323437;
font-weight: 700;
font-size:1.7rem;
}

</style>

</head>
<body>

	
<div class="wrap">
	   <ul class="navbar">
	  	  <li><img src="/LoginTest/image/patrika.jpg" width="120" height="60" /></li>
		  <li><a class="active" href="/LoginTest/index.jsp">Home</a></li>
 		   <li><a href="/LoginTest/admin/admin.jsp">Admin Login</a></li>
 		   <li><a href="/LoginTest/new/newsindex.jsp">News</a></li>
  		   <li><a href="/LoginTest/front/contactus.jsp">Contact Us</a></li>
           <li><a href="/LoginTest/front/aboutus.jsp">About Us</a></li>
           <li><a href="/LoginTest/user/Feedback.jsp">Feedback</a></li>
		</ul>
</div>
</body>
</html>