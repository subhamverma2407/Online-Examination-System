<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="images/favicon-16x16.png" sizes="16x16" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" 
name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<script src="scripts/jquery-3.2.1.min.js"></script>
<script>
function go(page)
{
document.getElementById("f").action=page;
document.getElementById("f").submit();
}
</script>
<style>
@import url("css/home.css");
</style>
</head>
<body> 
<div id="background"></div>
<div class="lb"><h1 style="color:#ffef5e;" align="center">Online Examination System</h1>
</div>
<div class="bcg">
<div class ="a">
<form id="f">
<table align="center" class="tb">
<tr>
<th><img class="image" onclick="go('student/studentpanel.jsp')" src="images/11.png"></th>
<th><img class="image" onclick="go('teacher/teacherpanel.jsp')" src="images/2111.png"></th>
<th><img class="image" onclick="go('admin/adminpanel.jsp')" src="images/32.png"></th>
</tr>
<tr>
<th>Student</th>
<th>Teacher</th>
<th>Admin</th>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>