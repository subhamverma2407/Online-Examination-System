<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>
<body>

<%@page import="java.sql.*"%>
<%
ServletContext ob=getServletContext();
String uid=request.getParameter("uid");
if(uid==null||uid=="")
{
	response.sendRedirect("studentpanel.jsp");
}
else
{
	String duser=ob.getInitParameter("duser");
	String dpass=ob.getInitParameter("dpass");
	String cpath=ob.getInitParameter("cpath");
	String connect=ob.getInitParameter("connect");
	String upass=request.getParameter("pass");
	try{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps=con.prepareStatement("select * from student where usid=? and pass=?");
	ps.setString(1,uid);
	ps.setString(2,upass);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String name=rs.getString(1);
		String pass=rs.getString(3);
		session.setAttribute("uname",name);
		session.setAttribute("uid",uid);
		session.setAttribute("upass",pass);
		response.sendRedirect("welcomestudent.jsp");
	}
	else
	{ 
		%>
		<script>
		document.getElementById("validate").innerHTML="Wrong Credentials!";
		</script>
		<% 
		RequestDispatcher rd=request.getRequestDispatcher("studentpanel.jsp");  
		rd.include(request,response); 
	}
	con.close();
	}
	catch(Exception e)
	{
	out.print(e);
	}
}
	%>
	</body>
	</html>