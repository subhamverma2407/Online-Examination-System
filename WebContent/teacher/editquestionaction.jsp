<%@page import="java.sql.*" %>
<%
String ses=(String)session.getAttribute("tid");
String sespass=(String)session.getAttribute("tpass");
String sesname=(String)session.getAttribute("tname");

if(ses==null)
{
	response.sendRedirect("teacherpanel.jsp");
}
%>
<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
 <title>Edit Question</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
  
  
  .container{
	position:relative;
  width:70%;
 	top:100px;
 	
  }
  .para{
  font-family: 'Open Sans', Arial, Helvetica, sans-serif;
  background-color:rgba(0,0,0,0.7);
  color:black;
  border-radius:10px;
  border:1px solid #696969;
  position:relative;
  top:150px;
  width:900px;
  padding:30px;
  margin:0 auto;
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
   padding:10px;
   height:400px;
   width:600px;
   text-align:center;
   position:relative;
   }
   
.field{
border: none;
font-weight:normal;
border-radius: 3px;
color: #5a5656;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 15px;
height: 30px;
outline: none;
padding: 0px 10px;
}
th,caption{
text-align:center;
font-size:16px;
color:white;
font-weight:normal;
}
textarea{
   resize:none;
   outline:none;
   color: #5a5656;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
   border-radius:5px;
   padding: 10px;
   
   }
   .submit{
   background-color:#008dde;
border: none;
border-radius: 5px;
color: #f4f4f4;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 40px;
width:330px;
outline:none;
   }
   .submit:hover{
   filter:opacity(0.7);
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
         <span class="glyphicon glyphicon-cog"></span> <%out.print(sesname);%></a>
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

<%
int edit=Integer.parseInt(request.getParameter("edit"));
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try
{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
 	PreparedStatement ps=con.prepareStatement("select * from examque where qid=?");
	ps.setInt(1,edit);
ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
		
		<div class="para" align="center">
<form action="edited.jsp" method="POST">
<table class="t1" align="center">
<caption>Question</caption>
<tr>
<th style="text-align:center;">
<textarea required rows="3" cols="80" name="que" >
<%=rs.getString(2)%>
</textarea>
</th>
</tr>
<tr>
<th>
option A <input required class="field" id="1" value="<%=rs.getString(3)%>"  type="text" name="opt1">
</th>
<tr>
<th>
option B <input required class="field" id="2" value="<%=rs.getString(4)%>" type="text" name="opt2">
</th>
</tr>
<tr>
<th>
option C <input required class="field" id="3" value="<%=rs.getString(5)%>"  type="text" name="opt3">
</th>
</tr>
<tr>
<th>
option D <input required class="field" id="4" value="<%=rs.getString(6)%>" type="text" name="opt4">
<input type="hidden" name="edit" value="<%=rs.getInt(1)%>">
</th>
</tr>
<tr>
<th>
Old Answer
<input type="text" disabled value="<%=rs.getString(7)%>" class="field">
</th>
</tr>
<tr>
<th colspan="2">
New Answer
</th>
</tr> 
<tr>
<th>
A.<input required  type="radio" id="r1" name="ans" onClick="option()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B.<input id="r2" required  type="radio" name="ans" onClick="option()">
</th>
</tr>
<tr>
<th>
C.<input required  id="r3" type="radio" name="ans" onClick="option()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D.<input required id="r4"  type="radio" name="ans" onClick="option()">
<script type="text/javascript">
function option()
	{
		if(document.getElementById("r1").checked)
			{
			document.getElementById("r1").value=document.getElementById("1").value;
			}
		if(document.getElementById("r2").checked)
		{
		document.getElementById("r2").value=document.getElementById("2").value;
		}
		if(document.getElementById("r3").checked)
		{
		document.getElementById("r3").value=document.getElementById("3").value;
		}
		if(document.getElementById("r4").checked)
		{
		document.getElementById("r4").value=document.getElementById("4").value;
		}
	}
	</script>
</th>
</tr>
<tr>
<th style="text-align:center">
<input class="submit" type="submit" value="Submit">
</th>
</tr>
</table>
</form>
</div>
		
		<%
	}
	con.close();
}
catch(Exception e)
{
	out.print(e);
}
%>
</body>
</html>