<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Register</title>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>
<body>
<%
String name=request.getParameter("nm");
String tid=request.getParameter("tid");
String pass=request.getParameter("ps");
String dob=request.getParameter("dob");
String phno=request.getParameter("phno");
String mail=request.getParameter("ml");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","subham24");
	PreparedStatement ps=con.prepareStatement("insert into teacher values(?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,tid);
	ps.setString(3,pass);
	ps.setString(4,dob);
	ps.setString(5,phno);
	ps.setString(6,mail);
	int res=ps.executeUpdate();
	if(res==1)
	{
		%>
		<script>
		document.getElementById("validate").innerHTML="Successfuly Registered!";
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("teacherregister.jsp");
		rd.include(request,response);
	}
	else{
		%>
		<script>
		document.getElementById("validate").innerHTML="Teacher Already Exist!";
		</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("teacherregister.jsp");
		rd.include(request,response);
	}
	con.close();
}
catch(Exception e)
{
%>
<script>
document.getElementById("validate").innerHTML="Teacher Already Exist!";
</script>
<%
RequestDispatcher rd=request.getRequestDispatcher("teacherregister.jsp");
rd.include(request,response);
}
%>
</body>
</html>