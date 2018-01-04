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

String name=request.getParameter("nm");
String pas=request.getParameter("ps");
String dob=request.getParameter("dob");
String phno=request.getParameter("phno");
String mail=request.getParameter("ml");

ServletContext ob=getServletContext();

String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try
{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps=con.prepareStatement("UPDATE teacher SET tname=?,pass=?,dob=?,phno=?,email=? where tid=?");
	ps.setString(1,name);
	if(pas==null||pas=="")
	{
		ps.setString(2,sespass);	
	}
	else
	{
		ps.setString(2,pas);
	}
	ps.setString(3,dob);
	ps.setString(4,phno);
	ps.setString(5,mail);
	ps.setString(6,ses);
	int rs=ps.executeUpdate();
	if(rs==1)
	{
		%><script>
		alert("Profile Updated! You need to login again");
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("teacherpanel.jsp");
		rd.include(request,response);
		session.invalidate();
	}
	else{
		
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