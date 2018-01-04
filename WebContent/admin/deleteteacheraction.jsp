<html>
<head>
<title>Delete Teacher</title>
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
String delete=request.getParameter("tid");
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try
{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps1=con.prepareStatement("delete from teacher where tid=?");
	ps1.setString(1,delete);
	int rs=ps1.executeUpdate();
	if(rs==1)
	{
		
		response.sendRedirect("deleteteacher.jsp");
		
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