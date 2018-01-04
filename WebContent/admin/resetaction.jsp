<html>
<head>
<title>Reset</title>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>
<body>
<%@page import="java.sql.*" %>
<%
String ses=(String)session.getAttribute("aid");
if(ses==null)
{
	response.sendRedirect("adminpanel.jsp");
}
ServletContext ob=getServletContext();
String reset=request.getParameter("hidden");
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try
{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	if(reset!=null)
	{
		PreparedStatement ps=con.prepareStatement("update student set status=0,result=0");
		ps.executeUpdate();	
		%>
		<script>
		alert("done");
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("resetexam.jsp");
		rd.include(request,response);
	}
	else
	{
		response.sendRedirect("resetexam.jsp");
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