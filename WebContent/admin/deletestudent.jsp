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
  <title>Delete Student</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="../css/jquery-3.2.1.min.js"></script>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../css/bootstrap.min.js"></script>
 
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
  .field{
border: none;
font-weight:normal;
border-radius: 3px;
color: #5a5656;
background-color:white;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 18px;
height: 30px;
outline: none;
padding: 0px 10px;
}
 .field2{
border: none;
font-weight:normal;
border-radius: 3px;
color: #5a5656;
background-color:#e0e0e0;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 18px;
height: 30px;
outline: none;
padding: 0px 10px;
}
.field1{
border: none;
font-weight:normal;
background-color:rgba(0,0,0,0.7);
color: white;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 18px;
height: 30px;
outline: none;
padding: 0px 10px;
}
.action{
border: none;
font-weight:normal;
background-color:rgba(0,0,0,0.7);
color: white;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 18px;
height: 30px;
outline: none;
width:100px;
padding: 0px 10px;
}
  .container{
	position:relative;
  width:70%;
 	top:100px;
 	
  }
  textarea{
   resize:none;
   outline:none;
   text-align:center;
   color: #5a5656;
   font-weight:bold;
   font-size:14px;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
   border-radius:5px;
   padding: 10px;
   
   }
  .para{
  font-family: 'Open Sans', Arial, Helvetica, sans-serif;
  background-color:rgba(0,0,0,0.7);
  color:black;
  border-radius:10px;
  border:1px solid #696969;
  position:relative;
  top:150px;
  width:600px;
  padding:30px;
  margin:0 auto;
  }
   .t1{
   padding:4px;
   height:30px;
   width:300px;
   text-align:center;

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
th,caption{
text-align:center;
font-size:16px;
color:white;
font-weight:normal;
}
.submit{
   background-color:#D34836;
border: none;
border-radius: 5px;
color: white ;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 30px;
outline:none;
width:100px;
   }
   .submit:hover{
   box-shadow: inset 0 0 100px 100px rgba(255, 255, 255, 0.1);
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
<div class="container">
<table class="t1" align="center">
		<tr>
		<th>
		<input disabled class="field1" value="Name" type="text">
		</th>
		<th>
		<input disabled class="field1" value="Registration No." type="text">
		</th>
		<th>
		<input disabled class="field1" value="Branch" type="text">
		</th>
		<th>
		<input disabled class="action" value="Action" type="text">
		</th>
		</tr>
		</table>
		<br>
<%
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps=con.prepareStatement("select * from student");
	ResultSet rs=ps.executeQuery();
	int i=0;
	while(rs.next())
	{
		if(i%2==0)
		{
		%>
		<form method="post" action="deletestudentaction.jsp">
		<table class="t1" align="center">
		<tr>
		<th>
		<input disabled required class="field" value="<%=rs.getString(1)%>" type="text" name="uname">
		</th>
		<th>
		<input disabled required class="field" value="<%=rs.getString(2)%>" type="text" name="uid">
		</th>
		<th>
		<input disabled required class="field" value="<%=rs.getString(4)%>" type="text" name="branch">
		</th>
		<th>
		<input class="submit" type="submit" value="Delete">
		<input type="hidden" value="<%=rs.getString(2)%>" name="usid">
		</th>
		</tr>
		</table>
		</form>
		<br>
		
		<%
		}
		else
		{
			%>
		<form method="post" action="deletestudentaction.jsp">
		<table class="t1" align="center">
<tr>
<th>
<input disabled required class="field2" value="<%=rs.getString(1)%>" type="text" name="uname">
</th>
<th>
<input disabled required class="field2" value="<%=rs.getString(2)%>" type="text" name="uid">
</th>
<th>
<input disabled required class="field2" value="<%=rs.getString(4)%>" type="text" name="branch">
</th>
<th>
<input class="submit" type="submit" value="Delete">
<input type="hidden" value="<%=rs.getString(2)%>" name="usid">
</th>
</tr>
</table>
		</form>
		<br>
			<%
		}
		++i;
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