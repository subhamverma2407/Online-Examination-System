<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>
<body>

<%@ page import="java.sql.*"%>
<%
String start=request.getParameter("start");
String ses=(String)session.getAttribute("uid");
if(start==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("welcomestudent.jsp");
	rd.forward(request,response);
}
else
{
	session.setAttribute("ok","ok");
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
		PreparedStatement ps1=con.prepareStatement("update student set status=1 where usid=?");
		ps1.setString(1,ses);
		int update=ps1.executeUpdate();
		if(update==1)
		{
			response.sendRedirect("examine.jsp");
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