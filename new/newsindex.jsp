<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>News Homepage</title>
<style>

body {
  margin: 0;
  background-image: url("../image/newsss.jpg");
}

/* Style the header */
.header {
  background-color: lightblue;
  padding: 3px;
  text-align: left;
  
  
  
}
h1 {
  font-size: 36px;
  
  padding: 0px;
  }
#logo {
	margin-top:10px;
	width:300px;
	float:left;
	margin-right:10px;
	padding: 8px;
	height:50px;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 30px;
  text-decoration: none;
}

li a:hover {
  background-color: #ccc;
}
body{
	background-color: LightSteelBlue ;
	background-size:cover;
	margin:0;
}

</style>
</head>
<body>
<body>
	<img id="logo"src="../image/patrika.jpg">

<div class="header">
  <h1>ONLINE NEWS</h1>
</div>
 <ul>
 <li><a class="active" href="/LoginTest/front/category_news_listing.jsp?category=sport&canonical_name=Sports">Sports</a>
</li><li>	<a href="/LoginTest/front/category_news_listing.jsp?category=entertainment&canonical_name=Entertainment">Entertainment</a>
</li><li>	<a href="/LoginTest/front/category_news_listing.jsp?category=weather&canonical_name=Weather">Weather</a>
	</li><li><a href="/LoginTest/front/category_news_listing.jsp?category=politics&canonical_name=Politics">Politics</a>
	</li><li><a href="/LoginTest/front/category_news_listing.jsp?category=health&canonical_name=Health">Health</a>
</li><li>	<a href="/LoginTest/front/category_news_listing.jsp?category=crime&canonical_name=Crime and Social Violence">Crime and Social Violence </a>
	</li><li><a href="/LoginTest/front/category_news_listing.jsp?category=horoscope&canonical_name=Horoscope">Horoscope</a>
</li><li>	<a href="/LoginTest/front/category_news_listing.jsp?category=science&canonical_name=Science & Technology">Science & Technology</a>
	
</ul>
</body>
</html>