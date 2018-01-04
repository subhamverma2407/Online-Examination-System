<html>
<head>
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
String tid=request.getParameter("tid");
String tpass=request.getParameter("pass");
try{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps=con.prepareStatement("select * from teacher where tid=? and pass=?");
	ps.setString(1,tid);
	ps.setString(2,tpass);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String name=rs.getString(1);
		String pass=rs.getString(3);
		session.setAttribute("tname",name);
		session.setAttribute("tid",tid);
		session.setAttribute("tpass",pass);
		response.sendRedirect("welcometeacher.jsp");
	}
	else
	{ 
		%>
		<script>
		document.getElementById("validate").innerHTML="Wrong Credentials!";
		</script>
		<% 
		RequestDispatcher rd=request.getRequestDispatcher("teacherpanel.jsp");  
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