<html>
<head>
<title>Admin Panel</title>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>
<body>
<%@page import="java.sql.*"%>
<%
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
String aid=request.getParameter("aid");
String apass=request.getParameter("apass");
try{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps=con.prepareStatement("select * from admin where aid=? and pass=?");
	ps.setString(1,aid);
	ps.setString(2,apass);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{

		session.setAttribute("aid",aid);
		response.sendRedirect("welcomeadmin.jsp");
	}
	else
	{ 
		%>
		<script>
		document.getElementById("validate").innerHTML="Wrong Credentials!";
		</script>
		<% 
		RequestDispatcher rd=request.getRequestDispatcher("adminpanel.jsp");  
		rd.include(request,response); 
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