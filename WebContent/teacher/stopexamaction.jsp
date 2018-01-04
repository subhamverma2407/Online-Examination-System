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
String stop=request.getParameter("stop");
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
if(stop!=null)
{
try
{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps=con.prepareStatement("select * from exam");
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		if(rs.getInt(1)==1)
		{
			PreparedStatement ps1=con.prepareStatement("update exam set examstate=0");
			ps1.executeUpdate();
			
				%>
				<script>
				document.getElementById("validate").innerHTML="Exam Stopped";
				</script>
				<%
				RequestDispatcher rd=request.getRequestDispatcher("exam.jsp");
				rd.include(request,response);
		}
		else{
			%>
			<script>
			document.getElementById("validate").innerHTML="Exam Not Started Yet";
			</script>
			<%
			RequestDispatcher rd=request.getRequestDispatcher("exam.jsp");
			rd.include(request,response);
			
		}
	}
	
	con.close();
	}
	catch(Exception e)
	{
		out.print(e);
	}
}
else
{
	response.sendRedirect("exam.jsp");
}
	%>
	
	</body>
	</html>