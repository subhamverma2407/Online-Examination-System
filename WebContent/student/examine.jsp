<%@ page import="java.sql.*"%>
<%
String ok=(String)session.getAttribute("ok");
String ses=(String)session.getAttribute("uid");
if(ok==null)
{
response.sendRedirect("exam.jsp");
}
if(ses==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("studentpanel.jsp");
	rd.include(request,response);
}
try
{
Class.forName("oracle.jdbc.driver.OracleDriver"); %>
<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
<title>Take Exam</title>

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
  .field{
border: none;
font-weight:normal;
border-radius: 3px;
color: #5a5656;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 15px;
height: 25px;
outline: none;
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
   padding:10px;
   height:240px;
   width:300px;
   text-align:center;
   position:relative;
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
th{
text-align:left;
font-size:16px;
color:white;
font-weight:normal;
}
caption
{
text-align:center;
font-size:16px;
color:white;
font-weight:normal;
}
.submit{
   background-color:#4BB448;
border: none;
text-align:center;
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
<div class="para">
<form name="form1" method="post" action="examine.jsp">
<%int current =1;
int res=0;
if(request.getParameter("ua")!=null)
		{
		res=Integer.parseInt(request.getParameter("result"));
		}
if(request.getParameter("hidden")!=null)
{
	current = Integer.parseInt(request.getParameter("hidden"));
}
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","subham24");
Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs=statement.executeQuery("select * from examque");
if(current<1)
{
	current=1;
}
rs.last();
int rows=rs.getRow();
if(current<=rows)
{
	rs.absolute(current);
}
if(current>rows)
{
	
	session.setAttribute("result",res);
	session.setAttribute("done","done");
	response.sendRedirect("examined.jsp");
	res=0;
}
%>
<table class="t1">
<caption>Question <%=current%></caption>
<tr>
<th colspan="2">
<textarea readonly required rows="2" cols="60" name="que">
<%=rs.getString(2)%>
</textarea>
</th>
</tr>
<tr>
<th>
<input type="radio" name="radio" id="r1" value=" <%=rs.getString(3)%> " onClick="check()"> <%=rs.getString(3)%>
</th>
</tr>
<tr>
<th>
<input type="radio" name="radio" id="r2" value=" <%=rs.getString(4)%>" onClick="check()"> <%=rs.getString(4)%>
</th>
</tr>
<tr>
<th>
<input type="radio" name="radio" id="r3" value=" <%=rs.getString(5)%>" onClick="check()"> <%=rs.getString(5)%>
</th>
</tr>
<tr>
<th>
<input type="radio" name="radio" id="r4" value=" <%=rs.getString(6)%>" onClick="check()"> <%=rs.getString(6)%>
</th>
<th>
<input type="hidden" id="a" value="<%=rs.getString(7)%>">
</th>
</tr>
</table>
<br>
<input type="hidden" name="ures"> 
<input type="hidden" name="ua" value="0">
<input type="hidden" name="hidden" value="<%=current%>">
<input type="hidden" name="result" value="<%=res%>">
<table align="center">
<tr>
<th style="text-align:center;" colspan="2">
<input class="submit" type="button" value="Next" onClick="moveNext()">
</th>
</tr>
</table>
</form>
</div>
<script type="text/javascript">
function check()
{
	var ans;
if(document.getElementById('r1').checked)
	{
	ans=document.getElementById('r1').value;
	}
	if(document.getElementById('r2').checked)
	{
	ans=document.getElementById('r2').value;
	}
	if(document.getElementById('r3').checked)
	{
	ans=document.getElementById('r3').value;
	}
	if(document.getElementById('r4').checked)
	{
	ans=document.getElementById('r4').value;
	}
	document.form1.ures.value=ans;
}
function moveNext()
{
	var counter=0;
	var marks=0;
	if((document.form1.ures.value).match(document.getElementById("a").value))
		{
		marks=parseInt(document.form1.result.value)+2;
		document.form1.result.value=marks;
		}
	counter=parseInt(document.form1.hidden.value)+1;
	document.form1.hidden.value=counter;
	form1.submit();
	
}
</script>
<%
con.close();
}
catch(Exception e)
{
	out.print(e);
}
%>
</body>
</html>
