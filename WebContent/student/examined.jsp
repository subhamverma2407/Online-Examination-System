<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>
<body>

<%@ page import="java.sql.*"%>
<%
session.removeAttribute("ok");
String ses=(String)session.getAttribute("uid");
if(ses==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("studentpanel.jsp");
	rd.include(request,response);
}
String done=(String)session.getAttribute("done");

if(done==null)
{
	response.sendRedirect("exam.jsp");
	
}

else
{
	int result=(Integer)session.getAttribute("result");

String delete=request.getParameter("delete");
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try
{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps=con.prepareStatement("update student set result=? where usid=?");
	ps.setInt(1,result);
	ps.setString(2,ses);
	ps.executeUpdate();
	response.sendRedirect("result.jsp");
	session.removeAttribute("result");
	session.removeAttribute("done");
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