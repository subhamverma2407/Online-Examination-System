<%@page import="java.sql.*" %>
<%
String ses=(String)session.getAttribute("uid");
if(ses==null)
	response.sendRedirect("studentpanel.jsp");

String sesname=(String)session.getAttribute("uname");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
  <title>Edit Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="../css/jquery-3.2.1.min.js"></script>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../css/bootstrap.min.js"></script>
  <style type="text/css">
  body{
    top:0;
    left:0;
    height:100%;
    width:100%;
    min-height:640px;
    margin:0px auto;
  background-image:url('../images/bg3.jpg');
  background-repeat: no-repeat;
    background-attachment:fixed;
    background-size:cover;
  }
  .dropdown-menu{
  background-color: transparent;
        background: transparent;
        border-color: transparent;
  }
  .para{
  font-family: 'Open Sans', Arial, Helvetica, sans-serif;
  background-color:rgba(0,0,0,0.7);
  color:white;
  border-radius:10px;
  border:1px solid #696969;
  width:550px;
  position:relative;
  top:100px;
  padding:30px;
  margin:50px auto;
  padding-top:10px;
  }
  .navbar li a{
  color:black;}
  .nav{
 background-color: transparent;
   background: transparent;
   border-color: transparent;}
   .nav ul li:hover{
   background-color: transparent;
   background: transparent;
   border-color: transparent;}
   
   .t1{
   padding:10px;
   height:200px;
   text-align:center;
   position:relative;
   }
   .t2{
   text-align:center;
   position:relative;
   }
   th{
   font-size:20px;
   font-weight:normal;
   }
     ul.nav >li >a:hover{
   background-color: #000000;
	color: #FFFFFF;
}
ul.dropdown-menu >li >a:hover{
   background-color: #000000;
	color: #FFFFFF;
}

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
outline: none;
padding: 0px 10px;
}
.button{
background-color:#008dde;
border: none;
border-radius: 5px;
color: #f4f4f4;
cursor: pointer;
padding-top:2px;
padding-bottom:2px;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size:18px;
height: 35px;
width:150px;
outline:none;
}
   

  </style>
</head>
<body>
<nav class="navbar navbar-light navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
    </div>
    <ul class="nav nav-tabs">
      <li ><a href="welcomestudent.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          <span class="glyphicon glyphicon-user"></span> Profile <span class="caret"></span></a>
      <ul class="dropdown-menu">
      <li><a href="profile.jsp"><span class="glyphicon glyphicon-list-alt"></span> View Profile</a></li>
      <li><a href="checkprofile.jsp"><span class="glyphicon glyphicon-wrench"></span>  Edit Profile</a></li>
      </ul>
      </li>
      <li><a href="exam.jsp">Exams</a></li>
      <li><a href="result.jsp">Results</a></li>
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
         <span class="glyphicon glyphicon-cog"></span> <%out.print(sesname); %></a>
      <ul class="dropdown-menu">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-off"></span> Logout</a></li>
      </ul>
      
    </ul>
     <script>
  $('ul.nav li.dropdown').hover(function() {
	  $(this).find('.dropdown-menu').stop(true, true).slideDown(250);
	}, function() {
	  $(this).find('.dropdown-menu').stop(true, true).slideUp(250);
	});
  </script>
    
  </div>
</nav>

		<div align="center" class="para">
		<form action="checkaction.jsp" method="post">
		<table class="t1" align="center">
		<tr>
		<th>Enter Current Password</th>
		</tr>
		<tr>
		<th style="text-align:center;"><input class="field" type="password" name="check" placeholder="Enter Current Password"></th>
		</tr>
		<tr>
		<th style="text-align:center;" colspan="2"><input class="button"  type="submit" value="Check">
		</th>
		</tr>
		</table>
		</form>
		<table class="t2">
		<tr>
		<th id="val" style="text-align:center;" ></th>
		</tr>
		</table>
		</div>
	
</body>
</html>