<%@page import="java.sql.*" %>
<%
String ses=(String)session.getAttribute("aid");
if(ses==null)
	response.sendRedirect("adminpanel.jsp");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
  <title>Reset</title>
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
  
  
  .container{
	position:relative;
  width:70%;
 	top:100px;
 	
  }
 .para{
  font-family: 'Open Sans', Arial, Helvetica, sans-serif;
  background-color:rgba(0,0,0,0.7);
  color:white;
  border-radius:10px;
  border:1px solid #696969;
  width:400px;
  position:relative;
  top:100px;
  padding:30px;
  margin:50px auto;
  padding-top:30px;
  }
  .para p{
    font-weight:normal;
  font-size:20px;
  align:right;
  color:white;
  font-family: 'Open Sans', Arial, Helvetica, sans-serif;
  
  }
    .start{ 
background-color:#008dde;
border: none;
border-radius: 5px;
color: white ;
font-size:18px;
font-width:normal;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 40px;
outline:none;
width:150px;
}
.start:hover{
box-shadow: inset 0 0 100px 100px rgba(255, 255, 255, 0.1);
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
   ul.nav >li >a:hover{
   background-color: #000000;
	color: #FFFFFF;
}
ul.dropdown-menu >li >a:hover{
   background-color: #000000;
	color: #FFFFFF;
}
#validate
{
color:white;
font-weight:normal;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size:18px;
}

  </style>
</head>
<body>
<nav class="navbar navbar-light navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
    </div>
     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav nav-tabs">
      <li ><a href="welcomeadmin.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
       <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="menu" aria-haspopup="true" aria-expanded="false">
         <span class="glyphicon glyphicon-wrench"></span> Action<span class="caret"></span></a>
      <ul class="dropdown-menu">
      <li><a href="deletestudent.jsp"><span class="glyphicon glyphicon-trash"></span> Delete Student</a></li>
      <li><a href="deleteteacher.jsp"><span class="glyphicon glyphicon-trash"></span> Delete Teacher</a></li>
      <li><a href="viewmarks.jsp"><span class="glyphicon glyphicon-list-alt"></span> View Marks</a></li>
      <li><a href="resetexam.jsp"><span class="glyphicon glyphicon-flash"></span> Reset Exam</a></li>
      </ul>
      </li>
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
         <span class="glyphicon glyphicon-cog"></span> Admin</a>
      <ul class="dropdown-menu">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-off"></span> Logout</a></li>
      </ul>
      </li>
      
    </ul>
    
  </div>
  </div>
   <script>
  $('ul.nav li.dropdown').hover(function() {
	  $(this).find('.dropdown-menu').stop(true, true).slideDown(250);
	}, function() {
	  $(this).find('.dropdown-menu').stop(true, true).slideUp(250);
	});
  </script>
</nav>
<div align="center" class="container">
		<div class="para">
		<form onsubmit="return confirm('Are you sure you want to Reset?');" method="post" action="resetaction.jsp">
		<table class="t1" align="center">
		<tr>
		<th>
		<input type="hidden" name="hidden" value="0">
		<input class="start" type="submit" value="Reset">
		</th>
		</tr>
		</table>
		</form>
		<br>
		<p>
		This will stop all Started Exams and Reset results of all students.
		</p>
	
		</div>
		

</div>
</body>
</html>