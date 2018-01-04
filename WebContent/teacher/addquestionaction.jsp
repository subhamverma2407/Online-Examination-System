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
String que=request.getParameter("que");
String opt1=request.getParameter("opt1");
String opt2=request.getParameter("opt2");
String opt3=request.getParameter("opt3");
String opt4=request.getParameter("opt4");
String ans=request.getParameter("ans");
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try
{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps1=con.prepareStatement("select max(qid) from examque");
	ResultSet rs=ps1.executeQuery();
	int id=0;
	if(rs.next())
	{
		id=rs.getInt(1)+1;
	}
	else
	{
		id=1;
	}	
 	PreparedStatement ps=con.prepareStatement("insert into examque values(?,?,?,?,?,?,?)");
	ps.setInt(1,id);
	ps.setString(2,que);
	ps.setString(3,opt1);
	ps.setString(4,opt2);
	ps.setString(5,opt3);
	ps.setString(6,opt4);
	ps.setString(7,ans);
	int res=ps.executeUpdate();
	if(res!=0)
	{
		%>
		<script>
		alert("Added!");
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("addquestion.jsp");
		rd.include(request,response);
	}
	else{
		%>
		<script>
		alert("Not Added, Try Again!");
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("addquestion.jsp");
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