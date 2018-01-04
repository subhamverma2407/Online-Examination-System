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
int edit=Integer.parseInt(request.getParameter("edit"));
String que=request.getParameter("que");
String opt1=request.getParameter("opt1");
String opt2=request.getParameter("opt2");
String opt3=request.getParameter("opt3");
String opt4=request.getParameter("opt4");
String answer=request.getParameter("ans");
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try
{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
 	PreparedStatement ps=con.prepareStatement("update examque set que=?,opt1=?,opt2=?,opt3=?,opt4=?,ans=? where qid=?");
	ps.setString(1,que);
	ps.setString(2,opt1);
	ps.setString(3,opt2);
	ps.setString(4,opt3);
	ps.setString(5,opt4);
	ps.setString(6,answer);	
	ps.setInt(7,edit);
	int rs=ps.executeUpdate();
	if(rs==1)
	{
		%>
		<script>
		alert("edited");
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("editquestion.jsp");
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