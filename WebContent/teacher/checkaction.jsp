
<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<%@page import="java.sql.*" %>
<%
String ses=(String)session.getAttribute("tid");
String sespass=(String)session.getAttribute("tpass");
if(ses==null)
	response.sendRedirect("teacherpanel.jsp");
String pass=(String)session.getAttribute("tpass");
String check=request.getParameter("check");
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
	
%>
</body>
</html>