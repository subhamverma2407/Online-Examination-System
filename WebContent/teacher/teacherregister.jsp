<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Register</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
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
width:500px;
position:relative;
top:10px;
padding:30px;
margin:50px auto;
padding-top:10px;
}
.tb1{
height:400px;
width:400px;}
.tb2{
text-align:center;
position:relative;
width:400px;}
.field{
background-color: #e5e5e5;
border: none;
font-weight:normal;
font-style:italic;
border-radius: 3px;
color: #5a5656;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 14px;
height: 30px;
width:185px;;
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
outline:none;
width:400px;
}
.signup{
background-color: #ff4d4d;
border: none;
border-radius: 5px;
color: #f4f4f4;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 40px;
outline:none;
width:400px;
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
font-size:18px;
width:400px;
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
    filter:blur(3px) brightness(0.7) opacity(0.6);
}
th{
font-weight:normal;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size:18px;
}
#validate
{
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
</style>
</head>
<body>
<div class="back"></div>
<div class="box">
<form action="teacherregaction.jsp" method="post">
<table class="tb1" align="center">
<caption>Teacher Register</caption>
<tr>
<th style="text-align:left;">Name</th>
<th style="text-align:right;"><input class="field" type="text" name="nm" placeholder="Enter Name" required>
</th>
</tr>
<tr>
<th style="text-align:left;">Registration Number</th>
<th style="text-align:right;"><input class="field" type="text" name="tid" placeholder="Enter Teacher Id." required>
</th>
</tr>
<tr>
<th style="text-align:left;">Password</th>
<th style="text-align:right;"><input class="field" type="password" name="ps" placeholder="Enter Password" required>
</th>
</tr>
<tr>
<th style="text-align:left;">Date Of Birth</th>
<th style="text-align:right;"><input class="field" type="text" name="dob" placeholder="Enter DOB" required>
</th>
</tr>
<tr>
<th style="text-align:left;">Phone Number</th>
<th style="text-align:right;"><input class="field" type="text" name="phno" placeholder="Enter Mobile Number" required>
</th>
</tr>
<tr>
<th style="text-align:left;">Email</th>
<th style="text-align:right;"><input class="field" type="email" name="ml" placeholder="Enter Email-ID" required>
</th>
</tr>
<tr>
<th style="text-align:right;"  colspan="2"><input class="login" type="submit" value="Register"></th>
</tr>
</table>
</form>
<form action="teacherpanel.jsp">
<table align="center" class="tb2">
<tr>
<th><input class="signup" type="submit" value="Login"></th>
</tr></table>
</form>
<br>
<div align="center">
<a style="text-decoration:none;" href="../index.jsp"><input class="home" type="button" value="Home" onClick="../index.jsp"></a>
</div>
<div align="center">
<label id="validate"></label>
</div>
</div>
</body>
</html>