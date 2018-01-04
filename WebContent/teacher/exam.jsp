<%@page import="java.sql.*" %>
<%
String ses=(String)session.getAttribute("tid");
if(ses==null)
	response.sendRedirect("teacherpanel.jsp");

String sesname=(String)session.getAttribute("tname");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
  <title>Exams</title>
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
  
  .start{ 
background-color:#4BB448;
border: none;
border-radius: 5px;
color: white ;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 40px;
outline:none;
width:150px;
}
.stop{
background-color:#D34836;
border: none;
border-radius: 5px;
color: white ;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 40px;
outline:none;
width:150px;
}
.start:hover,.stop:hover{
box-shadow: inset 0 0 100px 100px rgba(255, 255, 255, 0.1);
}
th{
font-weight:normal;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size:18px;
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
  width:300px;
  position:relative;
  top:100px;
  padding:30px;
  margin:50px auto;
  padding-top:30px;
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
 .t1{
	padding:20px;
   height:50px;
   text-align:center;
   position:relative;
   }
   #validate
{
font-weight:normal;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size:18px;
}
radio{
outline:none;}
  </style>
</head>
<body>
<nav class="navbar navbar-light navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
    </div>
     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav nav-tabs">
      <li ><a href="welcometeacher.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-user"></span> Profile <span class="caret"></span></a>
      <ul class="dropdown-menu">
      <li><a href="profile.jsp"><span class="glyphicon glyphicon-list-alt"></span> View Profile</a></li>
      <li><a href="checkprofile.jsp"><span class="glyphicon glyphicon-wrench"></span>  Edit Profile</a></li>
      </ul>
      </li>
       <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="menu" aria-haspopup="true" aria-expanded="false">
         Exams<span class="caret"></span></a>
      <ul class="dropdown-menu">
      <li><a href="addquestion.jsp"><span class="glyphicon glyphicon-edit"></span> Add Question</a></li>
      <li><a href="viewquestion.jsp"><span class="glyphicon glyphicon-list-alt"></span> View Question</a></li>
      <li><a href="editquestion.jsp"><span class="glyphicon glyphicon-pencil"></span> Edit Question</a></li>
      <li><a href="deletequestion.jsp"><span class="glyphicon glyphicon-trash"></span> Delete Question</a></li>
      <li><a href="exam.jsp"><span class="glyphicon glyphicon-flash"></span> Start/Stop Exam</a></li>
      </ul>
      </li>
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
         <span class="glyphicon glyphicon-cog"></span> <%out.print(sesname); %></a>
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
<div align="center" class="para">
<form action="startexamaction.jsp" method="post">
<table class="t1"> 
<tr>
<th>
<input type="hidden" value="start" name="start">
<input class="start" type="submit" value="Start Exam">
</th>
</tr>
</table>
</form>
<br>
<form action="stopexamaction.jsp" method="post">
<table>
<tr>
<th>
<input type="hidden" value="stop" name="stop">
<input class="stop" type="submit" value="Stop Exam">
</th>
</tr>
</table>
</form>
<br>
<div align="center">
<label id="validate"></label>
</div>
</div>
</div>
</body>
</html>