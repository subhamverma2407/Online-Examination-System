<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>
<body>
<%@page import="java.sql.*" %>
<%
String ses=(String)session.getAttribute("tid");
String sespass=(String)session.getAttribute("tpass");

if(ses==null)
{
	response.sendRedirect("teacherpanel.jsp");
}
int delete=Integer.parseInt(request.getParameter("delete"));
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try
{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps1=con.prepareStatement("delete from examque where qid=?");
	ps1.setInt(1,delete);
	int rs=ps1.executeUpdate();
	if(rs==1)
	{
		%>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("deletequestion.jsp");
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