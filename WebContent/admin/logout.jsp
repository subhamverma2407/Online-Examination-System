<html>
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
</head>
<body>
<% 
session.invalidate();
%>
<script>
document.getElementById("validate").innerHTML="Successfully Logged Out!";
</script>
<%
RequestDispatcher rd =request.getRequestDispatcher("adminpanel.jsp");
rd.include(request,response);
%>
</body>
</html>