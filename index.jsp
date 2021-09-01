
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page import="java.text.SimpleDateFormat" %>  


<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="image/patrika.jpg" type="image/x-icon" />
<meta charset="ISO-8859-1">
<title>Best Online News Portal of Nepal - Patrika</title>
<style>
.red_line {
    width: 100%;
    border-bottom: solid 2px #D42620;
    content: "";
    display: block;
    padding-bottom: 5px;}
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

a {
color:#37098a ;
font-weight:600;
font-size:0.9rem;
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

h2 {
font-family: "merriweatherbold";
    font-weight: normal;
    font-size: 1.0rem;
    line-height: 0.9rem;
    color: #D42620;
    margin-bottom: 0.8rem;
    padding-bottom: 5px;
    text-transform: uppercase;}
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
padding-top:0px!important;
font-size:1.7rem;
}

.category_box {
background: rgb(2,0,36);
background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(67,31,147,1) 100%);
width:400px;
height:25px;
padding:10px;
color: white;
}
</style>
</head>
<body>
<%! ResultSet rs; String sql;
String[] ads=new String[] {
		"/LoginTest/image/second_ad.gif",
		"/LoginTest/image/ad.gif",
		"/LoginTest/image/second_ad.gif",
		"/LoginTest/image/second_ad.gif",
		"/LoginTest/image/second_ad.gif",
		"/LoginTest/image/second_ad.gif",
		"/LoginTest/image/second_ad.gif",
		"/LoginTest/image/second_ad.gif"
};
String[] categories=new String[]{
"Sports",
 "Entertainment",
 "Weather",
"Politics",
"Health",
"Crime and Social Violence",
"Horoscope",
"Science & Technology" 
};

String[] cat_tables=new String[]{
"sport",
 "entertainment",
 "weather",
"politics",
"health",
"crime",
"horoscope",
"science"
};
%>


	
<div class="wrap">
	   <ul class="navbar">
	  	  <li><img src="/LoginTest/image/patrika.jpg" width="120" height="60" /></li>
		  <li><a class="active" href="index.jsp">Home</a></li>
 		   <li><a href="admin/admin.jsp">Admin Login</a></li>
 		   <li><a href="new/newsindex.jsp">News</a></li>
  		   <li><a href="front/contactus.jsp">Contact Us</a></li>
           <li><a href="front/aboutus.jsp">About Us</a></li>
           <li><a href="user/Feedback.jsp">Feedback</a></li>
		</ul>
</div>

<div class="top_banner_ad">
<img src="/LoginTest/image/top_banner.gif" width="1200" height="120"/>
</div>

<div class="date">
Today's date: <%= new java.text.SimpleDateFormat("dd/MM/yy").format(new java.util.Date()) %>
</div>
<div class="news_content">

<div class="categories">
<a href="#sport">Sports</a> | <a href="#entertainment">Entertainment</a> |
<a href="#weather">Weather</a> | <a href="#politics">Politics</a> |
<a href="#health">Health</a> | <a href="#crime">Crime and Social Violence</a>
| <a href="#horoscope">Horoscope</a> | <a href="#science">Science and Technology</a>
</div>
<h2 class="red_line">Recent news</h2>
<%
for(int i=0;i<categories.length;i++)
{
	String category=categories[i];
	sql="SELECT * FROM "+cat_tables[i]+" LIMIT 5;";
	%>
	<h3 class="category_box" id="<%=cat_tables[i]%>"> <%= category%></h3>
	<% 
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");

		PreparedStatement ps = con.prepareStatement(sql);
			 rs =  ps.executeQuery();
			
		}catch(Exception e){
			e.printStackTrace();
		}

				   while (rs.next()){ 
					   
					  
					  String title = rs.getString("title");
					  String imgName = rs.getString("image");
					  int ID=rs.getInt("id");
			%>	
							<div>
							<a href="/LoginTest/front/article_template.jsp?category=<%= cat_tables[i] %>&newsID=<%=ID %>"><h5 class="headline"><% out.print(title);%></h5></a>
								<p><img src="/LoginTest/image/<% out.print(imgName); %>" width="900" height="600" /></p>
								</div>
						 
						 
				  <%}%>
				  <p> <a href="/LoginTest/front/category_news_listing.jsp?category=<%= cat_tables[i] %>&canonical_name=<%= category%>">View all news from <%=category %></a>
				   <div class="top_banner_ad">
<img src=<%= ads[i]%> width="1200" height="120"/>

</div>
<%}%>
</div>

</body>
</html>