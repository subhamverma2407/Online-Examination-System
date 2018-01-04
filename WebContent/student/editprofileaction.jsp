
<%@page import="java.sql.*" %>
<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>

<body>
<%
String ses=(String)session.getAttribute("uid");
String sespass=(String)session.getAttribute("upass");
String password;
if(ses==null)
{
	response.sendRedirect("studentpanel.jsp");
}
String name=request.getParameter("nm");
if(name==null||name=="")
{
	response.sendRedirect("checkprofile.jsp");
}
else{

String pas=request.getParameter("ps");
String branch=request.getParameter("br");
String dob=request.getParameter("dob");
String phno=request.getParameter("phno");
String mail=request.getParameter("ml");
if(pas==null||pas=="")
{
	password=sespass;
}
else
	{
	password=pas;
	}
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","subham24");
	PreparedStatement ps=con.prepareStatement("update student set uname=?,pass=?,branch=?,dob=?,phno=?,email=? where usid=?");
	ps.setString(1,name);
	ps.setString(2,password);
	ps.setString(3,branch);
	ps.setString(4,dob);
	ps.setString(5,phno);
	ps.setString(6,mail);
	ps.setString(7,ses);
	int rs=ps.executeUpdate();
	if(rs==1)
	{
		%><script>
		alert("Profile Updated! You need to login again");
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("studentpanel.jsp");
		rd.include(request,response);
		session.invalidate();
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