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
  <title>Exams</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="../css/jquery-3.2.1.min.js"></script>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../css/bootstrap.min.js"></script>
  <script>
	  function preventBack(){window.history.forward();}
	  setTimeout("preventBack()", 0);
	  window.onunload=function(){null};
	</script>
  <style type="text/css">
  p{
  color:blue;
  font-size:25px;
  }
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
  width:300px;
  position:relative;
  top:100px;
  padding:20px;
  margin:50px auto;
  }
  .para p{
    font-weight:normal;
    font-family: 'Open Sans', Arial, Helvetica, sans-serif;
  font-size:18px;
  color:white;
  }
  .t1{
	padding:20px;
   height:50px;
   text-align:center;
   position:relative;
   }
   th{
font-weight:normal;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size:18px;
}
   .start{ 
background-color:#4BB448;
border: none;
border-radius: 5px;
color: white ;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 30px;
outline:none;
width:150px;
}
.start:hover{
box-shadow: inset 0 0 100px 100px rgba(255, 255, 255, 0.1);}
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
<%
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
String uid=request.getParameter("uid");
String upass=request.getParameter("pass");
try{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps1=con.prepareStatement("select status from student where usid=?");
	ps1.setString(1,ses);
	ResultSet rs1=ps1.executeQuery();
	PreparedStatement ps=con.prepareStatement("select * from exam");
	ResultSet rs=ps.executeQuery();
	if(rs1.next())
	{
		if(rs1.getInt(1)==0)
		{
			if(rs.next())
			{
				if(rs.getInt(1)==1)
				{
					%>
					<div align="center" class="para">
					<form action="examaction.jsp">
					<table class="t1"> 
					<tr>
					<th>
					<input class="start" type="submit" name="start" value="Give Exam">
					</th>
					</tr>
					</table>
					</form>
					</div>
					<% 
				}
				else
				{
					%>
					<div align="center" class="para">
					<p>No Exams!</p>
					</div>
					<%
				}
			}
		}
		else
		{	
			%>
			<div align="center" class="para">
			<p>Exam Already Given!</p>	
			</div>
			<%
		}
	}
	con.close();
}
catch(Exception e)
{
	out.print(e);
}
%>
</div>
</body>
</html>