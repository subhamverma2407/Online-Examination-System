<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Portal</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<script src="../scripts/jquery-3.2.1.min.js"></script>
<style>
body{
background: #eee;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
line-height: 1.5em;
}
.box{
box-shadow:0 2px 2px 0 rgba(0,0,0,0.8);
background:white;
border:1px solid #696969;
width:400px;
position:relative;
top:100px;
padding:30px;
margin:50px auto;
padding-top:10px;
}
.tb1{
height:200px;
width:330px;}
.tb2{
text-align:center;
position:relative;
width:330px;}
input[type="text"],input[type="password"]
{
background-color: #e5e5e5;
border: none;
font-weight:normal;
font-style:italic;
border-radius: 3px;
color: #5a5656;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 14px;
height: 30px;
outline: none;
padding: 0px 10px;
}
.login{
background-color:#008dde;
border: none;
border-radius: 5px;
color: #f4f4f4;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 40px;
font-size: 14px;
width:330px;
outline:none;
}
.signup{
background-color: #ff4d4d;
border: none;
border-radius: 5px;
color: #f4f4f4;
font-size: 14px;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 40px;
width:330px;
outline:none;
}
.home{
background-color:#4BB448;
border: none;
border-radius: 5px;
color: #f4f4f4;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 40px;
outline:none;
width:330px;
}
.home:hover{
box-shadow: inset 0 0 100px 100px rgba(255, 255, 255, 0.1);}
.back {
    position: fixed;
    top:0;
    left:0;
    height:100%;
    width:100%;
    margin:0px auto;
    background-image:url('../images/bg.jpg');
    background-color:rgba(0,0,0,0.5);
    background-repeat:no-repeat;
    background-attachment:fixed;
    background-size:cover;
    filter:blur(3px) brightness(0.8) opacity(0.6);
}
th{
font-weight:normal;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size:18px;
}
#validate
{
text-align:center;
font-weight:normal;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size:18px;
}
.login:hover,.signup:hover{
box-shadow: inset 0 0 100px 100px rgba(255, 255, 255, 0.1);}
caption{
margin-bottom:25px;
font-size:30px;
text-align:center;
color:#696969;}
.check{
outline:none;
appearance:none;}
a {
	outline: none;
	font-size:22px;
	color: #404d5b;
	font-size:14px;
	text-decoration: none;
	white-space: nowrap;
	position: relative;
	display: inline-block;
	vertical-align: bottom;
}
</style>
</head>
<body>
<%
String ses=(String)session.getAttribute("tid");
if(ses!=null)
	response.sendRedirect("welcometeacher.jsp");
%>
<div class="back"></div>
<div class="box">
<form action="teacherloginaction.jsp" method="post">
<table class="tb1" align="center">
<caption>Teacher Login</caption>
<tr>
<th style="text-align:left;">Enter Teacher-Id</th>
<th style="text-align:center;"><input autocomplete="off" class="usr" type="text" name="tid" placeholder="Enter Teacher-Id" required>
</tr>
<tr>
<th style="text-align:left;">Enter Password</th>
<th style="text-align:center;"><input class="pwd" type="password" name="pass" placeholder="Enter Password" required>
</tr>
<tr>
<th style="font-size:14px; text-align:left;">
<input type="checkbox" class="check">Show Password
<script type="text/javascript">
$(document).ready(function () {
	 $(".check").click(function () {
	 if ($(".pwd").attr("type")=="password") {
	 $(".pwd").attr("type", "text");
	 }
	 else{
	 $(".pwd").attr("type", "password");
	 }
	 });
	 });
</script>
</th>
</tr>
<tr>
<th  colspan="2"><input class="login" type="submit" value="Login"></th>
</tr>
</table>
</form>
<form action="teacherregister.jsp">
<table align="center" class="tb2">
<tr>
<th><input class="signup" type="submit" value="Register"></th>
</tr></table>
</form>
<br>
<div align="center">
<a style="text-decoration:none;" href="../index.jsp"><input class="home" type="button" value="Home"></a>
</div>
<div align="center">
<label id="validate"></label>
</div>
</div>
</body>
</html>