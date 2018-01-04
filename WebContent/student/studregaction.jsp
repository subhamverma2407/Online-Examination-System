<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Register</title>
</head>
<body>
<%
String name=request.getParameter("nm");
if(name==null||name=="")
{
	response.sendRedirect("studregister.jsp");
}
else
{
String regno=request.getParameter("rn");
String pass=request.getParameter("ps");
String branch=request.getParameter("br");
String dob=request.getParameter("dob");
String phno=request.getParameter("phno");
String mail=request.getParameter("ml");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","subham24");
	PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,regno);
	ps.setString(3,pass);
	ps.setString(4,branch);
	ps.setString(5,dob);
	ps.setString(6,phno);
	ps.setString(7,mail);
	ps.setInt(8,0);
	ps.setInt(9,0);
	int res=ps.executeUpdate();
	if(res==1)
	{
		%>
		<script>
		document.getElementById("validate").innerHTML="Successfuly Registered!";
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("studregister.jsp");
		rd.include(request,response);
	}
	else{
		%>
		<script>
		document.getElementById("validate").innerHTML="User Already Exist!";
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("studregister.jsp");
		rd.include(request,response);
	}
	con.close();
}
catch(Exception e)
{
%>
<script>
document.getElementById("validate").innerHTML="User Already Exist!";
</script>
<%
RequestDispatcher rd=request.getRequestDispatcher("studregister.jsp");
rd.include(request,response);
}
}
%>
</body>
</html>