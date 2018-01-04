
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>
<body>

<%@page import="java.sql.*" %>
<%
String ses=(String)session.getAttribute("uid");
String sespass=(String)session.getAttribute("upass");
if(ses==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("studentpanel.jsp");
	rd.include(request,response);
}
String check=request.getParameter("check");
if(check==null||check=="")
{
	response.sendRedirect("checkprofile.jsp");
}
else{
	

String pass=(String)session.getAttribute("upass");

			if(check.equals(pass))
			{	
				String chk="chk";
				session.setAttribute("chk",chk);
				response.sendRedirect("editprofile.jsp");
			}
			else
			{
				%>
			<script>
			document.getElementById("val").innerHTML="Wrong Password";
			</script>
			<%
			RequestDispatcher rd=request.getRequestDispatcher("checkprofile.jsp");
			rd.include(request,response);
			
			}
}
%>
</body>
</html>